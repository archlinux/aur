# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Mark Wagie
# Contributor: Bernhard Landauer <bernhard@manjaro.org>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=appimagelauncher
pkgver=2.2.0
_commit=0f918015fa418affec32435d1c61c6ae473f2af5
pkgrel=7
pkgdesc='Helper for running and integrating AppImages'
#arch=(x86_64)
arch=(x86_64 aarch64)
url=https://github.com/TheAssassin/AppImageLauncher
license=(MIT)
depends=(cairo desktop-file-utils hicolor-icon-theme libappimage libbsd libxpm qt5-base shared-mime-info)
makedepends=(boost cmake git gtest python qt5-tools)
#source=("$pkgname-$pkgver.tag.gz::$url/archive/refs/tags/v2.2.0.tar.gz"
source=("git+https://github.com/TheAssassin/AppImageLauncher.git#commit=$_commit"
         git+https://github.com/AppImageCommunity/AppImageUpdate.git
         git+https://github.com/AppImageCommunity/cpr.git
         git+https://github.com/AppImageCommunity/libappimage.git
         git+https://github.com/Taywee/args.git
         git+https://github.com/TheAssassin/zsync2.git
         git+https://github.com/arsenm/sanitizers-cmake.git
         git+https://github.com/google/googletest.git
         appimage-binfmt-remove.hook)
sha256sums=('7970aba671787ebc33cbb7a291fcef147509f8134d7d894215f9999e1467435a'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

# Workaround for newer GCC
CFLAGS="$CFLAGS -Wno-deprecated-declarations -Wno-discarded-qualifiers -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"

prepare() {
  cd AppImageLauncher
  git submodule init
  git config submodule.lib/AppImageUpdate.url "$srcdir/AppImageUpdate"
  git config submodule.lib/libappimage.url "$srcdir/libappimage"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/AppImageLauncher/lib/AppImageUpdate"
  git submodule init
  git config submodule.lib/zsync2.url "$srcdir/zsync2"
  git config submodule.lib/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
  git config submodule.lib/libappimage.url "$srcdir/libappimage"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/AppImageLauncher/lib/AppImageUpdate/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/AppImageLauncher/lib/AppImageUpdate/lib/zsync2"
  git submodule init
  git config submodule.lib/cpr.url "$srcdir/cpr"
  git config submodule.lib/args.url "$srcdir/args"
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/AppImageLauncher/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "$srcdir/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd AppImageLauncher

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
  make -C AppImageLauncher DESTDIR="$pkgdir" install

  install -Dm644 AppImageLauncher/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 appimage-binfmt-remove.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
