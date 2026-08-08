# Maintainer: Milk (milk / milkii on Freenode) 
# Contributor: osch <oliver@luced.de>
pkgname=surge-synthesizer-lv2-git
pkgver=r5585.fae324266
scmver=1.6.1
pkgrel=1
pkgdesc="Surge Synthesizer plugin (LV2, git head)"
arch=('x86_64')
url="https://surge-synthesizer.github.io"
license=('GPL3')
groups=('lv2-plugins')
depends=('cairo'  'fontconfig'          'freetype2'
         'libx11' 'xcb-util-cursor'     'xcb-util'
         'libxcb' 'xcb-util-renderutil' 'xcb-util-image'
         'cmake' )
makedepends=('premake' 'git' 'libxrandr' 'libxinerama' 'libxcursor' 'alsa-lib' 'jack2')
provides=('surge-synthesizer' 'surge-synthesizer-bin')
conflicts=('surge-synthesizer' 'surge-synthesizer-bin')
source=("git+https://github.com/surge-synthesizer/surge.git")
options=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/surge"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/surge"
	git submodule update --init --recursive
  cmake -Bbuild -DSURGE_BUILD_LV2=TRUE
}

build() {
	cd "$srcdir/surge"
  cmake --build build --config Release
}

package() {
	cd "$srcdir/surge"
  DESTDIR="$pkgdir" cmake --install build
	mkdir -p "$pkgdir/usr/share/Surge/doc"
	cp LICENSE "$pkgdir/usr/share/Surge/doc"
}

