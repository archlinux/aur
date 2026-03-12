# Maintainer: jalovisko <https://github.com/jalovisko>
pkgname=presshold
pkgver=0.1.0
pkgrel=1
pkgdesc="macOS-style accent character selector for Linux"
arch=('x86_64')
url="https://github.com/jalovisko/presshold"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'libx11')
makedepends=('cargo' 'pkg-config')
optdepends=(
    'wtype: character injection on Wayland'
    'xdotool: character injection on X11'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f94d3edcfad8f23299420c459407df03cab6ef0c8d81b08fd347323e5d59e204')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Patch the service file to use the system binary path
    sed 's|%h/.local/bin/presshold|/usr/bin/presshold|' \
        "$pkgname.service" \
        | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/$pkgname.service"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
