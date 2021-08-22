# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Campbell Barton <ideasman42@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1

pkgname=tahoma2d-git
pkgver=r3143.7f444c8c
pkgrel=1
pkgdesc="Software for producing a 2D animation"
arch=(x86_64)
url="https://tahoma2d.org/"
license=(BSD)
depends=(cblas ffmpeg freeglut glew hicolor-icon-theme libmypaint qt5-multimedia qt5-script qt5-svg qt5-serialport superlu opencv)
makedepends=(git boost cmake qt5-tools)
provides=(tahoma2d)
conflicts=(tahoma2d)
source=("git+https://github.com/tahoma2d/tahoma2d.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [[ -d build ]] || mkdir build

  cd "${pkgname%-git}"
  # Specify path for ffmpeg
  #sed -i 's|"ffmpegPath", QMetaType::QString, ""|"ffmpegPath", QMetaType::QString, "/usr/bin"|' toonz/sources/toonzlib/preferences.cpp
}

build() {
  pushd  "${pkgname%-git}/thirdparty/tiff-4.0.3"
  ./configure --with-pic --disable-jbig
  make
  popd

  cd build
  cmake -G "Unix Makefiles" ../"${pkgname%-git}"/toonz/sources \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=YES
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../"${pkgname%-git}"/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
