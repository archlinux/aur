# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname="tableplus"
pkgver=0.1_8
pkgrel=1
pkgdesc="Modern, native, and friendly GUI tool for relational databases (Alpha Release)"
arch=("x86_64")
url="https://tableplus.com/linux/install"
license=("custom")
depends=("libpqxx" "mariadb-libs" "libnm" "libsoup" "gtksourceview3")
provides=("libmysqlclient20")
conflicts=("libmysqlclient20")
source=("$pkgname-$pkgver.deb::https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver//_/-}_amd64.deb"
        "libmysqlclient.deb::http://mirrors.kernel.org/ubuntu/pool/main/m/mysql-5.7/libmysqlclient20_5.7.28-0ubuntu0.16.04.2_amd64.deb"
        "LICENSE"
        "LICENSE-MYSQL")
noextract=("$pkgname-$pkgver.deb" "libmysqlclient.deb")
sha256sums=("00d08d9cd78203c956f57718a1bcaa9343d92b300f2b02f229aa32622d1d5fb8"
            "e2eccedd672eb92ebcee71200fe766378c85ec584d6da59271ba8567a0b7dfd2"
            "76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb"
            "62a7999ee37586e22392c758721dea5e95bf942223a285f19ad57e41ae5fa6d2")

prepare() {
    # Extract TablePlus binary files
    cd $srcdir
    mkdir -p "$srcdir/$pkgname"
    cd "$srcdir/$pkgname"
    ar x "$srcdir/$pkgname-$pkgver.deb"
    tar -xf data.tar.xz

    # Extract libmysqlclient files
    cd $srcdir
    mkdir -p "$srcdir/libmysqlclient"
    cd "$srcdir/libmysqlclient"
    ar x "$srcdir/libmysqlclient.deb"
    tar -xf data.tar.xz
}

package() {
    # Install binary
    mkdir -p "$pkgdir/usr/local/bin/"
    install -Dm755 "$srcdir/$pkgname/opt/tableplus/tableplus" "$pkgdir/usr/local/bin/"

    # Install supporting files
    mkdir -p "$pkgdir/opt/tableplus/resource/"
    cp -r "$srcdir/$pkgname/opt/tableplus/resource" "$pkgdir/opt/tableplus/"
    chown -R root: "$pkgdir/opt/tableplus"
    chmod -R 0755 "$pkgdir/opt/tableplus"

    # Install libmysqlclient 20
    install -Dm644 "$srcdir/libmysqlclient/usr/lib/x86_64-linux-gnu/libmysqlclient.so.20.3.15" "$pkgdir/usr/lib/libmysqlclient.so.20"

    # Install .desktop file
    mkdir -p "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$pkgname/opt/tableplus/tableplus.desktop" "$pkgdir/usr/share/applications/"

    # Installl custom licenses
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE-MYSQL "$pkgdir/usr/share/licenses/libmysqlclient20/LICENSE"
}
