# Maintainer: Gijs Burghoorn <me@gburghoorn.com>
pkgname=lemurs-git
_pkgname=lemurs
pkgver=0.3.1.r0.gc64f69c
pkgrel=1
pkgdesc="TUI Display/Login Manager"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/coastalwhite/lemurs"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'grep')
depends=('pam' 'systemd')
optdepends=('xorg-xauth')
conflicts=()
backup=('etc/lemurs/config.toml')
source=('git+https://github.com/coastalwhite/lemurs.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

	# Ensure there is a stable version of rust installed
	rustup toolchain list | grep 'stable' > /dev/null
	if [ $? -ne 0 ]; then
		rustup toolchain install stable
	fi

	cargo +stable build --release --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 target/release/lemurs "${pkgdir}/usr/bin/lemurs"

	install -D -m644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/MIT"
	install -D -m644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/APACHE"

	install -D -m644 extra/config.toml "${pkgdir}/etc/lemurs/config.toml"
	install -D -m755 extra/xsetup.sh "${pkgdir}/etc/lemurs/xsetup.sh"

	install -D -m644 extra/lemurs.pam "${pkgdir}/etc/pam.d/lemurs"
	install -D -m644 extra/lemurs.service "${pkgdir}/usr/lib/systemd/system/lemurs.service"
}
