# Maintainer: Christian Schendel <doppelhelix at gmail dot com>
pkgname=gnome-shell-extension-useless-gaps-git
pkgver=8.r35.g8968946
pkgrel=1
pkgdesc="Useless Gaps is a GNOME Shell Extension which for aesthetic purposes adds 'useless gaps' around windows."
arch=(any)
url="https://github.com/mipmip/gnome-shell-extensions-useless-gaps"
license=(
    GPL-3.0-or-later
)
depends=(
    'gnome-shell>=1:45'
)
makedepends=(
    gettext
    git
    glib2
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"

    # support repositories that start without a tag but get tagged later on
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname%-git}"
    mkdir build
    gnome-extensions pack src \
        --force \
        --podir="../po" \
        --extra-source="ui.js" \
        --extra-source="../LICENSE" \
        --extra-source="../CHANGELOG.md" \
        --out-dir=build

}

package() {
    local uuid
    local schema
    local destdir

    cd "$srcdir/${pkgname%-git}/src"
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
    destdir="$pkgdir/usr/share/gnome-shell/extensions/$uuid"

    cd "$srcdir/${pkgname%-git}/build"
    bsdtar -xf "$uuid.shell-extension.zip" -C .
    rm "$uuid.shell-extension.zip"
    rm LICENSE
    install -Dm0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" CHANGELOG.md
    rm CHANGELOG.md
    install -Dm644 "schemas/$schema" \
        "$pkgdir/usr/share/glib-2.0/schemas/$schema"
    rm -r schemas
    install -dm755 "$destdir"
    cp --preserve=mode -r  ./* "$destdir"
}

# vim: set ts=4 sw=4 et:
