# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: jewelux <jewelux.aur@prejo.de>

# Based off the firefox-syncstorage-git PKGBUILD from jewelux

pkgname=firefox-syncstorage
_pkgname=syncstorage-rs
pkgver=0.13.6
pkgrel=1
pkgdesc='Sync storage server with built-in token server for running a self-hosted firefox sync server'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mozilla-services/${_pkgname}"
license=('MPL2')
depends=('openssl' 'python-fxa' 'python-tokenlib')
makedepends=('rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: for use with a local database server')
install="${pkgname}.install"
source=("https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service")
sha256sums=('ddf8169a0a9bd06db10bf032a2b9af7ea4e5816251e82d9e7627f87eba1f27bd'
            '609e057cd835ea54b06b32b98e210cd946255f652e7754c9160fd7c94379a83d')
backup=("etc/${pkgname}.toml")

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --release
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Installing manually
	install -Dm 755 target/release/syncserver "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm 644 config/local.example.toml "${pkgdir}"/etc/"${pkgname}".toml
	install -Dm 644 "${srcdir}/${pkgname}".service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
}
