# Maintainer: Patrick Gelvin <patrick@gelvin.dev>
pkgname="rcalc"
pkgver=v2.1.3
pkgrel=1
pkgdesc="A lightweight RPN calculator"
arch=("x86_64")
url="https://git.sr.ht/~jamis/rcalc"
license=('MIT')
depends=('glfw>=3.0.0' 'freetype2>=2.0.0' "libxcb" "dbus")
makedepends=("python>=3.11.0" "scons>=4.5.0" "pkg-config" "git")
_tag=1a3cf7b75fcac062ad341c1f8114c2b8c3a5cac3 # git rev-parse "tag-name"
source=(git+https://git.sr.ht/~jamis/rcalc#tag=$_tag
        git+https://github.com/dacap/clip#tag=v1.15)
sha512sums=('deb41b71c50c219ec00f6be43bdb8d1192d1e2a379237b5742daa365ecf9b1a1b59dbc7e66e1a7fa1aae48cfbca1f5f6503416e6c71f6e031909aff791e81552'
            'edde4395628ec896246f5ed4fd64ce443b31e85935928f3ef6b3562065586a6171f3897462a9af2a919e34518510d950f3d8ac47113023d1550aa42c5f1ff409')

pkgver() {
  cd "$pkgname"
  git describe
}

prepare() {
  cd "$pkgname"
  git submodule init modules/clip/upstream

  git config submodule.modules/clip/upstream.url "$srcdir/clip"

  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  GPERF_CMD=""

  if command -v gperf &> /dev/null
  then
    GPERF_CMD="gperf_path=$(which gperf)"
  fi

  BUILD_NAME="pkgbuild" VERSION_STATUS="stable" scons target=release default_renderer=terminal builtin_glfw=no builtin_freetype=no tests_enabled=no $GPERF_CMD
}

package() {
  cd "$pkgname"

  install -Dm755 bin/rcalc.linux.release.$CARCH $pkgdir/usr/bin/rcalc
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/rcalc/LICENSE.md
  install -Dm644 misc/rcalc.desktop $pkgdir/usr/share/applications/rcalc.desktop
  install -Dm644 icon.svg $pkgdir/usr/share/pixmaps/rcalc.svg
}
