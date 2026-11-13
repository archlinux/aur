# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

pkgname=listen-moe-desktop
pkgver=1.0.0
pkgrel=1
pkgdesc="Official LISTEN.moe Desktop Client"
arch=('x86_64')
url="https://github.com/LISTEN-moe/desktop-app"
makedepends=('git' 'cargo')
provides=(listen-moe)
source=("git+$url#tag=${pkgver}"
        "listen-moe.desktop")
sha256sums=('0fb108b1b6b3e20671422018e66b7bf5e22d597837737eda18db631d43a853f9'
            '67c99dff3d2b47ff508f11c7b9bae3c3b3bfc299887850f942e9328dbbc342e7')
options=(!lto)

prepare() {
	cd "${srcdir}/desktop-app"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/desktop-app"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
	cd "${srcdir}/desktop-app"

	install -Dm755 target/release/listen-moe "${pkgdir}/usr/bin/listen-moe"
  install -Dm755 "${srcdir}/listen-moe.desktop" "${pkgdir}/usr/share/applications/listen-moe.desktop"
  install -Dm644 "${srcdir}/desktop-app/assets/app-icon.png" "${pkgdir}/usr/share/pixmaps/listen-moe.png"
}
