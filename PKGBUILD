# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: jewelux <jewelux.aur@prejo.de>

# Based off the firefox-syncstorage-git PKGBUILD from jewelux

pkgname=firefox-syncstorage
_pkgname=syncstorage-rs
pkgver=0.12.3
pkgrel=1
pkgdesc='Sync storage server with built-in token server for running a self-hosted firefox sync server'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mozilla-services/${_pkgname}"
license=('MPL2')
depends=('openssl' 'python-fxa' 'python-tokenlib')
makedepends=('rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: for use with a local database server')
install="${pkgname}.install"
source=("https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}.tar.gz"
	"${pkgname}.service")
sha256sums=('aa69a5d1419e13ba7fe5f9841010ac4799bd431c2fa2c2327471360a2c6912b4'
	'609e057cd835ea54b06b32b98e210cd946255f652e7754c9160fd7c94379a83d')
backup=("etc/${pkgname}.toml")

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --release --features grpcio/openssl
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Installing manually
	install -Dm 755 target/release/syncstorage "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm 644 config/local.example.toml "${pkgdir}"/etc/"${pkgname}".toml
	install -Dm 644 "${srcdir}/${pkgname}".service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
}
