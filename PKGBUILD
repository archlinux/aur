# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-pinned-apps-in-appgrid-git
pkgver=r23.099bc78
pkgrel=1
pkgdesc="Keep pinned apps in AppGrid"
arch=('any')
url="https://github.com/brunos3d/pinned-apps-in-appgrid"
license=(
    'GPL-3.0-or-later'
)
depends=(
    'gnome-shell>=1:45'
)
makedepends=(
    'git'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"

    # support repositories that start without a tag but get tagged later on
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${pkgname%-git}"
    local uuid
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local extensiondir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

    install -Dm0644 -t "$extensiondir" extension.js metadata.json
}

# vim: set ts=4 sw=4 et:
