# Maintainer: Milkii Brewster <milkii on Freenode IRC>
maintaner="Milkii Brewster <milkii on Freenode IRC>"
pkgname=zplugins.lv2-git
pkgdesc="Zrythm plugins for audio, MIDI and CV, including ZLFO, ZSaw, ZVerb and ZChordz"
pkgver=r36.444ae2d
pkgrel=1
epoch=
arch=(x86_64)
url="https://github.com/zrythm/ZPlugins"
license=(AGPL3+)
groups=(lv2-plugins)
depends=("lv2" "librsvg" "cairo" "librsvg")
makedepends=(lv2lint)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(debug !strip)
install=
changelog=
source=(zplugins::git+https://git.zrythm.org/git/zplugins)
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "zplugins"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "zplugins"
  cd ext/Soundpipe && CC=gcc make && cd ../..
  meson build --prefix /usr
}

build() {
  cd "zplugins"
	# ./configure --prefix=/usr
  ninja -C build
}

package() {
  cd "zplugins"
  DESTDIR="$pkgdir/" ninja -C build install
}
