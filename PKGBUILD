# Maintainer: spyophobia <76800505+spyophobia@users.noreply.github.com>

pkgname=shadowsocks-rust-multiprofile-daemon-git
_pkgname=shadowsocks-rust-multiprofile-daemon
pkgver=r2.ec5efb7
pkgrel=2
pkgdesc='Systemd units that make it easy to work with multiple shadowsocks-rust profiles.'
arch=("any")
url="https://github.com/spyophobia/shadowsocks-rust-multiprofile-daemon"
license=("MIT")
depends=("shadowsocks-rust")
makedepends=("git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}.git")
sha512sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"

    # the units are installed with slightly different names to prevent conflict
    # therefore the doc comments in them need to be updated as well
    sed -i 's/shadowsocks-rust-local@/shadowsocks-rust-local-mp@/' shadowsocks-rust-local@.service.system shadowsocks-rust-local@.service.user
    sed -i 's/shadowsocks-rust-server@/shadowsocks-rust-server-mp@/' shadowsocks-rust-server@.service.system shadowsocks-rust-server@.service.user
}

package() {
	cd "$srcdir/${_pkgname}"

    install -Dm644 shadowsocks-rust-local@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-local-mp@.service"
    install -Dm644 shadowsocks-rust-server@.service.system "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server-mp@.service"
    install -Dm644 shadowsocks-rust-local@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-local-mp@.service"
    install -Dm644 shadowsocks-rust-server@.service.user "${pkgdir}/usr/lib/systemd/user/shadowsocks-rust-server-mp@.service"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
