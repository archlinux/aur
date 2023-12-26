# Maintainer: Patrick Gelvin <patrick@gelvin.dev>
pkgname="rcalc"
pkgver=v1.3.0
pkgrel=1
pkgdesc="A lightweight RPN calculator"
arch=("x86_64")
url="https://github.com/gelvinp/rcalc"
license=('MIT')
depends=('glfw>=3.0.0' 'freetype2>=2.0.0' "libxcb")
makedepends=("python>=3.11.0" "scons>=4.5.0" "pkg-config" "git")
_tag=ea547738660a18395d9310d8383595b7f1592ca6 # git rev-parse "tag-name"
source=(git+https://github.com/gelvinp/rcalc#tag=$_tag?signed
        git+https://github.com/glfw/glfw
        git+https://gitlab.freedesktop.org/freetype/freetype
        git+https://github.com/ArthurSonzogni/FTXUI
        git+https://github.com/dacap/clip
        git+https://github.com/snitch-org/snitch)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  git describe
}

prepare() {
  cd "$pkgname"
  git submodule init

  git config submodule.modules/glfw/upstream.url "$srcdir/glfw"
  git config submodule.modules/freetype/upstream.url "$srcdir/freetype"
  git config submodule.modules/ftxui/upstream.url "$srcdir/FTXUI"
  git config submodule.modules/clip/upstream.url "$srcdir/clip"
  git config submodule.modules/snitch/upstream.url "$srcdir/snitch"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  GPERF_CMD=""

  if command -v gperf &> /dev/null
  then
    GPERF_CMD="gperf_path=$(which gperf)"
  fi

  BUILD_NAME="pkgbuild" VERSION_STATUS="stable" scons target=release default_renderer=terminal $GPERF_CMD
}

package() {
  cd "$pkgname"

  install -Dm755 bin/rcalc.linux.release.$CARCH $pkgdir/usr/bin/rcalc
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/rcalc/LICENSE.md
  install -Dm644 misc/rcalc.desktop $pkgdir/usr/share/applications/rcalc.desktop
  install -Dm644 icon.svg $pkgdir/usr/share/pixmaps/rcalc.svg
}
