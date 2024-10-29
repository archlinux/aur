# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=signal-cli-bin
_pkgname=signal-cli
provides=('signal-cli')
conflicts=('signal-cli')
pkgver=0.13.9
pkgrel=1
pkgdesc="Signal-cli is unofficial cmd, JSON-RPC and dbus interface for the Signal messenger"
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
depends=(
  'asciidoc'
  'java-commons-logging'
  'java-runtime-headless>=21'
  'libsignal-client'
  'sh'
)
source=("https://github.com/AsamK/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-native.tar.gz")
sha512sums=('dda4662fbfe67206fbe0a37b28b1630c7e1afd902524943c0dcda788299a81d79e562cc75423b8c07293bb118a463bc7681ddad713c1aa2a2512a8b32eb27677'
            'SKIP'
            'c43efac7933fad452ce1987c2de866527ada7cc9e9a31bbd68223caec39263f2da32d04593cce441dd11b300ea37ad3382cd5980b44ef858dd652fe43982e67c')
validpgpkeys=('FA10826A74907F9EC6BBB7FC2BA2CD21B5B09570')

package() {
	install -m755 -d "${pkgdir}/usr/share/java/${_pkgname}" \
	                 "${pkgdir}/usr/bin" \
	                 "${pkgdir}/usr/lib/systemd/system/" \
	                 "${pkgdir}/usr/lib/sysusers.d/" \
	                 "${pkgdir}/usr/lib/tmpfiles.d/" \
	                 "${pkgdir}/usr/share/man/man1/" \
	                 "${pkgdir}/usr/share/man/man5/" \
	                 "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"

	install -m755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	#install -m755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

	cd "${_pkgname}-${pkgver}"

	install -m644 "data/${_pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
	install -m644 "data/${_pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
	install -m644 "data/org.asamk.Signal.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}-socket.service" "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "data/${_pkgname}-socket.socket" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}-socket.service"

	cd "man"
  make

	install -m644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/"
	install -m644 "${_pkgname}-dbus.5" "${pkgdir}/usr/share/man/man5/"
	install -m644 "${_pkgname}-jsonrpc.5" "${pkgdir}/usr/share/man/man5/"

	#cd "build/install/${_pkgname}"

	#rm -f lib/commons-logging-*.jar
	#rm -f lib/libsignal-client*.jar
	#install -m644 lib/*.jar "${pkgdir}/usr/share/java/${_pkgname}/"
}
