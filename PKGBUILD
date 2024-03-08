# Maintainer: Robin Becker
# Contributor: mozzwald https://github.com/mozzwald/Fancy-Beeper-Daemon
# Contributor: 2004 Jason F. McBrayer

_pkgbase=alsabeep
pkgname=$_pkgbase-dkms
pkgver=0.0.2
pkgrel=1
pkgdesc="Another synthetic or enhanced PC Speaker beeper module and alsa daemon"
arch=('x86_64' 'aarch64')
url="https://aur.archlinux.org/packages/$_pkgbase-dkms"
license=('GPL-2.0-only')
depends=('dkms' 'glibc' 'alsa-lib')
conflicts=("${_pkgbase}" "fancybeep-dkms")
install=install
backup=(
		"etc/${_pkgbase}-helper.conf"
		)
source=("${_pkgbase}.c"
		"blacklist.conf"
		"udev.rules"
		"daemon.c"
		"helper.conf"
		"helper"
		'dkms.conf'
		'Makefile.dkms'
		)
sha256sums=('19eaab6e9e823c919ce2087fdab7eb4220632a770da16ee6736a1d6e1ae96f18'
            '7b2778b66b675f7c49a723844ce3d3b57561b1766ed507a112d7a827a718b11a'
            '4bf5827690a8ec010a59e4fc11897fe0aa2d6d7159388fbab39daa9d4d6b977e'
            '920659d7d33482ca7b6665f53d0c91b536adad9a2d050ce93d25cb384784a79b'
            '426711741d492fd1dbe06c8bd170accd58ab930121ec028a39277563d660aa05'
            'e9f9c10b793b704f5c480ac4f5d5c7dc15b0cc22c8bd397882ab0a1bbc4e51a7'
            '2ea5660bb36d440627ae93ba9a704c37eb71b914d2906d127deec14afded43d7'
            '9b3e6ac669c1cf1b4314d3901bb6c36173eb3f2e7fafbd2d13e8daa4ee31a755')

_subst(){
	sed -e "s/@_PKGBASE@/${_pkgbase}/" -e "s/@PKGVER@/${pkgver}/" -i "${1}"
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
	_myinstall -Dm644 "${srcdir}/udev.rules" "${pkgdir}/etc/udev/rules.d/90-${_pkgbase}.rules"
	_myinstall -Dm644 "${srcdir}/helper.conf" "${pkgdir}/etc/${_pkgbase}-helper.conf"
	_myinstall -Dm744 "${srcdir}/helper" "${pkgdir}/usr/bin/${_pkgbase}-helper"
	gcc "${srcdir}/dsrc/daemon.c" -o "${pkgdir}/usr/bin/${_pkgbase}-daemon" -lm -lasound -Wl,-z,relro,-z,now,-z,shstk
	#rsync -a "$(basename "${url#https/}")/daemons/" "${shr}/daemons"
}
