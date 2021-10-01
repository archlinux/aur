pkgname=bricscad-fr_fr
pkgver=21.2.06
pkgrel=2
pkgdesc="Logiciel de CAO DWG"
arch=("x86_64")
url="https://www.bricsys.com"
license=('Custom:bricscad')
depends=(lib32-glibc cairo lib32-fontconfig libcups lib32-freetype2 lib32-gtk2)
makedepends=(python-requests python-beautifulsoup4)
provides=('bricscad')
_lang=fr_FR
_os=2
_version=7021

# To download you must be logged in. The official website has no permanent link.
DLAGENTS=("https::/usr/bin/python $PWD/dlagent.py %u %o $_os $_version")

source=(
    dlagent.py
    "BricsCAD-V${pkgver}-1-${_lang}.${arch}.rpm::${url}"
    "gtk3-1:3.24.30-2-x86_64.pkg.tar.zst::https://archive.archlinux.org/packages/g/gtk3/gtk3-1%3A3.24.30-2-x86_64.pkg.tar.zst"
)

noextract=('gtk3-1:3.24.30-2-x86_64.pkg.tar.zst')

prepare() {
    mkdir -p gtk3
    tar xf './gtk3-1:3.24.30-2-x86_64.pkg.tar.zst' -C gtk3
}

package() {
    cp -dr --no-preserve=ownership ./usr "${pkgdir}"/
    cp -dr --no-preserve=ownership ./opt "${pkgdir}"/
    cp -dr --no-preserve=ownership ./var "${pkgdir}"/
    # Allow creation of licence file for anyone
    chmod 757 "${pkgdir}"/var/bricsys
    # patch for "symbol lookup error: /usr/lib/libtracker-sparql-3.0.so.0: undefined symbol: sqlite3_expanded_sql" error
    cp -a --no-preserve=ownership gtk3/usr/lib/libgtk-3.so* "${pkgdir}"/opt/bricsys/bricscad/v21/
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
md5sums=('6327d08422ca88ee89393e82727b2a6e'
         '0b190e5a07ea1e6de7cad948e0305cb8'
         'c1c55da4102090d790205b36ab213f94')
