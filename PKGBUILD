# Maintainer: Djalel Oukid <sniper1720@linuxtechmore.com>
pkgname=khushu
pkgver=1.0.0
pkgrel=1
pkgdesc="An all-in-one Muslim app for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/sniper1720/khushu"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'glibc' 'gcc-libs' 'geoclue2' 'alsa-lib' 'ttf-amiri')
optdepends=('xdg-desktop-portal: autostart portal support')
makedepends=('cargo' 'gettext')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sniper1720/khushu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5d66a237d0768dd4d79f46032798ba49f1683781198c342f8f1fa6f294d5abe7')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/khushu "$pkgdir/usr/bin/khushu"
    
    install -Dm644 assets/khushu.desktop "$pkgdir/usr/share/applications/io.github.sniper1720.khushu.desktop"

    install -Dm644 assets/icons/hicolor/scalable/apps/io.github.sniper1720.khushu.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.sniper1720.khushu.svg"
    install -Dm644 assets/icons/hicolor/symbolic/apps/io.github.sniper1720.khushu-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.sniper1720.khushu-symbolic.svg"
    install -Dm644 assets/io.github.sniper1720.khushu.metainfo.xml "$pkgdir/usr/share/metainfo/io.github.sniper1720.khushu.metainfo.xml"
    

    for mo_file in target/locale/*/LC_MESSAGES/khushu.mo; do
        if [ -f "$mo_file" ]; then
            lang=$(echo "$mo_file" | cut -d'/' -f3)
            install -Dm644 "$mo_file" "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/khushu.mo"
        fi
    done

    for lib in gtk40 libadwaita; do
        for mo_file in target/locale/*/LC_MESSAGES/$lib.mo; do
            if [ -f "$mo_file" ]; then
                lang=$(echo "$mo_file" | cut -d'/' -f3)
                install -Dm644 "$mo_file" "$pkgdir/usr/share/khushu/locale/$lang/LC_MESSAGES/$lib.mo"
            fi
        done
    done
}
