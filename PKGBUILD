# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: TheAssassin

_pkgname=AppImageLauncher
pkgname=appimagelauncher-git
pkgver=r976.d1be7e7
pkgrel=1
pkgdesc="A Helper application for running and integrating AppImages."
arch=('x86_64')
url="https://github.com/TheAssassin/AppImageLauncher"
license=('MIT')
depends=(qt5-base fuse)
makedepends=(git cmake extra-cmake-modules xxd qt5-tools wget boost gtest)
provides=(appimagelauncher)
conflicts=(appimagelauncher)
source=("git+https://github.com/TheAssassin/AppImageLauncher.git"
        "git+https://github.com/AppImage/AppImageUpdate.git"
        "git+https://github.com/AppImage/libappimage.git"
        "git+https://github.com/TheAssassin/zsync2"
        "git+https://github.com/TheAssassin/fltk-1.3.4"
        "git+https://github.com/TheAssassin/libdesktopenvironments"
        "git+https://github.com/arsenm/sanitizers-cmake"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/AppImage/cpr"
        "git+https://github.com/Taywee/args"
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
            'SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config submodule.lib/AppImageUpdate.url "${srcdir}/AppImageUpdate"
  git config submodule.lib/libappimage.url "${srcdir}/libappimage"
  git submodule update 

  cd "$srcdir/$_pkgname/lib/AppImageUpdate"
  git submodule init
  git config submodule.lib/zsync2.url "${srcdir}/zsync2"
  git config submodule.lib/fltk.url "${srcdir}/fltk-1.3.4"
  git config submodule.lib/libdesktopenvironments.url  "${srcdir}/libdesktopenvironments"
  git config submodule.lib/sanitizers-cmake.url "${srcdir}/sanitizers-cmake"
  git config submodule.lib/libappimage.url "${srcdir}/libappimage"
  git submodule update

  cd "$srcdir/$_pkgname/lib/AppImageUpdate/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git submodule update

  cd "$srcdir/$_pkgname/lib/AppImageUpdate/lib/zsync2"
  git submodule init
  git config submodule.lib/cpr.url "${srcdir}/cpr"
  git config submodule.lib/args.url "${srcdir}/args"
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git submodule update

  cd "${srcdir}/$_pkgname/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DUSE_SYSTEM_GTEST=ON \
        -DUSE_SYSTEM_XZ=ON \
        -DUSE_SYSTEM_LIBARCHIVE=ON \
        -DBUILD_TESTING=OFF
  make libappimage libappimageupdate libappimageupdate-qt
  cmake .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../appimage-binfmt-remove.hook "$pkgdir"/usr/share/libalpm/hooks/appimage-binfmt-remove.hook
}
