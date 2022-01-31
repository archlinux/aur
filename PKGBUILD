# Maintainer: Luís Ferreira <luis@aurorafoss.org>
# Contributor: robertfoster
# Contributor: mober <maxATmoberDOTat>
# Contributor: muhviehstarr
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229

_pkgbase=rts5139
pkgname=${_pkgbase}-dkms
pkgver=1.06
pkgrel=1
pkgdesc="Linux kernel drivers module for RTS5129/RTS5139 USB MMC card reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/ljmf00/rts5139.git#tag=v${pkgver}"
	dkms.conf)
sha512sums=('SKIP'
            'f2a7278201fa8c9ec06029083b7b8d5b24f2e788ca7f7c1758d3c2130934fb2fc24b42ca64b76f51a5ef69e7b4191dac12cf31d4bd925ecedcbb686062a5b476')

package() {
	sourceDir="${srcdir}/${_pkgbase}"
	installDir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	# Copy dkms.conf
	install -Dm644 dkms.conf "${installDir}/dkms.conf"

	# Copy sources (including Makefile)
	cd "${sourceDir}"

	# Blacklist rtsx_pci
	install -Dm644 "blacklist-${pkgname}.conf" "${pkgdir}/etc/modprobe.d/blacklist-${pkgname}.conf"
	install -Dm755 "${pkgname}-suspend.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"

	for d in $(find . -type d)
	do
		install -dm755  "${installDir}/$d"
	done

	for f in $(find . -type f ! -name 'README.md' ! -name '.gitignore')
	do
		install -m644 "${sourceDir}/$f" "${installDir}/$f"
	done
}
