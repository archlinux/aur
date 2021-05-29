# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Phillip Smith <pkgbuild@phs.id.au>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=freeipmi
pkgver=1.6.8
pkgrel=2
pkgdesc="IPMI remote console and system management software"
arch=('x86_64' 'aarch64')
url="https://www.gnu.org/software/freeipmi"
license=('GPL')
depends=('libgcrypt')
provides=(
  'libipmimonitoring.so=6'
  'libipmidetect.so=0'
  'libipmiconsole.so=2'
  'libfreeipmi.so=17'
)
backup=(
  "etc/$pkgname/$pkgname.conf"
  "etc/$pkgname/${pkgname}_interpret_sel.conf"
  "etc/$pkgname/${pkgname}_interpret_sensor.conf"
  "etc/$pkgname/ipmidetect.conf"
  "etc/$pkgname/ipmidetectd.conf"
  "etc/$pkgname/ipmiseld.conf"
  "etc/$pkgname/libipmiconsole.conf"
)
options=('!libtool')
source=("https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz"{,.sig}
        'tmpfiles.conf'
        '0001-configure-support-with-systemconfigdir-option.patch')

b2sums=('afe3238955786b13aae0e0062028f5c969a8e686b46bea3850696361355b3bd82a55bd93523ea7fe2223fe5bb04922c26b46023f783bd879bbd01e34ffd6d59e'
        'SKIP'
        '5354e0b716b0806ac6f82dbbae533cb86f302d1952b948df6b5ab5bd41bf194ec927c9c39fd4d5969c2f4de8cfdbf3b66a4a1c1faaee4e5768201eaef83ca991'
        '3afcd95716b61a7d542193e78e6fe3598711b7641c98c771d01aacb3bb6c94112a6df78236c27d15879a51da5a4b6b2ad3fcfacbd380fce3cdfafc826197fcc8')
validpgpkeys=('A865A9FB6F0387624468543A3EFB7C4BE8303927') # Albert Chu <chu11@llnl.gov>

prepare() {
  cd "$pkgname-$pkgver"

  # apply upstream patch fixing config dir
  patch --forward --strip=1 --input="$srcdir/0001-configure-support-with-systemconfigdir-option.patch"
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -vi

  if [[ "$CARCH" == "x86_64" ]]; then
  ./configure \
    --prefix=/usr \
    --exec-prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --disable-init-scripts \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-systemconfigdir=/etc/conf.d
  else
  ./configure \
    --prefix=/usr \
    --exec-prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin \
    --disable-init-scripts \
    --with-systemdsystemunitdir=/usr/lib/systemd/system \
    --with-systemconfigdir=/etc/conf.d \
    --build-arm

  fi

  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # systemd-tmpfiles integration
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # delete cache
  rm -rf "$pkgdir/var/cache"
}
