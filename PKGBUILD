# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: jewelux <jewelux.aur@prejo.de>

# Based off the firefox-syncstorage-git PKGBUILD from jewelux

pkgname=firefox-syncstorage
_pkgname=syncstorage-rs
pkgver=0.18.2
pkgrel=1
pkgdesc='Sync storage server with built-in token server for running a self-hosted firefox sync server'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mozilla-services/${_pkgname}"
license=('MPL-2.0')
depends=('openssl' 'python-fxa' 'python-tokenlib')
makedepends=('rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: for use with a local database server')
options=('!lto')
install="${pkgname}.install"
source=("https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service")
sha512sums=('4689b5eca15a983f020dad13c8290f1eb3d62ea8dc52aa3c5c289e256911090d90255b0f9adf88bf9c3bfaec4f11790ecdb18ba94c67aedcdb9ff1fd85fea480'
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
