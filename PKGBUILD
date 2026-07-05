# Maintainer: Jonathan Colon <rebelinux@gmail.com>
pkgname=cosmic-ext-flux
pkgver=3.1.1
pkgrel=1
epoch=
pkgdesc="Animated desktop wallpapers for COSMIC — play any video or GIF as your background."
arch=(x86_64)
url="https://github.com/franz-net/cosmic-ext-flux"
license=('GPL')
depends=('gstreamer' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugin-va')
makedepends=('rust' 'just')
source=("${pkgname}-${pkgver}.zip::https://github.com/franz-net/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c765ebe514da28b9d8a84c90afa59e8654657dda601e0165ee98fcee1b2e76a')
install="cosmic-ext-flux.install"

prepare() {
  cd "$pkgname-$pkgver"

  cargo fetch --locked
  sed 's/lto = "fat"/lto = "thin"/' -i Cargo.toml
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/cosmic-ext-flux-daemon \
        ~/.local/bin/cosmic-ext-flux-daemon
    install -Dm755 target/release/cosmic-ext-applet-flux \
        ~/.local/bin/cosmic-ext-applet-flux
    install -Dm644 applet/resources/app.desktop \
        ~/.local/share/applications/io.github.franz_net.CosmicExtAppletFlux.desktop
    sed -i "s|^Exec=cosmic-ext-applet-flux|Exec=$HOME/.local/bin/cosmic-ext-applet-flux|" \
        ~/.local/share/applications/io.github.franz_net.CosmicExtAppletFlux.desktop
    install -Dm644 applet/resources/icon.svg \
        ~/.local/share/icons/hicolor/scalable/apps/io.github.franz_net.CosmicExtAppletFlux.svg
    install -Dm644 applet/resources/icon-stopped.svg \
        ~/.local/share/icons/hicolor/scalable/apps/io.github.franz_net.CosmicExtAppletFlux-stopped.svg
    install -Dm644 data/cosmic-ext-flux-daemon.service \
        ~/.config/systemd/user/cosmic-ext-flux-daemon.service
    sed -i "s|^ExecStart=/usr/bin/cosmic-ext-flux-daemon|ExecStart=$HOME/.local/bin/cosmic-ext-flux-daemon|" \
        ~/.config/systemd/user/cosmic-ext-flux-daemon.service
}
