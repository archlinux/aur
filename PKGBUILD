# Maintainer: Christian Schendel <doppelhelix@gmail.com>

pkgname=gnome-shell-extension-compiz-windows-effect-git
pkgver=r39.2db7c88
pkgrel=1
pkgdesc="Compiz wobbly windows effect with libanimation engine."
arch=('any')
url="https://github.com/hermes83/compiz-windows-effect"
license=(
    GPL-3.0-or-later
)
depends=(
    'gnome-shell>=1:49'
)
makedepends=(
    git
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname%-git}::git+${url}.git"
)
b2sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    ( set -o pipefail
        git describe --long 2>/dev/null | \
            sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" \
            "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    local uuid
    uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local schema=org.gnome.shell.extensions.com.github.hermes83.compiz-windows-effect.gschema.xml
    local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

    install -d "${destdir}"
    find . -regextype posix-egrep -regex ".*\.(js|json)$" -exec\
        install -Dm644 {} "${destdir}"/{} \;
    install -Dm644 "${srcdir}/${pkgname%-git}/schemas/${schema}" \
        "${pkgdir}/usr/share/glib-2.0/schemas/${schema}"
    install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}/" \
        README.md
}

# vim: set ts=4 sw=4 et:
