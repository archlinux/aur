# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

_pkgname=AppleWin
_name=applewin
pkgname="${_name}-git"
pkgver=v1.25.0.4.r1954.gdb8997d6
pkgrel=1
pkgdesc="AppleWin Linux port by Audetto - GIT version"
arch=('x86_64')
url="https://github.com/audetto/AppleWin.git"
license=('GPL2')
depends=('boost-libs' 'minizip'  'libslirp' 'sdl2_image' 'qt5-gamepad' 'qt5-multimedia' 'libyaml')
makedepends=('git' 'cmake' 'boost')
source=("git+https://github.com/audetto/AppleWin.git"
        "git+https://github.com/Dax89/QHexView.git#commit=4d06da8"
        "git+https://github.com/ocornut/imgui.git#commit=4ddb6b4"
        "git+https://github.com/ocornut/imgui_club.git#commit=02e679b"
        applewin-sdl2.desktop
        applewin-qt.desktop
        apple-logo.svg
        applewin-git.install)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '0c12ec3a65b8fb832b5931e443686c01e64b1c56882fd564d04b467ba6cb8f1a'
            'a1f2f65e1d381436a357455c96ee0fd586021847ba206e595ca416df91085157'
            'e3bbf57d2ad105c6211b0853fbb88f1c20d874d0a34b6ae263e2cf8c74e1568d'
            'dcd3c07931963c23dd96440ba08d7da61491498977f39541947a37a3f6261ac9')

pkgver() {
  cd ${srcdir}/${_pkgname}
  #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

cd ${srcdir}/${_pkgname}
#
# Moving 3rd party repositories
# Kinda dirty, but I cannot get git submodules to work :(
#
# This is a work in progress. Any help appreciated for making everything
# work with git submodule "magic" :)
#
cp -fra ${srcdir}/QHexView/* ${srcdir}/${_pkgname}/source/frontends/qt/QHexView/
cp -fra ${srcdir}/imgui/* ${srcdir}/${_pkgname}/source/frontends/sdl/imgui/imgui/
cp -fra ${srcdir}/imgui_club/* ${srcdir}/${_pkgname}/source/frontends/sdl/imgui/imgui_club/
}

build() {
  cd $srcdir/${_pkgname}
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd $srcdir/${_pkgname}
  cd build
  make DESTDIR="$pkgdir/" install
  mkdir $pkgdir/usr/share/applications/
  cp $srcdir/*.desktop $pkgdir/usr/share/applications/
  mkdir $pkgdir/usr/share/applewin/common/
  cp $srcdir/apple-logo.svg $pkgdir/usr/share/applewin/common/
}

# vim:set ts=2 sw=2 et:
