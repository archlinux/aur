# Author: 2004 Jason F. McBrayer
# Maintainer: mozzwald
# Contributor: Robin Becker

_pkgbase=fancybeep
pkgname=$_pkgbase-dkms
pkgver=2.6.24.1
pkgrel=1
vcsrev=97f5bb22a9e748a38c0292a061245511d2ca9969
pkgdesc="Synthetic or enhanced PC Speaker beeper kernel module and alsa daemon"
arch=('x86_64' 'aarch64')
#url="https://web.archive.org/web/20170110173723/http://www.carcosa.net/jason/software/beep/"
url="https://github.com/mozzwald/Fancy-Beeper-Daemon"
license=('GPL-2.0-only')
depends=('dkms' 'glibc' 'alsa-lib')
conflicts=("${_pkgbase}")
install=${_pkgbase}.install
source=("${url}/archive/${vcsrev}.tar.gz"
				'dkms.conf'
				'Makefile.dkms'
				"$_pkgbase".conf
				"fancybeep.rules"
				"fbdaemon.c"
				"001.patch"
				)
sha256sums=(
		'4b546d91e9c6473ee85f36aa2a638d85d35ce8421318ffdf5c9e24c69ccf6f16'
		'4fcdf5ab7fb0f4110649f807567c15dd73026b84fdaa33efc524724d0d4f7f58'
		'9b3e6ac669c1cf1b4314d3901bb6c36173eb3f2e7fafbd2d13e8daa4ee31a755'
		'7b2778b66b675f7c49a723844ce3d3b57561b1766ed507a112d7a827a718b11a'
		'd50830d9f323c15a96a2e47cfd39750ce7b6f7a0f9105c6b9505d67b08db04a0'
		'be7cd70c83036f97231baa635655b34dbbfaa3d9234b53d2aaad979920910f85'
		'8f5676e25afe1fa3287362b43c5cb45569dbb8680d4c25a73624a79599642739'
		)

prepare() {
	local src="${srcdir}/$(basename "${url#https/}")-${vcsrev}"
	local dst="${srcdir}/${_pkgbase}-${pkgver}"
	mkdir -p "${dst}"
	cp "${src}/beep.c" "${dst}/${_pkgbase}.c"
	# Set name
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
					"Makefile.dkms" > "${dst}/Makefile"
	cd "${dst}"
	patch -Np0 -i ../001.patch
}

package() {
	# Copy dkms.conf
	local dst="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
	mkdir -p "${dst}" "${pkgdir}/usr/bin"

	# Copy sources (including Makefile)
	cp -r "${_pkgbase}-${pkgver}"/* "${dst}/"

	install -Dm644 dkms.conf "${dst}/dkms.conf"
	# Set name and version
	sed -e "s/@_PKGBASE@/${_pkgbase}/" \
			-e "s/@PKGVER@/${pkgver}/" \
			-i "${dst}/dkms.conf"

	# Blacklists conflicting module(s)
	install -Dm644 ${_pkgbase}.conf "${pkgdir}/usr/lib/modprobe.d/${_pkgbase}.conf"
	install -Dm644 ${_pkgbase}.rules "${pkgdir}/etc/udev/rules.d/90-{_pkgbase}.rules"
	gcc fbdaemon.c -o "${pkgdir}/usr/bin/fbdaemon" -lm -lasound -Wl,-z,relro,-z,now,-z,shstk
	#rsync -a "$(basename "${url#https/}")/daemons/" "${shr}/daemons"
}
