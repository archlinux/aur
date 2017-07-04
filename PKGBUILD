pkgname=sks
pkgver=1.1.6
pkgrel=2
arch=('i686' 'x86_64')
license=('GPL')
pkgdesc='Synchronizing OpenPGP Key Server'
makedepends=('ocaml' 'db' 'camlp4')
url='https://bitbucket.org/skskeyserver/sks-keyserver/'
install='sks.install'
backup=('etc/sks/sksconf'
        'etc/sks/forward.exim'
        'etc/sks/forward.postfix'
        'etc/sks/mailsync'
        'etc/sks/membership'
        'etc/sks/procmail')
source=(
  https://bitbucket.org/skskeyserver/sks-keyserver/downloads/${pkgname}-${pkgver}.tgz{,.asc}
  '500_debian_fhs.patch'
  'sks-db.service'
  'sks-recon.service'
  'cryptokit-1.7-sks-uint32.patch')
sha512sums=(
  'f7c54194274834840b9701bf827b81add0f807dd4c6019968a6b0c755c9117519433ebb1161da38d23c465b163dd31a766700023afa13174e4dc82542fa98099'
  SKIP
  '0fd57ccd86f289cf51638995555988a572ee00d6f28f3797092ffda19a0f668ee950be1ef381e94c64301db2dd1ad308834a45b7eaec148e9d8c01ed0a1829bc'
  '5628e6a0065ec9bab4df84e77bed0af51379e70021543dfee4d4181f55b2779735fcea7848b51e2ab555f9f988da5aff8f0f15e522b801d7330e4bb2e53701fc'
  '41352e9862996170c70ed8e546ad89e26c94bf3c4ef7e91b64f330273b94c2666cf3f11f13a54e66b1a29b3ef46b75c8c6dfbe49fe12e2b11451e8311faf68a9'
  '6ee333ce8aec0b103a36be376da43a569ed455f554fe853d007afc1d2e3a30d29735f515d22646832a8b4efa1ffdbfadb4a85ec22f2e5159180fc8373252c171'
)
validpgpkeys=(C90EF1430B3AC0DFD00E6EA541259773973A612A) # SKS Keyserver Signing Key


prepare() {
  cd "$pkgname-$pkgver"

  # patch path
  patch -Np1 -i "$srcdir/500_debian_fhs.patch"

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
