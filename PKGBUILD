# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: jewelux <jewelux.aur@prejo.de>

# Based off the firefox-syncstorage-git PKGBUILD from jewelux

pkgname=firefox-syncstorage
_pkgname=syncstorage-rs
pkgver=0.15.9
pkgrel=1
pkgdesc='Sync storage server with built-in token server for running a self-hosted firefox sync server'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mozilla-services/${_pkgname}"
license=('MPL2')
depends=('openssl' 'python-fxa' 'python-tokenlib')
makedepends=('rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: for use with a local database server')
options=('!lto')
install="${pkgname}.install"
source=("https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service")
sha512sums=('4fc085af4a8942cb3e07ccc23423c37d0b9a5e858e304b3e0cdfa415ea50a71e407486d510d30f1de6fec8dcd11a82460cc0a273daa1c80a87001dc1fbbe4d2f'
            '4c5fbb99160613ba3fb0fedce97f04f63b92699fe79c6edd899d4ec5f297c5a98c0c211df3eb9a6579c12c57f4c63513747ed8944a60fc76e32f1e0c0f5e3a95')
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
