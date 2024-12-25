# Maintainer: Christian Schendel <doppelhelix@gmail.com>
pkgname=gnome-shell-extension-no-overview-git
pkgver=r30.7d1d8e2
pkgrel=1
pkgdesc="No overview at start-up"
arch=(any)
url="https://github.com/fthx/no-overview"
license=(
    GPL-3.0-or-later)
depends=(
    'gnome-shell>=1:47'
)
makedepends=(
    git
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')
options=('!strip')

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
    local extensiondir
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    extensiondir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"
    install -dm755 "${extensiondir}"
    find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec install -Dm 644 {} "${extensiondir}"/{} \;
}

# vim: set ts=4 sw=4 et:
