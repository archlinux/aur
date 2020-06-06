# Maintainer: TBK <aur at jjtc dot eu>
# Contributor: TBK <aur at jjtc dot eu>

pkgname=spectral-matrix
_pkgname=spectral
pkgver=854
pkgrel=2
_commit_sortfilterproxymodel="6678acc67c4fce90851e7ee7602b4350b6b4c15b"
pkgdesc='Glossy cross-platform client for Matrix'
url='https://gitlab.com/spectral-im/spectral'
arch=('x86_64')
license=('GPL-3.0-or-later')
conflicts=('spectral-matrix-git')
depends=('cmark' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-quickcontrols2' 'qt5-svg' 'qt5-tools' 'qtkeychain' 'libquotient-git' 'libqtolm')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/spectral-im/spectral/-/archive/$pkgver/spectral-$pkgver.tar.gz"
		"SortFilterProxyModel-$_commit_sortfilterproxymodel.tar.gz::https://github.com/oKcerG/SortFilterProxyModel/archive/$_commit_sortfilterproxymodel.tar.gz")
sha256sums=('923aed0f2d0963859ac2758b0eb550aff4064b421b6d724c90899b9bec8f4911'
            '9f7c25fa9c21e3a40f56de02e4a53b36746094910cda9f642647a2b01e60b434')
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
	-DUSE_INTREE_LIBQMC=False \
	-DGIT_FOUND=False
  make -C build
}

package() {
	cd "$_builddir"
	make -C build DESTDIR="$pkgdir" install
}
