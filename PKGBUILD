# Maintainer: Ryno Kotze <lemon.xah@gmail.com>
_pkgname=slimevr-cli
pkgname=$_pkgname-git
pkgver=r9.a0454f9
pkgrel=1
pkgdesc="A SlimeVR command line interface to send commands to the slimevr server. Sending commands like Full-Reset and Yaw-Reset."
arch=('x86_64' 'i686')
url="https://github.com/lemonxah/slimevr-cli"
license=('mit' 'apache')
makedepends=('rust' 'cargo' 'cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/lemonxah/slimevr-cli.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$pkgname"
	env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
	cd "$pkgname"
	install -D -m 755 -t "${pkgdir}/usr/bin/" "target/release/$_pkgname"
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "LICENSE-MIT"
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "LICENSE-APACHE"

}
