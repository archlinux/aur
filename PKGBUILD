# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.6.2.1
_numix_ver=1.9.0
_materia_ver=20180311
_materia_cmt=df30959eb068ef55db18a18ed23a4a1c79129768
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
    "oomox-${_oomox_ver}.tar.gz::https://github.com/themix-project/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_numix_ver}.tar.gz::https://github.com/themix-project/oomox-gtk-theme/archive/${_numix_ver}.tar.gz"
    "materia-theme-${_materia_cmt}.zip::https://github.com/actionless/materia-theme/archive/${_materia_cmt}.zip"
    "archdroid-icon-theme-${_archdroid_ver}.tar.gz::https://github.com/themix-project/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.tar.gz"
    "gnome-colors-icon-theme-${_gnome_colors_ver}.tar.gz::https://github.com/themix-project/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.tar.gz::https://github.com/themix-project/oomoxify/archive/${_oomoxify_ver}.tar.gz"
)
md5sums=('ddc61813a332e068e619cd7cf90d26f2'
         '0769a6c072d8ad7661a16b67a6bcdd48'
         '7da360ebc9303ef388a6ad9dc8e06222'
         'cb669130685dcbf03a8f7f5738c71dc6'
         'ae3250f1dce9505dbaa60d92dcb9a239'
         'df970e658de7668a7088bd445e4634fb')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_numix_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    cp -pr "materia-theme-${_materia_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "archdroid-icon-theme-${_archdroid_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/plugins/oomoxify"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${pkgname}-${_oomox_ver}"
    sed -i 's/rm -r/rm -rf/g' packaging/install.sh
    ./packaging/install.sh . "${pkgdir}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
}
