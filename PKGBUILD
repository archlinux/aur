# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=1.2.2
_ver=v$pkgver
pkgrel=1
pkgdesc="Handle documents like quotes and invoices in your small business."
arch=('x86_64')
url="http://www.volle-kraft-voraus.de/"
license=('GPL-2.0-only')
depends=(
	'qt5-base' 'qt5-svg' 'grantlee' 'kcontacts5' 'ki18n5' 'ctemplate'
)
optdepends=(
	'python-reportlab: default PDF generator'
	'python-pypdf2: default PDF generator'
	'python-weasyprint: alternative PDF generator'
)
makedepends=('cmake' 'extra-cmake-modules' 'asciidoctor' 'po4a')
source=(
  "kraft-v${pkgver}.tar.gz::https://github.com/dragotin/kraft/archive/${_ver}.tar.gz"
  "0002-optional-akonadi-contact.patch"
)
sha256sums=('a1b556d89fb42853e0c085dd47d19546f9dfd70a0f58e161cc56fa4d5555190e'
            '6220650c3d34cb71d1b9df476aaa3f8e8041b118440c158352a4114a55e9e679')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for s in "${source[@]}"
  do
          case "$s" in
                  (*.patch)
			  echo $s
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
