# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Motohiro Ueki <ueki.com@gmail.com>
# Contributor: nkoizu <nkoizu@gmail.com>

pkgname=gauche
pkgver=0.9.15
pkgrel=3
url='https://practical-scheme.net/gauche/'
arch=(x86_64)
pkgdesc='R7RS Scheme implementation (includes gosh)'
depends=(libatomic_ops libxcrypt slib mbedtls)
optdepends=(gdbm)
makedepends=()
license=(BSD)
_info_page_date='24 Apr 2024 10:10' # For reproducible builds
source=("https://github.com/shirok/Gauche/releases/download/release${pkgver//./_}/Gauche-${pkgver}.tgz")
b2sums=('1b4cbc764ea3af78bc736ce9a8ff083318366fbf3197ebc5060222b8df93ed426ca4b3b90402cd604e110bcfa8fb46c0d4c5f35be39899cc89dc82a671372bf9')

build() {
  cd Gauche-$pkgver
  BUILD_GOSH=/usr/bin/gosh
  CFLAGS+=' -ffat-lto-objects -w'
  ./configure --prefix=/usr --with-slib=/usr/share/slib --with-tls=mbedtls
  make

  # Make sure the catalog file for slib is created.
  # TODO: Better to use a hook to update after the installation?
  # s.a. src/Gauche/lib/Makefile.in
  make slibcat-in-place
}

# There are known failing tests, so skip for now. Should be fixed in Gauche
# 0.9.16
# s.a. https://github.com/shirok/Gauche/issues/1044
#
# check() {
#   cd Gauche-$pkgver

#   make -k check
# }

package() {
  cd Gauche-$pkgver
  make DESTDIR="$pkgdir" install-pkg install-doc
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  touch -d "$_info_page_date" "$pkgdir"/usr/share/info/gauche-ref*info*.gz
}
