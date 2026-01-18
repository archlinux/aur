# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=2.0.0
_ver=v$pkgver
pkgrel=1
pkgdesc="Handle documents like quotes and invoices in your small business."
arch=('x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL-2.0-only')
depends=(
	'qt6-base' 'qt6-svg' 'kcontacts' 'ki18n' 'ktexttemplate' 'akonadi-contacts'
)
optdepends=(
	'python-weasyprint: default PDF generator'
	'python-pypdf: alternative PDF generator'
)
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "kraft-v${pkgver}.tar.gz::https://github.com/dragotin/kraft/archive/${_ver}.tar.gz"
)
sha256sums=('8da453c62a54ad67c711a295a4d562cf856a95253eade1701e0945a83da28571')

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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  QT_QPA_PLATFORM=offscreen make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}
