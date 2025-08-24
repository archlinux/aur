pkgname=pipelam
pkgver=0.1.13
pkgrel=1
pkgdesc="A lightweight GTK4-based notification system for displaying text, images, and progress bars"
arch=('x86_64' 'aarch64')
url="https://github.com/thomascrha/pipelam"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('clang' 'make' 'scdoc')
optdepends=('systemd: for systemd socket activation')
# used for local testing
# source=($pkgname-$pkgver::git+file://$(dirname $PWD))
# sha256sums=('SKIP')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thomascrha/pipelam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46e16dab6e79a369fd3f80729a428b99aa6d7eb29615a578355f4931aa439d06')

build() {
    cd "$pkgname-$pkgver"
    make build
    make docs
}

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="$pkgdir" install

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    make PREFIX="$pkgdir" install-systemd

    # # Install config file
    install -d "$pkgdir/etc/$pkgname"
    install -Dm644 config/pipelam.toml "$pkgdir/etc/$pkgname/pipelam.toml"
}

