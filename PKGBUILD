# Maintainer: jewelux <jewelux.aur@prejo.de>

_appname='firefox-syncstorage'
_srcname='syncstorage-rs'
pkgname="${_appname}"-git
pkgver=0.10.2.r51.gaa18c1a
pkgrel=1
pkgdesc='Sync storage with build-in token server for running a self-hosted firefox sync server.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mozilla-services/'"${_srcname}"
license=('MPL2')
depends=('openssl')
makedepends=('git' 'rust' 'cmake' 'go' 'pkgconf')
optdepends=('mysql: to use a local DB server')
provides=("${_appname}")
conflicts=("${_appname}")
install="${_appname}.install"
source=("git+https://github.com/mozilla-services/${_srcname}.git"
	"${_appname}.service")
sha256sums=('SKIP'
	'0fa4cd0a24fe49e1d2b3b16f1043277ec7901ae829e6252e1bfaf51e7c953155')
backup=("etc/${_appname}.toml")

pkgver() {
	cd "${_srcname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_srcname}"
	cargo build --release --features grpcio/openssl
}

package() {
	cd "${_srcname}"

	# Installing manually
	install -Dm 755 target/release/syncstorage "${pkgdir}"/usr/bin/"${_appname}"
	install -Dm 644 config/local.example.toml "${pkgdir}"/etc/"${_appname}".toml
	install -Dm 644 "${srcdir}/${_appname}".service "${pkgdir}"/usr/lib/systemd/system/"${_appname}".service
}