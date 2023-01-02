# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fabio Lolix <fabio.loli at disroot.org>

# Thanks to Fabio Lolix for the patch.

pkgname=applewin-git
pkgver=1.30.7.0.r284.g05aab091
pkgrel=1
pkgdesc="AppleWin Linux port by Audetto - GIT version"
arch=('x86_64')
url="https://github.com/audetto/AppleWin.git"
license=('GPL2')
depends=('boost-libs' 'minizip'  'libslirp' 'sdl2_image' 'qt5-gamepad' 'qt5-multimedia' 'libyaml')
makedepends=('git' 'cmake' 'boost')
provide=(applewin)
conflicts=(applewin)
install=applewin.install
source=("${pkgname%-git}::git+https://github.com/audetto/AppleWin.git"
        "git+https://github.com/Dax89/QHexView.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/ocornut/imgui_club.git"
        applewin-sdl2.desktop
        applewin-qt.desktop
        apple-logo.svg)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'e9bb4b78a21d3fc3daeebeaf99c68e97f745e497b19d1a4eeaf2e115ab5cf4c3'
            '3fc868e86a3e8520cfb366fce547aac4e6439eb0e6753156da3c3ce97e235c2e'
            'e3bbf57d2ad105c6211b0853fbb88f1c20d874d0a34b6ae263e2cf8c74e1568d')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"

  git submodule init
  git submodule set-url source/frontends/qt/QHexView "${srcdir}/QHexView"
  git submodule set-url source/frontends/sdl/imgui/imgui "${srcdir}/imgui"
  git submodule set-url source/frontends/sdl/imgui/imgui_club "${srcdir}/imgui_club"
  git -c protocol.file.allow=always submodule update

  mkdir build
}

build() {
  cd "${srcdir}/${pkgname%-git}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}/build"
  make DESTDIR="${pkgdir}/" install

  install -D "${srcdir}"/*.desktop -t "${pkgdir}"/usr/share/applications/
  install -D "${srcdir}"/apple-logo.svg -t "${pkgdir}"/usr/share/applewin/common/
}

# vim:set ts=2 sw=2 et:
