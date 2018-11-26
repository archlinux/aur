# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.7.2
_numix_ver=1.9.2
_materia_ver=20181125
_arc_cmt=e97206cf0772da5b07b982da67cc65d91884d48d
_archdroid_ver=1.0.2
_gnome_colors_ver=5.5.3
_oomoxify_ver=1.1
_base16_cmt=d022b9daa5c233a08a8d3b94fd534a3041e3a8c1

pkgname=oomox
pkgver=${_oomox_ver}
pkgrel=2
pkgdesc='Graphical application for generating different color variations of Numix/Materia/Arc theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes.
Have a hack for HiDPI in gtk2.'
arch=('i686' 'x86_64')
url='https://github.com/themix-project/oomox'
license=('GPL3')
depends=(
	'gtk3'
	'python-gobject'
	'glib2'  # oomox, materia, arc
	'gdk-pixbuf2'  # oomox, materia, arc
	'gtk-engine-murrine'  # oomox, materia, arc
	'gtk-engines'  # oomox, materia, arc
	'gnome-themes-extra'  # materia
	'sassc'  # oomox, materia, arc
	'librsvg'  # oomox, gnome-colors
	'sed'  # oomox, materia, arc, gnome-colors, archdroid
	'findutils'  # oomox, materia, arc, gnome-colors, arch-droid
	'grep'  # oomoxify, oomox, materia, arc, gnome-colors
	'bc'  # oomoxify, oomox, materia, arc, gnome-colors
	'zip'  # oomoxify
	'polkit'  # oomoxify
	'imagemagick'  # gnome-colors
	'parallel'  # materia, arc
	'optipng'  # materia, arc
	'inkscape'  # materia, arc
	'python-pillow'  # import_pil
)
optdepends=(
	'xorg-xrdb: for the `xresources` theme'
	'breeze-icons: more fallback icons'
	'gksu: for applying Spotify theme from GUI without polkit'
	'colorz: additional image analyzer for "Import colors from image" plugin'
	'python-colorthief: additional image analyzer for "Import colors from image" plugin'
	'python-haishoku: additional image analyzer for "Import colors from image" plugin'
)
options=(
    '!strip'
)
provides=('oomox')
conflicts=('oomox-git')
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/themix-project/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_numix_ver}.tar.gz::https://github.com/themix-project/oomox-gtk-theme/archive/${_numix_ver}.tar.gz"
    "materia-theme-v${_materia_ver}.tar.gz::https://github.com/nana-4/materia-theme/archive/v${_materia_ver}.tar.gz"
    "arc-theme-${_arc_cmt}.tar.gz::https://github.com/NicoHood/arc-theme/archive/${_arc_cmt}.tar.gz"
    "archdroid-icon-theme-${_archdroid_ver}.tar.gz::https://github.com/themix-project/oomox-archdroid-icon-theme/archive/${_archdroid_ver}.tar.gz"
    "gnome-colors-icon-theme-${_gnome_colors_ver}.tar.gz::https://github.com/themix-project/oomox-gnome-colors-icon-theme/archive/${_gnome_colors_ver}.tar.gz"
    "oomoxify-${_oomoxify_ver}.tar.gz::https://github.com/themix-project/oomoxify/archive/${_oomoxify_ver}.tar.gz"
    "base16-builder-${_base16_cmt}.tar.gz::https://github.com/base16-builder/base16-builder/archive/${_base16_cmt}.tar.gz"
)
md5sums=('56208eaa65ea4500200e5d78f448e69f'
         'bcc635f0dd06b0b0fae1f318d3271ec2'
         'a6ecf1c694f437bf0c6c07834fdd0704'
         '19029e06b6fbda8a40eb047978c6a8ba'
         'cb669130685dcbf03a8f7f5738c71dc6'
         'ae3250f1dce9505dbaa60d92dcb9a239'
         'd0c0f22c082cfd7c57148e7da809ddfb'
         '38fc51a55c798032266c03ee82461119')

prepare() {
    cd ${srcdir}
    cp -pr "${pkgname}-gtk-theme-${_numix_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_oomox/gtk-theme"
    cp -pr "materia-theme-${_materia_ver}"/* "${pkgname}-${_oomox_ver}/plugins/theme_materia/materia-theme"
    cp -pr "arc-theme-${_arc_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/theme_arc/arc-theme"
    cp -pr "archdroid-icon-theme-${_archdroid_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_archdroid/archdroid-icon-theme"
    cp -pr "gnome-colors-icon-theme-${_gnome_colors_ver}"/* "${pkgname}-${_oomox_ver}/plugins/icons_gnomecolors/gnome-colors-icon-theme"
    cp -pr "oomoxify-${_oomoxify_ver}"/* "${pkgname}-${_oomox_ver}/plugins/oomoxify"
    cp -pr "base16-builder-${_base16_cmt}"/* "${pkgname}-${_oomox_ver}/plugins/import_base16/base16-data"
}

package() {
    _oomox_dir="/opt/${pkgname}"
    _oomox_gui_dir="${_oomox_dir}/oomox_gui"

    cd "${srcdir}/${pkgname}-${_oomox_ver}"
    make DESTDIR="${pkgdir}" APPDIR="${_oomox_dir}" PREFIX="/usr" install
    python -O -m compileall "${pkgdir}/${_oomox_gui_dir}" -d "${_oomox_gui_dir}"
}
