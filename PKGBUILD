# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Fabio Lolix <fabio.loli at disroot.org>

# Thanks to Fabio Lolix for the patch.

pkgname=applewin-git
pkgver=1.30.21.0.b.r101.g9a139a36
pkgrel=1
pkgdesc="AppleWin Linux port by Audetto - GIT version"
arch=('x86_64')
url="https://github.com/audetto/AppleWin.git"
license=('GPL2')
depends=('boost-libs' 'minizip'  'libslirp' 'sdl2_image' 'qt6-multimedia' 'libyaml' 'xxd')
makedepends=('git' 'cmake' 'boost')
provide=(applewin)
conflicts=(applewin)
install=applewin.install
options=(!debug !lto)
source=("${pkgname%-git}::git+https://github.com/audetto/AppleWin.git"
        "git+https://github.com/Dax89/QHexView.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/ocornut/imgui_club.git"
        "git+https://github.com/AirGuanZ/imgui-filebrowser.git"
        applewin-sdl2.desktop
        applewin-qt.desktop
        apple-logo.svg)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '3c85c5f62d94b5e50431d0eabd5b59f0416a3cbfc38cae169ed5deeca76744b7'
            'a1ff883091cc0d80ae9830353f3ef3a9b451833814c39100b351a7a92677960f'
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
  git submodule set-url source/frontends/sdl/imgui/imgui-filebrowser "${srcdir}/imgui-filebrowser"
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
