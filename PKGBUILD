# Maintainer: Sebastian Kootz - skxxtz@gmail.com

pkgbase='sherlock-launcher'
pkgname=('sherlock-launcher-git'
         'sherlock-launcher-bin')
pkgver=0.1.1
pkgrel=1
pkgdesc="Application launcher for Wayland."
arch=('x86_64')
url="https://github.com/skxxtz/sherlock"
license=('custom:CC-BY-NC-4.0')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('cargo' 'rust')

# Define sources and checksums for both bin and git versions
source=()
if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
    source+=("git+https://github.com/skxxtz/sherlock.git")
elif [[ "$pkgname" == "sherlock-launcher-bin" ]]; then
    source+=("https://github.com/skxxtz/sherlock/releases/download/v${pkgver}/sherlock-v${pkgver}-bin-linux-x86_64.tar.gz")
fi
sha256sums=('SKIP') 

# Build function for Git version
build() {
    if [[ "$pkgname" == "sherlock-launcher-git" ]]; then
        cd "$srcdir/sherlock"
        cargo build --release
    fi
}

package_sherlock-launcher-git() {
        conflicts=("sherlock-launcher-bin")
        cd "$srcdir"
        install -Dm755 "$srcdir/sherlock/target/release/sherlock" "$pkgdir/usr/bin/sherlock"
        install -Dm644 "$srcdir/sherlock/LICENSE" "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE"
}

package_sherlock-launcher-bin() {
        conflicts=("sherlock-launcher-git")
        cd "$srcdir"
        tar -xzf "$srcdir/sherlock-v${pkgver}-linux-x86_64.tar.gz" -C "$pkgdir"

        install -Dm644 "$pkgdir/LICENSE" "$pkgdir/usr/share/licenses/sherlock-launcher/LICENSE"
        install -Dm755 "$pkgdir/sherlock" "$pkgdir/usr/bin/sherlock"
}

