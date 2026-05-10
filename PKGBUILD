# Maintainer: Klim Kostiuk <2601074@gmail.com>
pkgname=driftwm-git
_pkgname=driftwm
pkgver=0.5.0.r13.gbfb9a53
pkgrel=1
pkgdesc="Trackpad-first infinite canvas Wayland compositor (git)"
arch=('x86_64' 'aarch64')
url="https://github.com/malbiruk/driftwm"
license=('GPL-3.0-or-later')
depends=('libdisplay-info' 'libinput' 'seatd' 'mesa' 'libxkbcommon')
makedepends=('rust' 'cargo' 'pkg-config' 'git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.toml")
options=('!debug' '!lto' '!strip')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export CARGO_HOME="$srcdir/cargo-home"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    make install DESTDIR="$pkgdir" PREFIX=/usr
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
