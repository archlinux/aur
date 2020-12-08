# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=mako-git
_pkgname=mako
pkgver=v1.4.1.r51.g85d3d51
pkgrel=1
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc" "systemd" "wayland-protocols" "git")
depends=(
    "gdk-pixbuf2"
    "pango"
    "cairo"
    "systemd-libs"
    "wayland"
)
optdepends=("jq: support for 'makoctl menu'")
arch=("x86_64")
url='http://mako-project.org'
source=("${pkgname%-*}::git+https://github.com/emersion/mako.git")
sha1sums=('SKIP')
provides=('mako')
conflicts=('mako')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long 2> /dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$_pkgname"
    arch-meson -Dzsh-completions=true -Dsd-bus-provider=libsystemd build
    ninja -C build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir/" ninja -C build install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
}
