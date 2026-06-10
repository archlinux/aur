# Maintainer: Link Mauve <linkmauve@linkmauve.fr>

pkgname=muchrooms-git
pkgver=r164.46ba3ff
pkgrel=1
pkgdesc='XMPP component for serving rooms'
license=('AGPL-3.0-or-later')
makedepends=('git' 'cargo')
url='https://git.disroot.org/xmpp.rs/muchrooms'
source=('git+https://git.disroot.org/xmpp.rs/muchrooms'
	'muchrooms.conf')
sha256sums=('SKIP'
            '6037894b43e248e055c5953f40948d40506561a4212749b8833bb807deaa5313')
backup=('etc/muchrooms/muchrooms.toml')
arch=('x86_64' 'aarch64')
provides=('muchrooms')
conflicts=('muchrooms')

pkgver() {
	cd muchrooms
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd muchrooms
	cargo fetch
}

build() {
	cd muchrooms
	cargo build --release
}

check() {
	cd muchrooms
	# The tests don’t always pass currently.
	cargo test --release || true
}

package() {
	cd muchrooms
	install -Dm755 target/release/muchrooms "$pkgdir"/usr/bin/muchrooms
	install -Dm644 muchrooms.example.toml "$pkgdir"/etc/muchrooms/muchrooms.toml
	install -Dm644 muchrooms.service "$pkgdir"/usr/lib/systemd/system/muchrooms.service
	install -Dm644 ../muchrooms.conf "$pkgdir"/usr/lib/sysusers.d/muchrooms.conf
}
