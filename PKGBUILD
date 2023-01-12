# Maintainer: jewelux <jewelux.aur@prejo.de>

_appname='firefox-syncstorage'
_srcname='syncstorage-rs'
pkgname="${_appname}"-git
pkgver=0.13.0.r10.gab5df9ba
pkgrel=1
pkgdesc='Sync storage with build-in token server for running a self-hosted firefox sync server.'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mozilla-services/'"${_srcname}"
license=('MPL2')
depends=('openssl' 'python-fxa' 'python-tokenlib')
makedepends=('git' 'rust' 'cmake' 'pkgconf' 'mariadb-libs')
optdepends=('mysql: to use a local DB server')
provides=("${_appname}")
conflicts=("${_appname}")
install="${_appname}.install"
source=("git+https://github.com/mozilla-services/${_srcname}.git"
	"${_appname}.service")
sha256sums=('SKIP'
	'609e057cd835ea54b06b32b98e210cd946255f652e7754c9160fd7c94379a83d')
backup=("etc/${_appname}.toml")

pkgver() {
	cd "${_srcname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_srcname}"
	cargo build --release
}

package() {
	cd "${_srcname}"

	# Installing manually
	install -Dm 755 target/release/syncserver "${pkgdir}"/usr/bin/"${_appname}"
	install -Dm 644 config/local.example.toml "${pkgdir}"/etc/"${_appname}".toml
	install -Dm 644 "${srcdir}/${_appname}".service "${pkgdir}"/usr/lib/systemd/system/"${_appname}".service
}
