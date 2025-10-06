# Maintainer: Henrique B. (hpsbranco at gmail dot com)
pkgname=gnome-shell-extension-no-annoyance-git
pkgver=r73.8ca0647
pkgrel=2
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
        '840ef8820e4efb3e2fb193e940e930d4e36127bf04103b84151e9447418fbe6b67a095053704c4d8a453478e63ad593a75f699d4116d773f596e5caaae9131cd')

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
