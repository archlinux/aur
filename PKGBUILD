# Maintainer: Pedro Simões pedrofchsimoes@gmail.com
pkgname='rusty-monitor-git'
_pkgname='rusty-monitor'
pkgver=r24.b86860a
pkgrel=1
pkgdesc="This is a simple system monitor built with Rust and GTK4"
arch=('x86_64')
url="https://github.com/hubblexplorer/rusty-monitor"
license=('GPL3')
depends=('base' 'gtk4' 'glib2' 'pciutils')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/hubblexplorer/rusty-monitor.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
    cargo build --frozen --release
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm 755 "target/release/rusty-monitor" -t "$pkgdir/usr/bin/"
	install -Dm 655 "src/assets/icons/rusty-monitor.svg" -t "$pkgdir/usr/share/icons/"
	install -Dm 777 "rusty-monitor.desktop" -t "$pkgdir/usr/share/applications/"
}
