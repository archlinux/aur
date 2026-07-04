# Maintainer: Lyna Stral <testerthe60@gmail.com>

pkgname=run0-sudo-shim-git
pkgver=1.4.2.r0.g9fa985d
pkgrel=1
pkgdesc="An imitation of sudo, using run0 internally - WARNING: !!! THIS REPLACES SUDO !!!"
arch=('any')
url="https://github.com/LordGrimmauld/run0-sudo-shim"
license=('BSD-3-Clause')
depends=('systemd>=256.0')
makedepends=('git' 'rust')
provides=('sudo')
conflicts=('sudo')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/${pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir"/${pkgname}
	cargo build --release
}

package() {
	cd "$srcdir"/${pkgname}
	fd . "target"

	# completions
	install -Dm 0644 "target/tmp/run0-sudo-shim/completion/sudo.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/sudo.fish"
	install -Dm 0644 "target/tmp/run0-sudo-shim/completion/sudo.bash" "${pkgdir}usr/share/bash-completion/completions/sudo"

	# manpages
	install -Dm 0644 "target/tmp/run0-sudo-shim/manpage/sudo.8" "${pkgdir}/usr/share/man/man8/sudo.8"
	
	install -Dm 0755 "target/release/run0-sudo-shim" "${pkgdir}/usr/bin/sudo"
}
