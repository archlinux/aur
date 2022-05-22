# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Álvaro <internetexplorer404xd@gmail.com>
pkgname=conbatt-rs-git
pkgver=0.1.0.r0.g79ebba8
pkgrel=1
epoch=
pkgdesc="Displays controller battery as notifications"
arch=(x86_64 i686)
url="https://github.com/albarozzz/conbatt-rs"
license=('MIT')
groups=()
depends=()
makedepends=(git rust cargo)
checkdepends=()
optdepends=()
provides=(conbatt-rs-git)
conflicts=(conbatt-rs-git)
replaces=()
backup=("${HOME:1}/.config/conbatt-rs/controller.png" "etc/systemd/user/conbatt.service")
options=()
install=
changelog=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release
}

package() {
	export XDG_RUNTIME_DIR=/run/user/$(id -ru)	
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/etc/systemd/user/"
	mkdir -p "${pkgdir}${HOME}/.config/conbatt-rs/"

	install -Dm0755 -t "${pkgdir}/usr/bin/" "${srcdir}/${pkgname}/target/release/conbatt-rs"
	cp "${srcdir}/${pkgname}/conbatt.service" "${pkgdir}/etc/systemd/user/"

	systemctl enable --user conbatt.service
	systemctl start --user conbatt.service

	cp "${srcdir}/${pkgname}/controller.png" "${pkgdir}${HOME}/.config/conbatt-rs/"
}
