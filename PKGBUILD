# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.4.4.1
_numix_ver=1.3.1.1
_materia_ver=20171213
_archdroid_ver=1bf91f49f76112d48415bfa997aabc2cea84f01d
_gnome_colors_ver=3c8596ea630b8255b9cf5d5bf90a69658dd32b79

pkgname=oomox
pkgver=${_oomox_ver}_${_numix_ver}_${_materia_ver}
pkgrel=1
pkgdesc='Graphical application for generating different color variations of Numix/Materia theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes.
Have a hack for HiDPI in gtk2.'
arch=('i686' 'x86_64')
url='https://github.com/actionless/oomox'
license=('GPL3')
depends=(
    'coreutils'
    'bash'
    'bc'
    'gdk-pixbuf2'
    'glib2'
    'gtk-engine-murrine'
    'gtk-engines'
    'imagemagick'
    'inkscape'
    'optipng'
    'parallel'
    'polkit'
    'python-gobject'
    'sassc'
    'zip'
)
optdepends=(
    'xorg-xrdb: for the `xresources` theme'
    'gnome-colors-common-icon-theme: for using the generated icon theme'
    'breeze-icons: more fallback icons'
    'gksu: for applying Spotify theme from GUI without polkit'
)
options=(
    '!strip'
)
provides=('oomox')
conflicts=('oomox-git')
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/actionless/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_numix_ver}.tar.gz::https://github.com/actionless/oomox-gtk-theme/archive/${_numix_ver}.tar.gz"
    "materia-theme-${_materia_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_ver}.tar.gz"
    "oomox-archdroid-icon-theme-${_archdroid_ver}.zip::https://github.com/actionless/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.zip"
    "oomox-gnome-colors-icon-theme-${_gnome_colors_ver}.zip::https://github.com/actionless/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.zip"
    'oomox-gui'
    'oomox-cli'
    'oomox-materia-cli'
    'oomox-gnome-colors-icons-cli'
    'oomox-archdroid-icons-cli'
    'oomoxify-cli'
    'oomox.desktop'
)
md5sums=('009978ee18d89b254f4a81b51f73f61d'
         '741a495898d98feadf650c63ed6267a9'
         'c12b3b8813f1fe5a92525e55d68afa9e'
         'b02338c77e033933c28b8e95d8c74b71'
         '1494fc4bf2d4b17966cf81cfc39212f6'
         '0d156463416bbc2260c073c15b7f2a70'
         '049ca4cab087c18cf59aed5356962205'
         'f01aa2280f8e03d6244fe6284c44a03b'
         'a94039582afe30104b1444783d9c14b9'
         'e5332b7f719913a06131d3b41c63b0e7'
         'a9e990b0c4c0ee3be2f195c9c25d36e6'
         '87f09004fa77db669072e8e6decf5618')

prepare() {
    cp -pr "${srcdir}/${pkgname}-gtk-theme-${_numix_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gtk-theme"
    cp -pr "${srcdir}/materia-theme-${_materia_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/materia-theme"
    cp -pr "${srcdir}/${pkgname}-archdroid-icon-theme-${_archdroid_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/archdroid-icon-theme"
    cp -pr "${srcdir}/${pkgname}-gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gnome-colors-icon-theme"
}

package() {
    make -C "${srcdir}/${pkgname}-${_oomox_ver}" -f po.mk install
    install -d "${pkgdir}/opt/${pkgname}"
    cp -pr "${srcdir}/${pkgname}-${_oomox_ver}"/* "${pkgdir}/opt/${pkgname}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    for script in oomox-gui oomox-cli oomox-materia-cli oomox-gnome-colors-icons-cli oomox-archdroid-icons-cli oomoxify-cli
    do
        install -Dm755 "${srcdir}/${script}" "${pkgdir}/usr/bin"
    done

    install -Dm644 "${srcdir}/oomox.desktop" "${pkgdir}/usr/share/applications"
}
