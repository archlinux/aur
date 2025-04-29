pkgname=bricscad-fr_fr
pkgver=25.2.05
pkgrel=1
pkgdesc="Logiciel de CAO DWG"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(glibc cairo fontconfig libcups freetype2 gtk3)
makedepends=(python-requests python-beautifulsoup4 python-progressbar python-typing_extensions)
provides=('bricscad')
_lang=fr_FR
_os=2
_version=9327

### Check rpm dependencies
#sudo pacman -S rpm-tools
#rpm -qpR BricsCAD-V25.1.07-1-fr_FR.x86_64.rpm
###

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
md5sums=('1ed88931cf84e97516a2b1166cc52651'
         '5a3d9db674bc7f44f5d2ed018c84c900')