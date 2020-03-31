# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Maintainer: gilbus <aur(AT)tinkershell.eu>
pkgname=swayidle-git
_pkgname=swayidle
pkgver=1.6.r9.g85b57cc
pkgrel=1
license=('MIT')
pkgdesc='Idle management daemon for Wayland'
makedepends=(
    'meson'
    'scdoc'
    'wayland-protocols'
    'git'
)
depends=(
    'wayland'
    'systemd-libs'
)
arch=('x86_64')
url="https://github.com/swaywm/swayidle"
source=("${pkgname%-*}::git+https://github.com/swaywm/swayidle.git")
sha1sums=('SKIP')
provides=('swayidle')
conflicts=('swayidle')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    meson "$_pkgname" build \
        --prefix /usr \
        --buildtype=plain
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 "$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
}
