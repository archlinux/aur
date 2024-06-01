# Maintainer:  Thomas Weißschuh <thomas t-8ch de>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: shamrok <szamrok@gmail.com>

pkgname=kraft
pkgver=1.2.1
_ver=v$pkgver
pkgrel=3
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
  "0001-Abort-Akonadi-start-if-it-is-already-broken.patch"
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

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  QT_QPA_PLATFORM=offscreen make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make "DESTDIR=${pkgdir}" install
}

sha256sums=('26f8e3ff7d12c86846b6db49ce171af31115f66119f9a7cce13de15f1397dd64'
            'ff802760ded75c6d511bda5c9f0a35a3756d2b0c8b6e09a73eb4e915acdada67')
