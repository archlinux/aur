# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=spectral-matrix
_pkgname=spectral
pkgver=817
pkgrel=1
_commit_sortfilterproxymodel="36befddf5d57faad990e72c88c5844794f274145"
pkgdesc='Glossy cross-platform client for Matrix'
url='https://gitlab.com/spectral-im/spectral'
arch=('any')
license=('GPL3')
conflicts=('spectral-matrix-git')
depends=('qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools' 'qtkeychain' 'libquotient-git' 'libqtolm-git')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/spectral-im/spectral/-/archive/$pkgver/spectral-$pkgver.tar.gz"
		"SortFilterProxyModel-$_commit_sortfilterproxymodel.tar.gz::https://github.com/oKcerG/SortFilterProxyModel/archive/$_commit_sortfilterproxymodel.tar.gz")
sha256sums=('6888ad58282eb5baab83d7037423d22b6c2d5be60f8452168b57b39b53e6ca0d'
			'1f5a6c64f793e7d74e8922e071392cf33baa4e7457e70f396c1e1fcb9d63b378')
_builddir="$_pkgname-$pkgver"

prepare() {
	cd "$_builddir"
	rmdir \
		include/libQuotient \
		include/SortFilterProxyModel
	mv ../SortFilterProxyModel-$_commit_sortfilterproxymodel include/SortFilterProxyModel
}

build() {
  cd "$_builddir"
  cmake -B build \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DUSE_INTREE_LIBQMC=false \
	-DGIT_FOUND=false
  make -C build
}

package() {
	cd "$_builddir"
	make -C build DESTDIR="$pkgdir" install
}
