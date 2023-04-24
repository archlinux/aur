pkgname=bricscad-fr_fr
pkgver=23.2.03
pkgrel=1
pkgdesc="Logiciel de CAO DWG"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(lib32-glibc cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)
makedepends=(python-requests python-beautifulsoup4 python-progressbar)
provides=('bricscad')
_lang=fr_FR
_os=2
_version=8038

# To download you must be logged in. The official website has no permanent link.
DLAGENTS=("https::/usr/bin/python $PWD/dlagent.py %u %o $_os $_version")

source=(
    dlagent.py
    "BricsCAD-V${pkgver}-1-${_lang}.${arch}.rpm::${url}"
)

package() {
    cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
    cp -dr --no-preserve=ownership ./opt "${pkgdir}"/
    cp -dr --no-preserve=ownership ./var "${pkgdir}"/
    # Allow creation of licence file for anyone
    chmod -R 757 "${pkgdir}"/var/bricsys
}

post_install() {
    if [ "$1" = "configure" ] && [ -x "`which update-menus 2>/dev/null`" ]; then
        update-menus
    fi

    if [ "$1" = "configure" ] && [ -x "`which update-desktop-database 2>/dev/null`" ]; then
        update-desktop-database /usr/share/applications/
    fi

    if [ "$1" = "configure" ] && [ -x "`which update-mime-database 2>/dev/null`" ]; then
        update-mime-database /usr/share/mime
    fi

    if [ "$1" = "configure" ] && [ -x "`which gtk-update-icon-cache 2>/dev/null`" ] && [ -x /usr/share/icons/gnome/index.theme ]; then
        gtk-update-icon-cache --force /usr/share/icons/gnome
    fi

    if [ "$1" = "configure" ] && [ -x "`which locale-gen 2>/dev/null`" ]; then
        locale-gen ${_lang}
    fi
}
post_remove() {
    if [ -x "`which update-menus 2>/dev/null`" ]; then update-menus ; fi

    if [ -x "`which update-desktop-database 2>/dev/null`" ]; then update-desktop-database /usr/share/applications/ ; fi

    if [ -x "`which update-mime-database 2>/dev/null`" ]; then update-mime-database /usr/share/mime ; fi

    if [ -x "`which gtk-update-icon-cache 2>/dev/null`" ] && [ -x /usr/share/icons/gnome/index.theme ]; then gtk-update-icon-cache --force /usr/share/icons/gnome ; fi
}
md5sums=('d2cb8b0f09448d0d2c2a8762d11a9aca'
         'eb5b34f3985568f49c4ce7f61845629f')
