# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=signal-cli-bin
_pkgname=signal-cli
pkgver=0.13.5
pkgrel=1
pkgdesc="Signal-cli is unofficial cmd, JSON-RPC and dbus interface for the Signal messenger"
arch=('any')
url="https://github.com/AsamK/signal-cli"
license=('GPL-3.0-only')
depends=('java-runtime-headless>=21' 'java-commons-logging' 'sh' 'libsignal-client')
source=("https://github.com/AsamK/${_pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz.asc"
        "https://github.com/AsamK/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux-native.tar.gz")
sha512sums=('a5529f91196b6656d5eee45d52169d6bbd45c6cacc842bd74b62875a7f83bb772bdc08a4aa446569aea7420be8fb0c835aa470a88313e38eefd2976d0e4efcb8'
            'SKIP'
            '49b59a81e09fe7f7602e863be7111814445387a0da035f3921c6cd9196489dec8cb5de4f3eb1cbd76f5f5c48db752717b1dfc3cf2e85f3ff44d730693f5675b4')
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
