pkgname=synapse-shell
pkgver=1.0.7
pkgrel=1
pkgdesc="A custom status bar indicator in GTK4 written in Rust"
arch=('x86_64')
url="https://gitlab.com/Maskrpone/synapse-gtk4"
license=('MIT')
depends=('gtk4' 'cairo' 'gtk4-layer-shell')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/Maskrpone/synapse-gtk4/-/archive/v$pkgver/synapse-gtk4-v$pkgver.tar.gz")
sha256sums=('8ca5f8088c890697f9b92f5dbd18eeb106b452274f8a1b4b3c8d964540ef8052')
_reponame="synapse-gtk4"
_binname="synapse_shell"

prepare() {
    cd "$_reponame-v$pkgver"
    # Fetches dependencies before the build phase to allow building offline later
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_reponame-v$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$_reponame-v$pkgver"
    install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/synapse"
		install -Dm644 "style/synapse.css" "$pkgdir/usr/share/synapse/synapse.css"
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
