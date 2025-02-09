# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi
__pkgname="$pkgname"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.6.0
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs' 'gtk3' 'at-spi2-core')
optdepends=('tachidesk-server')
makedepends=('fvm' 'cmake' 'clang' 'ninja')
source=("tachidesk-sorayomi-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3a5c6fe70356063795e8bb76a31c6b72677dd89796cbe06e90fe61034660ffae')

prepare() {
    cd "$srcdir/$__PkgName-$pkgver"
    fvm use 3.27.4 --force
}

build() {
    cd "$srcdir/$__PkgName-$pkgver/"
    fvm flutter pub get
    fvm flutter build linux --release
}


package() {
    cd "$__PkgName-$pkgver/"
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "build/linux/x64/release/bundle/" -T "$pkgdir/opt/$__pkgname/"
    install -Dm644 "scripts/$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "assets/icons/launcher/sorayomi_icon.png" "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
}
