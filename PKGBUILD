# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-status-area-horizontal-spacing-git
pkgver=r102.74f4d77
pkgrel=2
pkgdesc="A GNOME shell extension that reduces the horizontal spacing between icons/indicators in the status area."
arch=('any')
url="https://gitlab.com/p91paul/status-area-horizontal-spacing-gnome-shell-extension"
license=(
    'GPL-2.0-or-later'
)
depends=(
    'gnome-shell=1:45'
)
makedepends=(
    'git'
    'glib2'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"

    # support repositories that start without a tag but get tagged later on
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    local extension_dir
    local uuid
    local schema
    local destdir

    # Some extensions use make only to zip. We need to harcode the existing path
    extension_dir="${srcdir}/${pkgname%-git}/status-area-horizontal-spacing@mathematical.coffee.gmail.com"

    cd "${extension_dir}"

    # It's nice to have a well-formed metadata.json
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
    destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

    install -dm755 "${destdir}"
    # Don't install unnecessary files
    find . -regextype posix-egrep -regex ".*\.(js|json|xml|mo|compiled)$" \
        -exec install -Dm 644 {} ${destdir}/{} \;
    install -Dm644 "schemas/${schema}" \
        "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
    install -Dm644 "../LICENSE" -t \
        "$pkgdir/usr/share/licenses/${pkgname%-git}/"
    install -Dm644 "../Readme.md" -t \
        "$pkgdir/usr/share/doc/${pkgname%-git}/"
}
