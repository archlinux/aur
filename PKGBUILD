# Maintainer: Tony, btw <tony@tonybtw.com>
pkgname='oxwm-git'
_pkgname='oxwm'
pkgver=0.8.0.262.g1f89cc1
pkgrel=1
arch=('x86_64')
url="https://github.com/tonybanters/oxwm"
pkgdesc="X11 Window Manager Inspired by DWM, but with better sane defaults."
license=('GPL-3.0-or-later')
options=('!lto')
depends=('libx11' 'libxft' 'libxcb' 'fontconfig' 'freetype2' 'libxrender' 'lua')
makedepends=('cargo' 'git')
provides=('oxwm')
conflicts=('oxwm')
source=("$_pkgname::git+https://github.com/tonybanters/oxwm.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_pkgname
    unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
    cargo build --release --locked
}

check() {
    echo true
}

package() {
    cd $_pkgname
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 resources/oxwm.desktop "$pkgdir/usr/share/xsessions/oxwm.desktop"
    install -Dm644 resources/oxwm.1 "$pkgdir/usr/share/man/man1/oxwm.1"
    install -Dm644 templates/oxwm.lua "$pkgdir/usr/share/oxwm/oxwm.lua"
}
