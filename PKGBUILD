# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: TheAssassin

pkgname=appimagelauncher-git
pkgver=r1244.d9d4c73
pkgrel=2
pkgdesc="A Helper application for running and integrating AppImages."
arch=(x86_64)
url="https://assassinate-you.net/tags/appimagelauncher/"
license=(MIT)
depends=(qt5-base fuse2 squashfuse libappimage libxpm)
makedepends=(git cmake boost qt5-tools lib32-glibc lib32-gcc-libs xxd chrpath)
provides=(appimagelauncher)
conflicts=(appimagelauncher)
source=("${pkgname%-git}::git+https://github.com/TheAssassin/AppImageLauncher.git"
        "git+https://github.com/AppImage/AppImageUpdate.git"
        "git+https://github.com/AppImage/libappimage.git"
        "git+https://github.com/TheAssassin/zsync2.git"
        "git+https://github.com/TheAssassin/fltk-1.3.4.git"
        "git+https://github.com/TheAssassin/libdesktopenvironments.git"
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/AppImage/cpr.git"
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
            'SKIP'
            '72a2630cf79b8f90bc21eae1d9f40c07fe77ce22df46c511b500f514455d7c81')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #git describe --long --tags --exclude continuous | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  git submodule init
  git config submodule.lib/AppImageUpdate.url "${srcdir}/AppImageUpdate"
  git config submodule.lib/libappimage.url "${srcdir}/libappimage"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/${pkgname%-git}/lib/AppImageUpdate"
  git submodule init
  git config submodule.lib/zsync2.url "${srcdir}/zsync2"
  git config submodule.lib/fltk.url "${srcdir}/fltk-1.3.4"
  git config submodule.lib/libdesktopenvironments.url  "${srcdir}/libdesktopenvironments"
  git config submodule.lib/sanitizers-cmake.url "${srcdir}/sanitizers-cmake"
  git config submodule.lib/libappimage.url "${srcdir}/libappimage"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/${pkgname%-git}/lib/AppImageUpdate/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update

  cd "$srcdir/${pkgname%-git}/lib/AppImageUpdate/lib/zsync2"
  git submodule init
  git config submodule.lib/cpr.url "${srcdir}/cpr"
  git config submodule.lib/args.url "${srcdir}/args"
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update

  cd "${srcdir}/${pkgname%-git}/lib/libappimage"
  git submodule init
  git config submodule.lib/gtest.url "${srcdir}/googletest"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cmake . -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DUSE_SYSTEM_LIBAPPIMAGE=ON \
        -DBUILD_TESTING=OFF
  make libappimageupdate libappimageupdate-qt
  cmake .
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../appimage-binfmt-remove.hook "$pkgdir"/usr/share/libalpm/hooks/appimage-binfmt-remove.hook

  chrpath --delete "${pkgdir}/usr/lib/appimagelauncher/libappimageupdate-qt.so"
  chrpath --delete "${pkgdir}/usr/lib/appimagelauncher/libappimageupdate.so"
  #chrpath --delete "${pkgdir}/usr/bin/AppImageLauncherSettings"
  #chrpath --delete "${pkgdir}/usr/bin/ail-cli"
  #chrpath --delete "${pkgdir}/usr/bin/appimagelauncherd"
}
