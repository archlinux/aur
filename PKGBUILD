# Maintainer: Bernhard Landauer <bernhard@manjaro.org>
# Co-Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=appimagelauncher
pkgver=2.2.0
pkgrel=6
pkgdesc="A Helper application for running and integrating AppImages."
arch=('x86_64' 'aarch64')
url="https://github.com/TheAssassin/AppImageLauncher"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'hicolor-icon-theme' 'libappimage'
         'libbsd' 'libxpm' 'qt5-base' 'shared-mime-info')
makedepends=('boost' 'cmake' 'git' 'gtest' 'python' 'qt5-tools')
_commit=0f918015fa418affec32435d1c61c6ae473f2af5  # tags/v2.2.0^0
source=("git+https://github.com/TheAssassin/AppImageLauncher.git#commit=$_commit"
        'git+https://github.com/AppImageCommunity/AppImageUpdate.git'
        'git+https://github.com/AppImageCommunity/libappimage.git'
        'git+https://github.com/TheAssassin/zsync2.git'
        'git+https://github.com/arsenm/sanitizers-cmake.git'
        'git+https://github.com/google/googletest.git'
        'git+https://github.com/AppImageCommunity/cpr.git'
        'git+https://github.com/Taywee/args.git'
        'appimage-binfmt-remove.hook'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd "$srcdir/AppImageLauncher"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "$srcdir/AppImageLauncher"
  git submodule init
  git config submodule.lib/AppImageUpdate.url "$srcdir/AppImageUpdate"
  git config submodule.lib/libappimage.url "$srcdir/libappimage"
  git -c protocol.file.allow=always submodule update

  pushd lib/AppImageUpdate
  git submodule init
  git config submodule.lib/zsync2.url "$srcdir/zsync2"
  git config submodule.lib/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
  git config submodule.lib/libappimage.url "$srcdir/libappimage"
  git -c protocol.file.allow=always submodule update
  popd

  pushd lib/AppImageUpdate/lib/libappimage
  git submodule init
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd

  pushd lib/AppImageUpdate/lib/zsync2
  git submodule init
  git config submodule.lib/cpr.url "$srcdir/cpr"
  git config submodule.lib/args.url "$srcdir/args"
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd

  pushd lib/libappimage
  git submodule init
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
  popd
}

build() {
  cd "$srcdir/AppImageLauncher"
  cmake . \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DUSE_SYSTEM_LIBAPPIMAGE='ON' \
    -DUSE_SYSTEM_GTEST='ON' \
    -DBUILD_TESTING='OFF' \
    -Wno-dev

  # See https://github.com/TheAssassin/AppImageLauncher/issues/251
  make libappimageupdate libappimageupdate-qt
  cmake .
  make
}

package() {
  cd "$srcdir/AppImageLauncher"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$srcdir"/*.hook -t "$pkgdir"/usr/share/libalpm/hooks/
}
