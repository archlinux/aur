pkgname=wlvncc-git
_pkgname=wlvncc
pkgver=r106.9ef4184
pkgrel=2
pkgdesc='Wayland native VNC client'
arch=(x86_64)
url=https://github.com/any1/wlvncc
license=(custom:ISC)
depends=(aml libvncserver libxkbcommon libdrm ffmpeg mesa pixman wayland)
makedepends=(git meson wayland-protocols)
source=("git+$url")
sha512sums=('SKIP')
conflicts=(wlvncc)
provides=(wlvncc)

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    arch-meson wlvncc build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm 644 wlvncc/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
