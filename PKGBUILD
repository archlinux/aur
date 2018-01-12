#Maintainer: ParadoxSpiral <skullduggery@riseup.net>
pkgname=parabot-git
provides=(parabot)
pkgver=r70.d2b8d7ai
pkgrel=1
pkgdesc='Rust irc bot'
arch=(i686 x86_64)
url=https://github.com/ParadoxSpiral/parabot
license=(GPL3)
depends=(openssl sqlite)
makedepends=(cargo git)
source=(git+https://github.com/ParadoxSpiral/parabot
		parabot.service
		config.toml
		parabot.db)
sha256sums=(SKIP
            4ebb72cf950f8b67864bdf80bf911ca069fdc393f35dccb2ff7b9406a5934686
			c750a42610be544ac78ebd721c1d30a26e24823306b3800370be575ba58518a5
			c9d8c48d2ed33fd624498d7e8c002350ecc95a01a2d53c8fab8a62d40344033f)

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
	install -Dm644 "$srcdir"/config.toml ~/.config/parabot/
	install -Dm644 "$srcdir"/parabot.db ~/.local/share/parabot
}
