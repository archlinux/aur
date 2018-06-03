# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>
# Maintainer: mar77i <mysatyre at gmail dot com>

pkgname=qosmic
pkgver=1.6.0
pkgrel=1
pkgdesc="An application for creating, editing, and rendering flam3 fractal images"
arch=('i686' 'x86_64')
url="https://github.com/bitsed/qosmic"
license=('GPL')
depends=('qt5-base' 'lua52' 'flam3')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/bitsed/qosmic/archive/v${pkgver}.tar.gz"
	# See https://github.com/tora-tool/tora/commit/afbff9ec3b93f0e90f02953d1bdd859a0f9a72ab
	# for a similar bug
	"missing-qbuttongroup-include.patch"
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "${srcdir}/missing-qbuttongroup-include.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt5
  # https://github.com/bitsed/qosmic/issues/28
  sed -i '/^DEFINES/ s/$/ -DLUA_COMPAT_5_2/' Makefile
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make INSTALL_ROOT="$pkgdir" install
}

md5sums=('32b399b1e652c01f324148bc5d4ac9bb'
         'fa31e897efe015af5e3829771e7cb487')
