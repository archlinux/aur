#Maintainer: ParadoxSpiral <skullduggery@riseup.net>
pkgname=parabot-git
provides=(parabot)
pkgver=r71.0ef2c63
pkgrel=1
pkgdesc='Rust irc bot'
arch=(i686 x86_64)
url=https://github.com/ParadoxSpiral/parabot
license=(GPL3)
depends=(openssl sqlite)
makedepends=(cargo git)
source=(git+https://github.com/ParadoxSpiral/parabot
		parabot.service)
sha256sums=(SKIP
            14e5da0918ae963547578607bb30f3ef5047cc91da23b7cfaae06050434f2edf)

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
	install -Dm644 "$srcdir"/parabot.service "$pkgdir"/usr/lib/systemd/user/
	install -Dm644 example_conf.toml ~/.config/parabot/conf.toml
	install -Dm644 parabot_empty.db ~/.local/share/parabot/parabot.db
}
