# Maintainer: Nareg der Levonean <naregderlevonean@gmail.com>
pkgname=hyprspin-git
_pkgname=hyprspin
pkgver=0
pkgrel=1
pkgdesc="A lightweight, automated screen rotation daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/naregderlevonean/hyprspin"
license=('GPL3')
depends=('gcc-libs' 'glibc' 'dbus' 'lua')
makedepends=('rust' 'cargo' 'git')
optdepends=('iio-sensor-proxy: required for accelerometer sensing')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git") 
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    cargo build --release --frozen
}

package() {
    cd "$_pkgname"
    
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
    
    if [ -f "hyprspin.lua" ]; then
        install -Dm644 "hyprspin.lua" "$pkgdir/usr/share/$_pkgname/hyprspin.lua.example"
    fi
}

