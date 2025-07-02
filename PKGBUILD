# Maintainer: djugei <ddjugei@gmail.com>
pkgname=deltaclient-git
pkgver=r147.3b7885e
pkgrel=1
pkgdesc="Delta upgrades for archlinux"
arch=(x86_64)
url='https://github.com/djugei/arch-delta-upgrades'
license=('AGPL-3.0-or-later')
depends=('zstd')
makedepends=('git' 'cargo' 'jq')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('deltaclient::git+https://github.com/djugei/arch-delta-upgrades')
noextract=()
sha256sums=('SKIP')
# lto breaks the build, debug does not apply to rust
options=(!lto !debug)

#verify(){
#TODO: verify commits to be signed, and singed with the correct key
# }

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	cd client
	cargo fetch --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cd client
	cargo build --offline --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	local TARGET_DIR="$(cargo metadata --format-version 1 --no-deps --offline | jq -r '.target_directory')"
	install -D -m755 ${TARGET_DIR}/release/deltaclient ${pkgdir}/usr/bin/deltaclient
	cd client
	install -D -m644 deltaclient.service ${pkgdir}/usr/lib/systemd/system/deltaclient.service
	install -D -m644 deltaclient.timer ${pkgdir}/usr/lib/systemd/system/deltaclient.timer
}
