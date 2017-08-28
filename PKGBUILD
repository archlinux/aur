# Maintainer: Laurent Treguier <laurent@treguier.org>

_oomox_ver=1.3.0
_numix_ver=1.2.8.1
_flatplat_ver=20170605
_flatplat_commit=96bffc0b13c81a0a608e036da5b1c720e647a11a
_flatplat_githash=$(c=${flatplat_commit}; echo ${c:0:7})
_flatplat_gitdate=20170827

pkgname=oomox
pkgver=${_oomox_ver}_${_numix_ver}_${_flatplat_gitdate}git${_flatplat_githash}
pkgrel=1
pkgdesc='Graphical application for generating different color variations of Numix theme (GTK2, GTK3), gnome-colors and ArchDroid icon themes.
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
provides=('oomox')
conflicts=('oomox-git')
source=(
    "oomox-${_oomox_ver}.tar.gz::https://github.com/actionless/oomox/archive/${_oomox_ver}.tar.gz"
    "oomox-gtk-theme-${_numix_ver}.tar.gz::https://github.com/actionless/oomox-gtk-theme/archive/${_numix_ver}.tar.gz"
    "flat-plat-theme-${_flatplat_commit}.zip::https://github.com/nana-4/Flat-Plat/archive/${_flatplat_commit}.zip"
    'oomox-cli'
    'oomox-gui'
    'oomox-gnome-colors-icons-cli'
    'oomox-archdroid-icons-cli'
    'oomoxify-cli'
    'oomox.desktop'
)
md5sums=('505ae6937bfcb070b900443c124d4a9d'
         '983b4dfa91d0f0bc87afa82d28090c18'
         '3f8209289b1cd03b57b953c4237ccddc'
         'efc83d981e1fcfb41c6d439f1013efbd'
         '0d156463416bbc2260c073c15b7f2a70'
         '57cfcc4141ce6e346da7ab8bab411b14'
         'f01aa2280f8e03d6244fe6284c44a03b'
         'a9e990b0c4c0ee3be2f195c9c25d36e6'
         '87f09004fa77db669072e8e6decf5618')

prepare() {
    cp -pr "${srcdir}/${pkgname}-gtk-theme-${_numix_ver}"/* "${srcdir}/${pkgname}-${_oomox_ver}/gtk-theme"
    cp -pr "${srcdir}/Flat-Plat-${_flatplat_commit}"/* "${srcdir}/${pkgname}-${_oomox_ver}/flat-plat-theme"
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
