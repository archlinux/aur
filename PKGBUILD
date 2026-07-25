# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-applications-overview-tooltip-git
pkgver=24.r2.ged10d7b
pkgrel=1
pkgdesc="Shows a tooltip over applications icons on applications overview"
url="https://codeberg.org/RaphaelRochet/applications-overview-tooltip"
arch=(any)
license=(CC0-1.0)
depends=(
    dconf
    'gnome-shell>=1:46'
)
makedepends=(
    git
    glib2
)
source=(
    "${pkgname%-git}::git+$url.git"
)
b2sums=('SKIP')
conflicts=("${pkgname%-git}")
provides=(${pkgname%-git})

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
        | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname%-git}"
    local uuid
    local schema
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
    local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

    install -dm0755 "${destdir}"
    find . -regextype posix-egrep -regex ".*\.(js|json|xml|css)$" \
        -exec install -Dm 644 {} "${destdir}/{}" \;
    find . -regextype posix-egrep -regex ".*\.(mo)$" \
        -exec install -Dm 644 {} "${pkgdir}/usr/share/{}" \;
    rm -rf "${destdir}/schemas"

    install -Dm0644 -t "${pkgdir}/usr/share/glib-2.0/schemas" schemas/"${schema}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" screenshot.png
}

# vim: set ts=4 sw=4 et:
