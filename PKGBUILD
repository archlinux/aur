# Maintainer: Sebastian Krzyszkowiak <dos@dosowisko.net>

pkgname=phoc-git
pkgver=r345.0db9e13
pkgrel=1
pkgdesc="Wayland compositor for phones"
url="https://source.puri.sm/Librem5/phoc"
license=("GPL3")
arch=(i686 x86_64 arm armv6h armv7h aarch64)
depends=('glib2' 'wlroots')
makedepends=('meson' 'ninja' 'git' 'wayland-protocols' 'ctags' 'xorg-server-xvfb')
provides=(phoc)
conflicts=(phoc)
source=("git+https://source.puri.sm/Librem5/phoc.git")
sha256sums=("SKIP")

pkgver() {
    cd phoc
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    arch-meson phoc build -Dembed-wlroots=disabled -Ddefault_library=shared
    ninja -C build
}

check() {
    xvfb-run -s -noreset ninja -C build test
}

package() {
    DESTDIR="${pkgdir}" ninja -C build install
}
