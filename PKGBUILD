# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.4.99
_numix_ver=1.4.0.2
_materia_ver=20171213
_archdroid_ver=1.0.1
_gnome_colors_ver=1.0
_oomoxify_ver=5640e1c2323a319ede50b24b2d2f45b49e76e112

pkgname=oomox
pkgver=${_oomox_ver}_${_numix_ver}_${_materia_ver}
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
    "oomox-archdroid-icon-theme-${_archdroid_ver}.tar.gz::https://github.com/actionless/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.tar.gz"
    "oomox-gnome-colors-icon-theme-${_gnome_colors_ver}.tar.gz::https://github.com/actionless/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.zip::https://github.com/actionless/oomoxify/archive/${_oomoxify_ver}.zip"
)
md5sums=('1d8dd19bf6e2fb3af9682e4b89218937'
         '7dc275331809a46bc5673e44d81dfdfb'
         'c12b3b8813f1fe5a92525e55d68afa9e'
         'dddd9735950933d31110875d4477893e'
         'bd459672e65140a7879951715114fdd2'
         '41d604da88231b844402673b454300ea')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_numix_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    cp -pr "materia-theme-${_materia_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "${pkgname}-archdroid-icon-theme-${_archdroid_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "${pkgname}-gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/oomoxify"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/oomox-${_oomox_ver}"
    sed -i 's/rm -r/rm -rf/g' packaging/install.sh
    ./packaging/install.sh . "${pkgdir}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
}
