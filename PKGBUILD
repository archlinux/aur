# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>

pkgname=tastyworks
pkgver=1.0.16
pkgrel=4
pkgdesc="One of the fastest, most reliable, and most secure trading platforms in the world."
arch=('x86_64')
url="https://tastyworks.com/technology.html"
license=('Other')
depends=('java-runtime')
source=("https://download.tastyworks.com/desktop-1.x.x/$pkgver/$pkgname-$pkgver-1.x86_64.rpm"
        "tastyworks.png")
sha256sums=('8a2c9bd54dd1736aa07e693839939988d94951537709cf1bd3e9263ce3368fd5'
            '5875675195bb9156c050976e00c98538a6662740f5359e677d26fe5e21560cea')

prepare() {
    # Set correct permissions on executable files and libraries
    find            "$srcdir" -name "*.jar" -type f -exec chmod 755 {} \;
    find            "$srcdir" -name "*.so"  -type f -exec chmod 755 {} \;

    # Set correct information for the application .desktop launcher
    sed     -i      's|Name=tastyworks|Name=TastyWorks|'                                        "$srcdir/opt/$pkgname/bin/$pkgname.desktop"
    sed     -i      's|Comment=tastyworks|Comment=Trading Platform|'                            "$srcdir/opt/$pkgname/bin/$pkgname.desktop"
    sed     -i      's|Exec=/opt/tastyworks/bin/tastyworks|Exec=/usr/bin/tastyworks|'           "$srcdir/opt/$pkgname/bin/$pkgname.desktop"
    sed     -i      's|Icon=/opt/tastyworks/bin/tastyworks.png|Icon=tastyworks|'                "$srcdir/opt/$pkgname/bin/$pkgname.desktop"
    sed     -i      's|Categories=tastyworks|Categories=Network|'                               "$srcdir/opt/$pkgname/bin/$pkgname.desktop"

    # Add the correct startup window manager class
    # This *should* fix gnome from creating more than one dock entry for the program
    echo            'StartupWMClass=tasty.javafx.launcher.LauncherFxApp'                    >>  "$srcdir/opt/$pkgname/bin/$pkgname.desktop"
    sed     -i      '/^[[:space:]]*$/d'                                                         "$srcdir/opt/$pkgname/bin/$pkgname.desktop"

    # Remove additional bundled Java "runtime"
    sed     -i      's|app.runtime=$APPDIR/runtime|app.runtime=/usr/lib/jvm/default-runtime|'   "$srcdir/opt/$pkgname/app/tastyworks.cfg"
}

package() {
    # Install program executable
    install -d      "$pkgdir/usr/bin"
    install -Dm 755 "$srcdir/opt/$pkgname/bin/$pkgname"                                         "$pkgdir/usr/lib/$pkgname/bin/$pkgname"
    ln      -s      "/usr/lib/$pkgname/bin/$pkgname"                                            "$pkgdir/usr/bin/$pkgname"

    # Install additional program library
    install -Dm 755 "$srcdir/opt/$pkgname/bin/libapplauncher.so"                                "$pkgdir/usr/lib/$pkgname/bin/libapplauncher.so"

    # Install application launcher
    install -Dm 644 "$srcdir/opt/$pkgname/bin/$pkgname.desktop"                                 "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install application icon
    install -Dm 644 "$pkgname.png"                                                              "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Install necessary Java program jars
    install -d      "$pkgname/usr/lib/$pkgname/app"
    cp      -r      "$srcdir/opt/$pkgname/app/"                                                 "$pkgdir/usr/lib/$pkgname/app/"
}