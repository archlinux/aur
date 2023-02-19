# Maintainer: Radeox <dawid.weglarz95@gmail.com>

pkgname=gnome-shell-extension-forge
_pkgname=forge
_gnomever=43
pkgver=62
pkgrel=3
pkgdesc="Tiling window manager for Gnome-Shell"
arch=('any')
url="https://github.com/jmmaranan/forge"
license=('GPLv3')
depends=('gnome-shell')
makedepends=('intltool' 'gettext' 'git' 'sassc')
source=("https://github.com/jmmaranan/${_pkgname}/archive/refs/tags/v${_gnomever}-${pkgver}.tar.gz")
sha256sums=("3b39f58c4b3ca4a893942e5a8a7ad06a0f501642d8d7c9aec1b221cc888e77a4")

build() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/
    make build
}

package() {
    cd ${srcdir}/${_pkgname}-${_gnomever}-${pkgver}/

    # Workaround
    # Install extension in user directory fixes the settings not opening
    # Seems gnome uses the compiled version of the schema
    # Check FIXME below
    make DESTDIR="${pkgdir}" VERSION="${pkgver}" install

    # local uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)

    # Copying files
    # install -d "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
    # cp -rT temp "$pkgdir/usr/share/gnome-shell/extensions/$uuid"
    # cp -r temp/locale "$pkgdir/usr/share/"

    # Installing schemas
    # install -Dm644 "temp/schemas/org.gnome.shell.extensions.forge.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas/"
    # FIXME: gschemas.compiled can't be copied since it's already present in the filesystem
    # This was a test to see if it would work
    # install -Dm644 "temp/schemas/gschemas.compiled" -t "$pkgdir/usr/share/glib-2.0/schemas/"

    # Removing unnecessary files
    # rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$uuid/locale"
    # rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$uuid/schemas"
}
