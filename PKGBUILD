# Maintainer: Thomas Lindae <thomas.lindae@in.tum.de>
# Contributor: teraflops <cprieto.ortiz@gmail.com>

pkgname=chameleos-git
pkgver=0.2.0.r0.ge3759f9
pkgrel=1
pkgdesc='Screen annotation tool for niri and Hyprland'
arch=('x86_64' 'aarch64')
url='https://github.com/Treeniks/chameleos'
license=('GPL-3.0-or-later')
depends=('wayland')
makedepends=('cargo' 'rust' 'git')
provides=('chameleos' 'chamel')
conflicts=('chameleos' 'chameleos-bin')
source=("$pkgname::git+$url")
options=(!debug)
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "target/release/chameleos" "$pkgdir/usr/bin/chameleos"
    install -Dm755 "target/release/chamel" "$pkgdir/usr/bin/chamel"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
