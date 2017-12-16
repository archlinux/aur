# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.4.3
_numix_ver=1.3.0
_materia_ver=20171213

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
    'oomox-cli'
    'oomox-gui'
    'oomox-gnome-colors-icons-cli'
    'oomox-archdroid-icons-cli'
    'oomoxify-cli'
    'oomox.desktop'
)
md5sums=('d949862f150b04ac01a7e1a8738e9501'
         'fe454b208e64db2d2d94c0166d908da9'
         'c12b3b8813f1fe5a92525e55d68afa9e'
         'efc83d981e1fcfb41c6d439f1013efbd'
         '0d156463416bbc2260c073c15b7f2a70'
         '57cfcc4141ce6e346da7ab8bab411b14'
         'f01aa2280f8e03d6244fe6284c44a03b'
         'a9e990b0c4c0ee3be2f195c9c25d36e6'
         '87f09004fa77db669072e8e6decf5618')

prepare() {
    cp -pr "${srcdir}/${pkgname}-gtk-theme-${_numix_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gtk-theme"
    cp -pr "${srcdir}/materia-theme-${_materia_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/materia-theme"
}

package() {
    make -C "${srcdir}/${pkgname}-${_oomox_ver}" -f po.mk install
    install -d "${pkgdir}/opt/${pkgname}"
    cp -pr "${srcdir}/${pkgname}-${_oomox_ver}"/* "${pkgdir}/opt/${pkgname}"
    python -O -m compileall "${pkgdir}/opt/${pkgname}/oomox_gui"
    install -d "${pkgdir}/usr/bin/"
    install -d "${pkgdir}/usr/share/applications/"

    for script in oomox-cli oomox-gui oomox-gnome-colors-icons-cli oomox-archdroid-icons-cli oomoxify-cli
    do
        install -Dm755 "${srcdir}/${script}" "${pkgdir}/usr/bin"
    done

    install -Dm644 "${srcdir}/oomox.desktop" "${pkgdir}/usr/share/applications"
}
