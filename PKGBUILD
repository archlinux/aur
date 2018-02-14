# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.5.0
_numix_ver=1.6.1
_materia_ver=20180110
_archdroid_ver=1.0.2
_gnome_colors_ver=5.5.3
_oomoxify_ver=675fedce9a47745212b062e13a7e51b01f2bb581

pkgname=oomox
pkgver=${_oomox_ver}
pkgrel=2
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
    'librsvg'
    'optipng'
    'parallel'
    'polkit'
    'python-gobject'
    'sassc'
    'zip'
)
optdepends=(
    'xorg-xrdb: for the `xresources` theme'
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
    "oomox-archdroid-icon-theme-${_archdroid_ver}.tar.gz::https://github.com/actionless/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.tar.gz"
    "oomox-gnome-colors-icon-theme-${_gnome_colors_ver}.tar.gz::https://github.com/actionless/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.zip::https://github.com/actionless/oomoxify/archive/${_oomoxify_ver}.zip"
)
md5sums=('982bcee23a67e2d3a1633b50310cc3e4'
         '7b86af8b2a5eb1f9b0152ea609060b31'
         '982ef08f7d5d6229e3b0fcbd1896ebfc'
         '48ca9edc0cf2b06bdc353bd5f2c833ba'
         'f3a30f186dc92a972b88975fcbd321ed'
         'fbef02b2584fbafb009309eca6d28a54')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_numix_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    cp -pr "materia-theme-${_materia_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "${pkgname}-archdroid-icon-theme-${_archdroid_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "${pkgname}-gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/plugins/oomoxify"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/oomox-${_oomox_ver}"
    sed -i 's/rm -r/rm -rf/g' packaging/install.sh
    ./packaging/install.sh . "${pkgdir}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
}
