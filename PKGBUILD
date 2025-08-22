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
        'c8868e7cfcd961a9f2395732d76ca57023515aadd29de8b4899e53eed1a08708793cf956234890514c5e010c62e3fcb0d79d41365396470ceb9fc0e41e600575')

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
