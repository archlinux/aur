# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk-sorayomi-git
__pkgname="${pkgname%-git}"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.1.1.r0.g69e1bfe
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity')
optdepends=('tachidesk-server')
makedepends=('git' 'flutter-beta')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$__PkgName"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$__PkgName"
    flutter config --enable-linux-desktop
    flutter pub get
    flutter build linux --release
}

package() {
    cd "$__PkgName"
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "build/linux/x64/release/bundle/" -T "$pkgdir/opt/$__pkgname/"
    install -Dm644 "scripts/$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$__pkgname.png"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
}
