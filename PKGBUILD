# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-improvedosk
pkgver=11
# Upstream has no tags, so we refer to the commit which bumped the version
_commit='df3857ca731595adeedb70b493a389c069f7022e'
pkgrel=2
pkgdesc="Makes GNOME's onscreen keyboard more useable."
arch=('any')
url='https://github.com/nick-shmyrev/improved-osk-gnome-ext'
license=('GPL3')
depends=('gnome-shell')
makedepends=('unzip')
optdepends=('ttf-symbola: Recommended font for symbols')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${_commit}.tar.gz")
sha512sums=(
    '2199489c95e96a1baba97ff5114b79c219670652ba55a56537cc4db4df2c8182fdbd3a6e4ef0f9d6457071c1c7055e500015a8c38d2fcf9886a4a60df988bcee'
)
_uuid='improvedosk@nick-shmyrev.dev'

build() {
    cd "improved-osk-gnome-ext-${_commit}" || exit
    glib-compile-resources src/data/gnome-shell-osk-layouts.gresource.xml \
        --sourcedir=src/data/osk-layouts --target=src/data/gnome-shell-osk-layouts.gresource
    glib-compile-schemas src/schemas
}

package() {
    cd "improved-osk-gnome-ext-${_commit}" || exit

    local extdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}/"
    install -d -m755 "${extdir}"/{schemas,data}
    install -m644 -t "${extdir}/schemas" \
        src/schemas/gschemas.compiled src/schemas/org.gnome.shell.extensions.improvedosk.gschema.xml
    install -m644 -t "${extdir}/data" src/data/gnome-shell-osk-layouts.gresource
    install -m644 -t "${extdir}" src/*.js src/metadata.json
}
