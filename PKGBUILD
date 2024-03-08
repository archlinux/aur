# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=1.1
_ver=v$pkgver
pkgrel=2
pkgdesc="Kraft helps you to handle documents like quotes and invoices in your small business."
arch=('x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL')
depends=(
	'akonadi-contacts5' 'akonadi' 'ctemplate'
)
optdepends=(
	'python-reportlab: default PDF generator'
	'python-pypdf2: default PDF generator'
	'python-weasyprint: alternative PDF generator'
)
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "kraft-v${pkgver}.tar.gz::https://github.com/dragotin/kraft/archive/${_ver}.tar.gz"
)


prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
                          patch -p1 < "${srcdir}/${s}"
          esac
  done

  echo "$pkgver-$pkgrel" > .tag

  rm -rf build
  mkdir -p build
  cd build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ".." \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('c0732dc8b91167427b2ef9bcd69a5cf99d0db4eb81bb8ee888d2bfa592a2893b')
