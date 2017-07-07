# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

_ghname='EternalTCP'
_tarname='et'
pkgbase='eternalterminal'
pkgname=('eternalterminal-client' 'eternalterminal-server' 'eternalterminal')
pkgver='3.1.1'
pkgrel=1
arch=('x86_64')
depends=(
	'boost-libs' 'libsodium' 'gflags' 'google-glog' 'ncurses' 'protobuf'
)
makedepends=(
	'boost' 'libsodium' 'gflags' 'google-glog' 'ncurses' 'protobuf' 'cmake'
	'unzip' 'wget'
)
url='https://mistertea.github.io/EternalTCP/'
license=('Apache')

source=(
		"https://github.com/MisterTea/${_ghname}/archive/${_tarname}-v${pkgver}.tar.gz"
		'et.patch'
)
sha256sums=(
		'04c131b095d149b6dfc364b8f6984a8f68dab6eea5668392fc668ff147787615'
		'35961939cf852c327913e9fea698168966c7b492cb6f19e19321d9f9fa4fb292'
)

prepare() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}"

	msg2 'Preparing directories'
	mkdir -p build

	msg2 'Applying patches'
	patch -p1 <"${srcdir}/et.patch"
}

build() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 'Running cmake'
	cmake ../

	msg2 "Building ${_ghname}"
	make
}

package_eternalterminal-client() {
	pkgdesc='Re-Connectable TCP connection. Includes only the client.'
	conflicts=('eternalterminal' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} client to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etclient" "${pkgdir}/usr/bin/etclient"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/launcher/et" "${pkgdir}/usr/bin/et"
}

package_eternalterminal-server() {
	pkgdesc='Re-Connectable TCP connection. Includes only the server.'
	conflicts=('eternalterminal' 'eternalterminal-client')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} server to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/debian/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}

package_eternalterminal() {
	pkgdesc='Re-Connectable TCP connection. Includes both client and server.'
	conflicts=('eternalterminal-client' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etclient" "${pkgdir}/usr/bin/etclient"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/launcher/et" "${pkgdir}/usr/bin/et"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/debian/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}
