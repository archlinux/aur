# Maintainer: Robin Becker
# Contributor: mozzwald https://github.com/mozzwald/Fancy-Beeper-Daemon
# Contributor: 2004 Jason F. McBrayer

_pkgbase=alsabeep
pkgname=$_pkgbase-dkms
pkgver=0.0.5
pkgrel=1
pkgdesc="Another synthetic or enhanced PC Speaker beeper module and alsa daemon"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/$_pkgbase-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'glibc' 'alsa-lib' 'util-linux')
conflicts=("${_pkgbase}" "fancybeep-dkms")
install=install
backup=(
		"etc/${_pkgbase}.conf"
		)
source=("${_pkgbase}.c"
		"blacklist.conf"
		"daemon.c"
		"config"
		"helper"
		'dkms.conf'
		'Makefile.dkms'
		)
sha256sums=('4b306516383b839bacd72740671e54bc6139a517a305332ec27f0c9b91663e8d'
            '7b2778b66b675f7c49a723844ce3d3b57561b1766ed507a112d7a827a718b11a'
            'ab7c72277ba7016309452055b006a60f395443a37dc2028e69dd0d1a71a8f1bf'
            'e9b36c683af0535ca14869f149764345c5949f163847bffe8103462e66310e58'
            '48d2f21eaddcd3f1012c5f871e3052090d579771992d5b1ebcbb27cc8a98a0bd'
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
	install -Dm644 "${srcdir}/blacklist.conf" "${pkgdir}/usr/lib/modprobe.d/${_pkgbase}.conf"
	install -Dm644 "${srcdir}/config" "${pkgdir}/etc/${_pkgbase}.conf"
	install -Dm755 "${srcdir}/helper" "${pkgdir}/usr/bin/${_pkgbase}-helper"
	gcc "${srcdir}/dsrc/daemon.c" -o "${pkgdir}/usr/bin/${_pkgbase}-daemon" -lm -lasound -Wl,-z,relro,-z,now,-z,shstk
}
