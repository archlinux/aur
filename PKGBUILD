# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Popolon <popolon@popolon.org>
# Contributor: Martin Minka <https://github.com/k2s>
# Contributor: migerh <https://github.com/migerh>
# Contributor: hollunder <murks at tuxfamily dot org>

pkgname=wxlua-git
pkgver=WX_3_1_0.7d9d59.r17.gead9b38
pkgrel=2
pkgdesc="A set of bindings to the wxWidgets library for the Lua programming language - fork with Lua 5.3 support"
arch=('i686' 'x86_64' 'armv7h' 'armv8')
url="https://github.com/pkulchenko/wxlua"
license=('custom:wxWindows')
depends=('desktop-file-utils' 'wxgtk' 'lua')
makedepends=('git' 'cmake')
provides=('wxlua' 'wxstedit')
conflicts=('wxlua' 'wxstedit')
source=("git://github.com/pkulchenko/wxlua.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${pkgname%-git}/wxLua/

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DwxWidgets_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DwxLuaBind_COMPONENTS="stc;gl;html;aui;adv;core;net;base" \
        -DBUILD_SHARED_LIBS=TRUE
    make
}

package() {
    cd ${pkgname%-git}/wxLua/build
    make DESTDIR="$pkgdir/" install
    rm $pkgdir/usr/bin/lua
    rm $pkgdir/usr/bin/luac

    # mv lua module
    install -d "$pkgdir/usr/lib/lua/5.3"
    mv "$pkgdir/usr/lib/libwx.so" "$pkgdir/usr/lib/lua/5.3/wx.so"

    cd ..

    install -Dm644 distrib/autopackage/wxlua.desktop \
        "$pkgdir/usr/share/applications/wxlua.desktop"

    install -Dm644 art/wxlualogo.xpm \
        "$pkgdir/usr/share/icons/wxlualogo.xpm"

    install -Dm644 distrib/autopackage/wxlua.xml \
        "$pkgdir/usr/share/mime/packages/wxlua.xml"

    install -Dm 644 docs/licence.txt \
        "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
