# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname='hyprwall'
pkgver=0.1.5
pkgrel=1
pkgdesc='GUI for setting wallpapers on Wayland (multiple backends). Written in blazingly fast Rust!'
arch=('x86_64')
url="https://github.com/nnyyxxxx/$pkgname"
license=('GPL-2.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nnyyxxxx/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da6ceb8b0d43807edeaada26c2c74daf6cb3654f2641714860397721906e7e72')
makedepends=('rustup' 'pango')
depends=('glibc' 'gcc-libs' 'gtk4')
optdepends=('hyprpaper' 'swaybg' 'swww' 'wallutils' 'feh')
install="$pkgname.install"

prepare() {
    local oldinstall=$(cat "$startdir/$install")

    echo -n "optdepends=(" > "$startdir/$install"
    for dep in "${optdepends[@]}"; do
        echo -n "'$dep' " >> "$startdir/$install"
    done

    echo -e ")\n$oldinstall" >> "$startdir/$install"

    cd "$pkgname-$pkgver"
    echo "Version=$pkgver" >> "$pkgname.desktop"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 "man/$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
    install -Dm644 "$pkgname.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
