# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname="tableplus"
pkgver=0.1_14
pkgrel=1
pkgdesc="Modern, native, and friendly GUI tool for relational databases (Alpha Release)"
arch=("x86_64")
url="https://tableplus.com/linux/install"
license=("custom")
depends=("libpqxx" "mariadb-libs" "libnm" "libsoup" "gtksourceview3" "libgee")
source=("https://deb.tableplus.com/debian/pool/main/t/tableplus/tableplus_${pkgver//_/-}_amd64.deb"
        "LICENSE"
        "tableplus.desktop.patch")
sha256sums=("18d9c99c97b2415db7885fd1f36101dccb859447585ada4937d478c4ce425f2b"
            "76f924b1ebad5309ccf0dd7f3fe3d1b57ff3088b208a603900b0e240fdb5debb"
            "4608c2cc7da84cf6d5f9943cf729e890bdb9198dbd391ba11fd1e4669068368f")

prepare() {
    tar -xf data.tar.xz
}

package() {
    # Install binary
    mkdir -p "$pkgdir/usr/local/bin/"
    install -Dm755 "$srcdir/opt/tableplus/tableplus" "$pkgdir/usr/local/bin/"

    # Install supporting files
    mkdir -p "$pkgdir/opt/tableplus/resource/"
    cp -r "$srcdir//opt/tableplus/resource" "$pkgdir/opt/tableplus/"
    chown -R root: "$pkgdir/opt/tableplus"
    chmod -R 0755 "$pkgdir/opt/tableplus"

    # Install .desktop file
    mkdir -p "$pkgdir/usr/share/applications/"
    patch -d "$srcdir/opt/tableplus/" < tableplus.desktop.patch
    install -Dm644 "$srcdir/opt/tableplus/tableplus.desktop" "$pkgdir/usr/share/applications/"

    # Installl custom license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
