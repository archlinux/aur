# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi
__PkgName="$(echo "$pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$pkgname" | tr - _)"
pkgver=0.6.1
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs' 'gtk3' 'at-spi2-core')
optdepends=('tachidesk-server')
makedepends=('fvm' 'cmake' 'clang' 'ninja')
source=("tachidesk-sorayomi-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('15d153542d1d13ba444bec8aeeb1fda6e9019c803cee84db8506191b591f9050')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    fvm use 3.27.4 --force
}

build() {
    cd "$srcdir/$__PkgName-$pkgver/"
    fvm flutter pub get
    fvm flutter build linux --release
}


package() {
    cd "$__PkgName-$pkgver/"
    install -dm755 "$pkgdir/opt/$pkgname/"
    cp -a "build/linux/x64/release/bundle/" -T "$pkgdir/opt/$pkgname/"
    install -Dm644 "scripts/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "assets/icons/launcher/sorayomi_icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$pkgname/$_binname" "$pkgdir/usr/bin/$pkgname"
}
