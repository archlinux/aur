# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.6.1
_numix_ver=1.8.0
_materia_ver=20180311
_archdroid_ver=1.0.2
_gnome_colors_ver=5.5.3
_oomoxify_ver=1.0

pkgname=oomox
pkgver=${_oomox_ver}
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
    'findutils'
    'gdk-pixbuf2'
    'glib2'
    'gtk-engine-murrine'
    'gtk-engines'
    'gtk3'
    'imagemagick'
    'inkscape'
    'librsvg'
    'optipng'
    'parallel'
    'polkit'
    'python-gobject'
    'python-pillow'
    'sassc'
    'sed'
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
    "oomoxify-${_oomoxify_ver}.tar.gz::https://github.com/actionless/oomoxify/archive/${_oomoxify_ver}.tar.gz"
)
md5sums=('9a9534620828a0d94793f3419886380c'
         '0190629de56d822efccf32b43324c479'
         'd34fd7d7f765c38d8be95b778a90ea2b'
         '48ca9edc0cf2b06bdc353bd5f2c833ba'
         'f3a30f186dc92a972b88975fcbd321ed'
         'df970e658de7668a7088bd445e4634fb')

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
    cd "${srcdir}/${pkgname}-${_oomox_ver}"
    sed -i 's/rm -r/rm -rf/g' packaging/install.sh
    ./packaging/install.sh . "${pkgdir}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
}
