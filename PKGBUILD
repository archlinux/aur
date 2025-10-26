# Maintainer: Manuel Hüsers <aur@huesers.de>
# Contributor: Matthieu Valleton <mvalleton@seos.fr>
# Contributor: jewelux <jewelux.aur@prejo.de>

# Based off the firefox-syncstorage-git PKGBUILD from jewelux

pkgname=firefox-syncstorage
_pkgname=syncstorage-rs
pkgver=0.21.1
pkgrel=1
pkgdesc='Sync storage server with built-in token server for running a self-hosted firefox sync server'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mozilla-services/${_pkgname}"
license=('MPL-2.0')
depends=('openssl')
makedepends=('rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: for use with a local database server')
options=('!lto')
install="${pkgname}.install"
source=("https://github.com/mozilla-services/${_pkgname}/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
	"${pkgname}.service"
    "mariadb-compat.patch")
sha512sums=('dcf10d5d6e286dea69faaabdf6ad2f60e7d4e0563ec30dc113318c809d4224e05289423ed688080c7d74d97e5236176047ec889f96829ceb8dfc4aa9991e2d7e'
            '4c5fbb99160613ba3fb0fedce97f04f63b92699fe79c6edd899d4ec5f297c5a98c0c211df3eb9a6579c12c57f4c63513747ed8944a60fc76e32f1e0c0f5e3a95'
            'fc24c504defb2961388833a5d6f96d883c533f58476de595f697ff5d42daabd21f8ce3c52e3f1897e089fcd8f2791d93ecc42eeee49f0100a17fd1689fa112c7')
backup=("etc/${pkgname}.toml")

# Patch for MariaDB compatibility, cf. https://github.com/mozilla-services/syncstorage-rs/issues/1753
prepare() {
	cd ${_pkgname}-${pkgver}
	patch -p1 -i "${srcdir}/mariadb-compat.patch"
}

build() {
	cd "${_pkgname}-${pkgver}"
	cargo build --release --no-default-features --features=syncstorage-db/mysql
}

package() {
	cd "${_pkgname}-${pkgver}"

	# Installing manually
	install -Dm 755 target/release/syncserver "${pkgdir}"/usr/bin/"${pkgname}"
	install -Dm 644 config/local.example.toml "${pkgdir}"/etc/"${pkgname}".toml
	install -Dm 644 "${srcdir}/${pkgname}".service "${pkgdir}"/usr/lib/systemd/system/"${pkgname}".service
}
