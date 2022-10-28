# Maintainer: HaoCheng <ch1994@outlook.com>
pkgname=netease-cloud-music-gtk4-git
_pkgname=netease-cloud-music-gtk
pkgver=r213.2ab2bf2
pkgrel=1
pkgdesc="Linux 平台下基于 Rust + GTK4 开发的网易云音乐播放器"
arch=('i686' 'x86_64')
url="https://github.com/gmg137/netease-cloud-music-gtk"
license=('GPL3')
depends=(
	'libadwaita'
	'gst-plugins-base'
)
optdepends=(
	'gst-plugins-bad: extra media codecs'
	'gst-plugins-good: extra media codecs'
	'gst-plugins-ugly: extra media codecs'
 )
makedepends=('cargo' 'meson' 'git')
conflicts=(
	'netease-cloud-music-gtk4' 
	'netease-cloud-music-gtk-bin'
)
source=("git+https://github.com/gmg137/$_pkgname")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
	CFLAGS+=" -ffat-lto-objects"
	arch-meson --buildtype=release "$_pkgname" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
