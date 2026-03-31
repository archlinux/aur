# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: tam1m <tbacc plus aur at pm dot me>
pkgname=sonusmix
pkgver=0.1.1
pkgrel=3
pkgdesc="Next-gen Pipewire audio routing tool"
arch=('x86_64')
url="https://codeberg.org/sonusmix/sonusmix"
license=('MPL-2.0')
depends=('pipewire' 'gtk4')
makedepends=('clang' 'cargo' 'git')
source=("https://codeberg.org/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        "update-pipewire-rs-version.patch")
sha256sums=('363e5780924ac28041bd8596e9d570ac3e6491a2324680dd00a6469f05e65581'
            'c496bf9ed2881da798768f6818f556821deb1e71acf8199fb80582361d4e2501')

prepare() {
    cd "$srcdir/$pkgname"
    patch -Np1 -i ../update-pipewire-rs-version.patch
}

build() {
    cd "$srcdir/$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/licenses/${pkgname}"

    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$pkgname/assets/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.$pkgname.${pkgname^}.svg"
    install -Dm644 "$pkgname/assets/org.$pkgname.${pkgname^}.desktop" "$pkgdir/usr/share/applications/"
    install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/"
}
