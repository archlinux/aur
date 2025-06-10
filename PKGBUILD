# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Metadata partially based on sherlock-launcher-bin
_pkgname="sherlock-launcher"
pkgbase="${_pkgname}-git" 
pkgname="${_pkgname}-git" 
pkgver=0.1.13.r3.gd861ea9
pkgrel=1
pkgdesc="Application launcher for Wayland."
arch=('x86_64')
url="https://github.com/skxxtz/sherlock"
license=('custom:CC-BY-NC-4.0')
depends=('gtk4' 'gtk4-layer-shell' 'dbus' 'openssl' 'sqlite')
makedepends=('cargo' 'rust')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname" "${_pkgname}-bin")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    if [[ "$pkgbase" == "sherlock-launcher-git" ]]; then
        cd "$srcdir/$_pkgname"
        git clean -fdx
        git reset --hard HEAD
    	export RUSTUP_TOOLCHAIN=stable
    	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    fi
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" target/release/sherlock
    install -Dm644 -t "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE" LICENSE
}

