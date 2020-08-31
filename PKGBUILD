pkgname=sks
pkgver=1.1.6
pkgrel=4
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Synchronizing OpenPGP Key Server'
makedepends=('ocaml<4.06' 'db' 'camlp4<4.06')
url='https://bitbucket.org/skskeyserver/sks-keyserver/'
install='sks.install'
backup=('etc/sks/sksconf'
        'etc/sks/forward.exim'
        'etc/sks/forward.postfix'
        'etc/sks/mailsync'
        'etc/sks/membership'
        'etc/sks/procmail')
source=(
  https://github.com/SKS-Keyserver/sks-keyserver/releases/download/${pkgver}/${pkgname}-${pkgver}.tgz{,.asc}
  '500_debian_fhs.patch'
  'sks-db.service'
  'sks-recon.service'
  'cryptokit-1.7-sks-uint32.patch'
  'debian_eventloopfix.patch'
  )
sha512sums=(
  'f7c54194274834840b9701bf827b81add0f807dd4c6019968a6b0c755c9117519433ebb1161da38d23c465b163dd31a766700023afa13174e4dc82542fa98099' SKIP
  '0fd57ccd86f289cf51638995555988a572ee00d6f28f3797092ffda19a0f668ee950be1ef381e94c64301db2dd1ad308834a45b7eaec148e9d8c01ed0a1829bc'
  'cc10998ac8a072bdd35d22438aa1a4bfb5eda2271887c3f1bb1dc0ee6029228201dd903f36580df43552ad6c8227012f039ed5353147a00d61a05bd5c4333695'
  '615ac9237359e89332bbaeabe7f36ba1e33877d1b06f8c302fd3af8faa0eee0d785714405a26b92859b9d3fddb4cd708ca0c343db8e4b8c5ffe16323338323bb'
  '6ee333ce8aec0b103a36be376da43a569ed455f554fe853d007afc1d2e3a30d29735f515d22646832a8b4efa1ffdbfadb4a85ec22f2e5159180fc8373252c171'
  '9463538f5668cdd41b25c43e31a2621e1c0953430b8dde84e54be4a45aa3f9ffbfcd270c83583df2a5462163eaf014fee3c3ed49f436faf71db7e87db88626b4'
)
validpgpkeys=(C90EF1430B3AC0DFD00E6EA541259773973A612A) # SKS Keyserver Signing Key


prepare() {
  cd "$pkgname-$pkgver"

  # patch path
  patch -Np1 -i "$srcdir/500_debian_fhs.patch"
  patch -Np1 -i "$srcdir/debian_eventloopfix.patch"

  cp Makefile.local.unused Makefile.local

  # XXX Due to how ocaml package is generated in arch, we cannot link
  # dynamically, so we workarround the problem using runtime-variant _pic
  # More info:
  #   - https://wiki.ubuntu.com/SteveBeattie/PIENotes#Incompatible_relocation_R_X86_64_32
  #   - https://bugs.archlinux.org/task/42748
  #   - http://caml.inria.fr/mantis/view.php?id=6693
  echo "OCAMLOPT=ocamlopt -runtime-variant _pic" >> Makefile.local

  sed -i -e 's#LIBDB=-ldb-4.6#LIBDB=-ldb-5.3#g' Makefile.local
  sed -i -e "s#/usr/local#$pkgdir/usr#g" Makefile.local
  sed -i -e "s#/usr/share/man#$pkgdir/usr/share/man#g" Makefile.local
}

build() {
  cd "$pkgname-$pkgver"
  unset MAKEFLAGS
  make dep
  make "cryptokit-1.7/README.txt"

  patch -Np0 -i "$srcdir/cryptokit-1.7-sks-uint32.patch"

  # XXX Parallel compiling not supporting for Bdb module, force -j1 always.
  make CFLAGS="$CFLAGS -I`ocamlc -where` -I ." -j1 all
}

package() {
  cd "$pkgname-$pkgver"

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man" install

  install -Dm644 "$srcdir/sks-db.service" "$pkgdir/usr/lib/systemd/system/sks-db.service"
  install -Dm644 "$srcdir/sks-recon.service" "$pkgdir/usr/lib/systemd/system/sks-recon.service"

  mkdir -p "$pkgdir/etc" "$pkgdir/var/lib/sks"

  cp -r sampleWeb/OpenPKG "$pkgdir/var/lib/sks"
  cp -r sampleConfig/debian "$pkgdir/etc/sks"

  sed -i -e 's#/usr/lib/sendmail#/usr/sbin/sendmail#g' "$pkgdir/etc/sks/sksconf"
}
