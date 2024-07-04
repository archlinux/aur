# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: jjacky
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_pkgname=pmount
pkgname=$_pkgname-safe-removal
pkgver=0.9.23
pkgrel=10
pkgdesc="mount removable devices as normal user, with safe removal of device"
arch=(i686 x86_64)
license=('GPL-2.0-or-later')
url="https://packages.qa.debian.org/p/pmount.html"
backup=('etc/pmount.allow')
depends=('glibc' 'util-linux-libs')
makedepends=('intltool')
provides=("pmount=$pkgver")
conflicts=('pmount')
source=(http://ftp.de.debian.org/debian/pool/main/p/pmount/pmount_$pkgver.orig.tar.bz2
        patch)
md5sums=('db19f5bf3151b1b41705ec7bafa439d3'
         'a1c8ef20e809ab63b7f89d2c68b05620')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ../patch
  CFLAGS="${CFLAGS} -Wno-error=implicit-function-declaration -Wno-error=return-mismatch" \
  ./configure --prefix=/usr --disable-hal \
      --with-cryptsetup-prog=/usr/bin/cryptsetup
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -dm755 "$pkgdir"/media
}
