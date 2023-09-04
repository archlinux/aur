# Maintainer: Jason Gauci <contact+jgmath2000@gmail.com>
# Contributor: Joel Goguen <contact+aur@jgoguen.ca>

_ghname='EternalTerminal'
_tarname='et'
pkgbase='eternalterminal'
pkgname=('eternalterminal-client' 'eternalterminal-server' 'eternalterminal')
pkgver='6.2.8'
pkgrel=1
arch=('x86_64')
depends=(
	'libutempter' 'libunwind' 'openssl' 'libsodium' 'protobuf' 'curl'
)
makedepends=(
	'cmake'
)
url='https://mistertea.github.io/EternalTerminal/'
license=('Apache')

source=(
		"https://github.com/MisterTea/${_ghname}/archive/${_tarname}-v${pkgver}.tar.gz"
)
sha256sums=('6c1a23a2fe9229a882622378126d4482ae67328a5ca8ef660f14034401711764')
pkgdesc='Remote terminal for the busy and impatient'

prepare() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}"

	msg2 'Preparing directories'
	mkdir -p build
}

build() {
	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 'Running cmake'
	cmake ../ -DDISABLE_VCPKG=ON -DCMAKE_EXE_LINKER_FLAGS="-Wl,--copy-dt-needed-entries" -DCMAKE_SHARED_LINKER_FLAGS="-Wl,--copy-dt-needed-entries"

	msg2 "Building ${_ghname}"
	make -j$(( ($(nproc)+1) / 2))
}

package_eternalterminal-client() {
	pkgdesc='Re-Connectable Terminal connection. Includes only the client.'
	conflicts=('eternalterminal' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} client to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/et"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htm"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htmd"
}

package_eternalterminal-server() {
	pkgdesc='Re-Connectable Terminal connection. Includes only the server.'
	conflicts=('eternalterminal' 'eternalterminal-client')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} server to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etterminal" "${pkgdir}/usr/bin/etterminal"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/systemctl/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}

package_eternalterminal() {
	pkgdesc='Re-Connectable Terminal connection. Includes both client and server.'
	conflicts=('eternalterminal-client' 'eternalterminal-server')

	cd "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build"

	msg2 "Installing ${_ghname} to package root"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/et"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htm"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/et" "${pkgdir}/usr/bin/htmd"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etserver" "${pkgdir}/usr/bin/etserver"
	install -D -m 0755 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/build/etterminal" "${pkgdir}/usr/bin/etterminal"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/systemctl/et.service" "${pkgdir}/usr/lib/systemd/system/et.service"
	install -D -m 0644 "${srcdir}/${_ghname}-${_tarname}-v${pkgver}/etc/et.cfg" "${pkgdir}/etc/et.cfg"
}
