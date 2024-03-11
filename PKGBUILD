# Maintainer: Robin Becker
# Contributor: mozzwald https://github.com/mozzwald/Fancy-Beeper-Daemon
# Contributor: 2004 Jason F. McBrayer

_pkgbase=alsabeep
pkgname=$_pkgbase-dkms
pkgver=0.0.4
pkgrel=1
pkgdesc="Another synthetic or enhanced PC Speaker beeper module and alsa daemon"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/$_pkgbase-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'glibc' 'alsa-lib' 'util-linux')
conflicts=("${_pkgbase}" "fancybeep-dkms")
install=install
backup=(
		"etc/${_pkgbase}-helper.conf"
		)
source=("${_pkgbase}.c"
		"blacklist.conf"
		"daemon.c"
		"helper.conf"
		"helper"
		'dkms.conf'
		'Makefile.dkms'
		)
sha256sums=('4b306516383b839bacd72740671e54bc6139a517a305332ec27f0c9b91663e8d'
            '7b2778b66b675f7c49a723844ce3d3b57561b1766ed507a112d7a827a718b11a'
            '05396e2a4206512dbdb18ee0eaeeb3611d7adbcc2e240a0d917d4bcdfa7e8f67'
            'a5b17454ff683ee842b288e9313cf780ec910783caf2264d931ffecd2309eaea'
            '154230cd593c91044e2270c179907653ca1eecd66be1ef25f819e0a397fdfceb'
            '2ea5660bb36d440627ae93ba9a704c37eb71b914d2906d127deec14afded43d7'
            '9b3e6ac669c1cf1b4314d3901bb6c36173eb3f2e7fafbd2d13e8daa4ee31a755')

_subst(){
	sed -e "s/@_PKGBASE@/${_pkgbase}/g" -e "s/@PKGVER@/${pkgver}/g" -i "${1}"
}

prepare() {
	local dst="${srcdir}/${_pkgbase}-${pkgver}"
	local dsrc="${srcdir}/dsrc"
	mkdir -p "${dst}" "${dsrc}"
	cp "${srcdir}/${_pkgbase}.c" "${dst}/${_pkgbase}.c"
	cp "${srcdir}/Makefile.dkms" "${dst}/Makefile"
	_subst "${dst}/Makefile"
	cp "${srcdir}/daemon.c" "${dsrc}/"
	_subst "${dsrc}/daemon.c"
}

_myinstall(){
	install "$1" "$2" "$3"
	_subst "$3"
}

package() {
	# Copy dkms.conf
	local dst="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	mkdir -p "${dst}" "${pkgdir}/usr/bin"

	# Copy sources (including Makefile)
	cp -r "${srcdir}/${_pkgbase}-${pkgver}"/* "${dst}/"
	_myinstall -Dm644 "${srcdir}/dkms.conf" "${dst}/dkms.conf"

	# Blacklists conflicting module(s)
	_myinstall -Dm644 "${srcdir}/blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/${_pkgbase}.conf"
	#_myinstall -Dm644 "${srcdir}/udev.rules" "${pkgdir}/etc/udev/rules.d/90-${_pkgbase}.rules"
	_myinstall -Dm644 "${srcdir}/helper.conf" "${pkgdir}/etc/${_pkgbase}-helper.conf"
	_myinstall -Dm744 "${srcdir}/helper" "${pkgdir}/usr/bin/${_pkgbase}-helper"
	gcc "${srcdir}/dsrc/daemon.c" -o "${pkgdir}/usr/bin/${_pkgbase}-daemon" -lm -lasound -Wl,-z,relro,-z,now,-z,shstk
	#rsync -a "$(basename "${url#https/}")/daemons/" "${shr}/daemons"
}
