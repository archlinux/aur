# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-status-area-horizontal-spacing-git
pkgver=r105.95391c9
pkgrel=1
pkgdesc="A GNOME shell extension that reduces the horizontal spacing between icons/indicators in the status area."
arch=('any')
url="https://gitlab.com/p91paul/status-area-horizontal-spacing-gnome-shell-extension"
license=(
    'GPL-2.0-or-later'
)
depends=(
  'gnome-shell>=1:46'
)
makedepends=(
    'git'
    'glib2'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"

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
    extension_dir="$srcdir/${pkgname%-git}/status-area-horizontal-spacing@mathematical.coffee.gmail.com"

    cd "$extension_dir"

    # It's nice to have a well-formed metadata.json
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
    destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

    install -dm0755 "$destdir"
    find . -regextype posix-egrep -regex ".*\.(js|json|xml|mo)$" \
        -exec install -Dm 0644 {} "$destdir"/{} \;

    install -Dm0644 "schemas/$schema" "${pkgdir}/usr/share/glib-2.0/schemas/$schema"
    rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${uuid}/schemas/"

    install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/" ../Readme.md ../*.png
}

# vim: ts=4 sw=4 et:
