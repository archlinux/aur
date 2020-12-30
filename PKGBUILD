# Maintainer: Bernhard Landauer <bernhard@manjaro.org>
# Co-Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=appimagelauncher
pkgver=2.2.0
pkgrel=4
pkgdesc="A Helper application for running and integrating AppImages."
arch=('x86_64')
url="https://github.com/TheAssassin/AppImageLauncher"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libappimage'
         'libbsd' 'libxpm' 'qt5-base' 'shared-mime-info')
makedepends=('git' 'boost' 'cmake' 'gtest' 'python' 'qt5-tools')
source=("$pkgname::git+$url.git#tag=v$pkgver"
        'git+https://github.com/AppImage/AppImageUpdate.git'
        'git+https://github.com/AppImage/libappimage.git'
        'git+https://github.com/TheAssassin/zsync2'
        'git+https://github.com/arsenm/sanitizers-cmake'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/AppImage/cpr'
        'git+https://github.com/Taywee/args')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.lib/AppImageUpdate.url "$srcdir/AppImageUpdate"
	git config submodule.lib/libappimage.url "$srcdir/libappimage"
	git submodule update

	cd "$srcdir/$pkgname/lib/AppImageUpdate"
	git submodule init
	git config submodule.lib/zsync2.url "$srcdir/zsync2"
	git config submodule.lib/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
	git config submodule.lib/libappimage.url "$srcdir/libappimage"
	git submodule update

	cd "$srcdir/$pkgname/lib/AppImageUpdate/lib/libappimage"
	git submodule init
	git config submodule.lib/gtest.url "$srcdir/googletest"
	git submodule update

	cd "$srcdir/$pkgname/lib/AppImageUpdate/lib/zsync2"
	git submodule init
	git config submodule.lib/cpr.url "$srcdir/cpr"
	git config submodule.lib/args.url "$srcdir/args"
	git config submodule.lib/gtest.url "$srcdir/googletest"
	git submodule update

	cd "$srcdir/$pkgname/lib/libappimage"
	git submodule init
	git config submodule.lib/gtest.url "$srcdir/googletest"
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"
	cmake . \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr/ \
		-DUSE_SYSTEM_GTEST=ON \
		-DUSE_SYSTEM_XZ=ON \
		-DUSE_SYSTEM_LIBARCHIVE=ON \
		-DUSE_SYSTEM_LIBAPPIMAGE=ON \
		-DBUILD_TESTING=OFF \
		-Wno-dev

	# See https://github.com/TheAssassin/AppImageLauncher/issues/251
	make libappimageupdate libappimageupdate-qt
	cmake .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install

	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
