# Maintainer: Nareg der Levonean <naregderlevonean@gmail.com>
pkgname=azbuka-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A versatile Russian Cyrillic transliteration tool (GTK4/Libadwaita)"
arch=('x86_64' 'aarch64')
url="https://github.com/naregderlevonean/azbuka"
license=('GPL3')
depends=('libadwaita' 'gtk4')
makedepends=('rust' 'cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export CARGO_HOME="$srcdir/cargo-home"
    cargo build --release
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    
    install -Dm644 "data/com.github.naregderlevonean.Azbuka.desktop" \
        "$pkgdir/usr/share/applications/com.github.naregderlevonean.Azbuka.desktop"
    
    install -Dm644 "data/icons/hicolor/scalable/apps/com.github.naregderlevonean.Azbuka.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.naregderlevonean.Azbuka.svg"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
