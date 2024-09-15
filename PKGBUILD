# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: TheAssassin

pkgname=appimagelauncher-git
pkgver=r1257.0013516
pkgrel=2
pkgdesc="A Helper application for running and integrating AppImages."
arch=(x86_64)
url="https://assassinate-you.net/tags/appimagelauncher/"
license=(MIT)
depends=(qt5-base qt5-declarative libappimage

         # namcap implicit depends
         glibc gcc-libs glib2 curl)
makedepends=(git cmake boost qt5-tools libxpm lib32-glibc lib32-gcc-libs tinyxxd patchelf
        #appimageupdate-git
        #fuse2
)
provides=(appimagelauncher)
conflicts=(appimagelauncher)
options=(debug !strip)
source=("git+https://github.com/TheAssassin/AppImageLauncher.git"
        "git+https://github.com/AppImageCommunity/AppImageUpdate.git"
        #"git+https://github.com/AppImage/libappimage.git"
        "git+https://github.com/AppImageCommunity/zsync2.git"
        "git+https://github.com/AppImageCommunity/fltk-1.3.4.git"
        "git+https://github.com/TheAssassin/libdesktopenvironments.git"
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        "git+https://github.com/google/googletest.git"
        "AppImage-cpr::git+https://github.com/AppImage/cpr.git"
        "git+https://github.com/Taywee/args.git"
        'appimage-binfmt-remove.hook')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd AppImageLauncher
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

CFLAGS="$CFLAGS -Wno-deprecated-declarations -Wno-implicit-function-declaration -Wno-incompatible-pointer-types"

prepare() {
  cd AppImageLauncher

  git submodule init
  git config submodule.lib/AppImageUpdate.url "${srcdir}/AppImageUpdate"
  git -c protocol.file.allow=always submodule update

  cd "${srcdir}/AppImageLauncher/lib/AppImageUpdate"
  git submodule init
  git config submodule.lib/zsync2.url "${srcdir}/zsync2"
  git config submodule.lib/fltk.url "${srcdir}/fltk-1.3.4"
  git config submodule.lib/libdesktopenvironments.url  "${srcdir}/libdesktopenvironments"
  git config submodule.lib/sanitizers-cmake.url "${srcdir}/sanitizers-cmake"
  #git config submodule.lib/libappimage.url "${srcdir}/libappimage"
  git config submodule.lib/libappimage.update none
  git -c protocol.file.allow=always submodule update

  #cd "${srcdir}/AppImageLauncher/lib/AppImageUpdate/lib/libappimage"
  #git submodule init
  #git config submodule.lib/gtest.url "${srcdir}/googletest"
  #git -c protocol.file.allow=always submodule update

  cd "$srcdir/AppImageLauncher/lib/AppImageUpdate/lib/zsync2"
  git submodule init
  git config submodule.lib/cpr.url "${srcdir}/AppImage-cpr"
  git config submodule.lib/args.url "${srcdir}/args"
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
}

# not recognized system's libappimageupdate

build() {
  cd AppImageLauncher

  local _flags=(
    -DUSE_SYSTEM_LIBAPPIMAGE=ON
    -DBUILD_TESTING=OFF
  )

  cmake . \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  make libappimageupdate libappimageupdate-qt

  cmake .

  make
}

package() {
  cd AppImageLauncher
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../appimage-binfmt-remove.hook "$pkgdir"/usr/share/libalpm/hooks/appimage-binfmt-remove.hook

  patchelf --shrink-rpath "${pkgdir}/usr/lib/appimagelauncher/libappimageupdate-qt.so"
  patchelf --shrink-rpath "${pkgdir}/usr/lib/appimagelauncher/libappimageupdate.so"
  #patchelf --shrink-rpath "${pkgdir}/usr/bin/AppImageLauncherSettings"
  #patchelf --shrink-rpath "${pkgdir}/usr/bin/ail-cli"
  #patchelf --shrink-rpath "${pkgdir}/usr/bin/appimagelauncherd"
}
