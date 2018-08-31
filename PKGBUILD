#Maintainer: ParadoxSpiral <skullduggery@riseup.net>
pkgname=parabot-git
provides=(parabot)
pkgver=r71.0ef2c63
pkgrel=3
pkgdesc='Rust irc bot'
arch=(i686 x86_64)
url=https://github.com/ParadoxSpiral/parabot
license=(GPL3)
depends=(openssl sqlite)
makedepends=(cargo git)
source=(git+https://github.com/ParadoxSpiral/parabot
		parabot.service)
sha256sums=(SKIP
            f8554245a545f2db13beb1d3ee7b194834779324a8a8c49d8bc7b7025aeb262e)

pkgver() {
	cd parabot
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd parabot
	cargo build --release
}

package() {
	cd parabot
	mkdir -p "$pkgdir"/usr/lib/systemd/user/ "$pkgdir"/usr/bin ~/.config/parabot/ ~/.local/share/parabot/
	install -Dm755 target/release/parabot "$pkgdir"/usr/bin
	cp -n "$srcdir"/parabot.service "$pkgdir"/usr/lib/systemd/user/
	cp -n example_conf.toml ~/.config/parabot/conf.toml
	cp -n parabot_empty.db ~/.local/share/parabot/parabot.db
}
