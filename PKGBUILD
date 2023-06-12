# Maintainer: peippo <christoph+aur@christophfink.com>
# Contributor: Sebastian Wiesner <sebastian@swsnr.de>

pkgname="gnome-shell-extension-improvedosk"
pkgdesc="Improved on-screen keyboard for the GNOME shell"
url="https://github.com/nick-shmyrev/improved-osk-gnome-ext"
license=("GPL3")
pkgver=18
pkgrel=1

_commit="b67e307a475d4d9db0f6f50d868447f961a27be4"  # upstream has no tags
_uuid="improvedosk@nick-shmyrev.dev"

arch=("any")
depends=("gnome-shell")
makedepends=("unzip")
optdepends=("ttf-symbola: Recommended font for symbols")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=("886260744ba5f06ac556c981b24e9c452786e3c17f3aebcf41eecbb693109e2dbcd61e82f44b15bf8efd014bd963c03d39b5b9ef5fc9e507c6366090e0ddd380")

build() {
    cd "improved-osk-gnome-ext-${_commit}"

    glib-compile-resources src/data/gnome-shell-osk-layouts.gresource.xml \
        --sourcedir=src/data/osk-layouts \
        --target=src/data/gnome-shell-osk-layouts.gresource
    glib-compile-schemas src/schemas
}

package() {
    cd "improved-osk-gnome-ext-${_commit}"

    local extdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"

    install -d -m755 "${extdir}"/{schemas,data}

    install \
        -m644 \
        -t "${extdir}/schemas" \
        src/schemas/gschemas.compiled \
        src/schemas/org.gnome.shell.extensions.improvedosk.gschema.xml

    install -m644 -t "${extdir}/data" src/data/gnome-shell-osk-layouts.gresource
    install -m644 -t "${extdir}" src/*.js src/metadata.json
}
