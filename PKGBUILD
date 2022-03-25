# Maintainer: skrewball <skrewball at joickle dot com>
# Maintainer: Christian Brassat <christian.brassat at gmail dot com>

pkgname=gnome-shell-extension-arc-menu
pkgver=27
pkgrel=1
pkgdesc="Application Menu Extension for GNOME"
arch=('any')
url="https://gitlab.com/arcmenu/ArcMenu"
license=('GPL2')
depends=(
    'dconf'
    'gnome-shell>=40'
    'gnome-shell-extensions'
    'gnome-menus'
)
conflicts=('gnome-shell-extension-arc-menu-git')
source=("https://gitlab.com/arcmenu/ArcMenu/-/archive/v${pkgver}/ArcMenu-v${pkgver}.tar.gz")
sha256sums=('26cb503a59ce5397cafe9b13352321209100d533f6ad9256414bb61f061e07b2')

build() {
    cd "ArcMenu-v${pkgver}"
    make DESTDIR="${srcdir}/" install
    cd .. && rm -rf "ArcMenu-v${pkgver}"
}

package() {
    # Locate compiled extention.
    cd "$(dirname $(find -name 'metadata.json' -print -quit))"
    local _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
    local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
    # Install extension files
    install -Dm644 -t "${_destdir}" metadata.json *.js
    cp -r --no-preserve=ownership,mode media "${_destdir}"
    cp -r --no-preserve=ownership,mode menulayouts "${_destdir}"
    cp -r --no-preserve=ownership,mode searchProviders "${_destdir}"
    # Install GSettings Schemas & Locale
    install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" schemas/*.xml
    cd locale
    for locale in */
      do
        install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
      done
}
