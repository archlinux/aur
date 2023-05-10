# Maintainer: Mahor Foruzesh <mahor1221 at gmail dot com>

pkgname=tachidesk-sorayomi-git
__pkgname="${pkgname%-git}"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.4.6.r148.86eeeac
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs')
optdepends=('tachidesk-server')
makedepends=('git' 'flutter' 'cmake' 'clang' 'ninja')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$__PkgName"
  printf "%s.r%s.%s" "$(git describe --tags | cut -d"-" -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
