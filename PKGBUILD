# Maintainer: Henrique B. (hpsbranco at gmail dot com)
pkgname=gnome-shell-extension-no-annoyance-git
pkgver=r73.8ca0647
pkgrel=1
pkgdesc="Another extension that removes the 'Window is ready' notification and puts the window into focus."
arch=("any")
url="https://github.com/jirkavrba/noannoyance"
license=("GPL-2.0-only")
depends=('gnome-shell')
makedepends=("git")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=(
    "${pkgname}::git+${url}"
    "001_metadata.patch"
)
b2sums=('SKIP'
        '2baf5669127e004f479f83c2babc4c6d857bc675a9b423c755eec1e7310e8c8f5fa2b41e281b1f157b0359b66f9abeca619e7490493c7168415c819581242d84')

pkgver() {
    cd $pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $pkgname
    for p in ../*.patch; do
        patch -Np1 -i "$p"
    done
}

package() {
    cd $pkgname

    local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local schema=$(grep -Po '(?<="settings-schema": ")[^"]*' metadata.json).gschema.xml
    local destdir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

    install -Dm644 extension.js prefs.js metadata.json README.md -t "$destdir"
    install -Dm644 "schemas/${schema}" -t "${pkgdir}/usr/share/glib-2.0/schemas/"
}
