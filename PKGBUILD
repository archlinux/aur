# Maintainer: Luís Ferreira <luis@aurorafoss.org>
# Contributor: robertfoster
# Contributor: mober <maxATmoberDOTat>
# Contributor: muhviehstarr
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229

_pkgbase=rts5139
pkgname=${_pkgbase}-dkms
pkgver=1.05
pkgrel=1
pkgdesc="Linux kernel drivers module for RTS5129/RTS5139 USB MMC card reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/aurorafossorg/rts5139.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
	sourceDir="${srcdir}/${_pkgbase}"
	installDir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	# Copy sources (including Makefile)
	cd "${sourceDir}"

	# Blacklist rtsx_pci
	install -Dm644 "blacklist-${pkgname}.conf" "${pkgdir}/etc/modprobe.d/blacklist-${pkgname}.conf"

	# Fix suspend
	install -Dm755 "${pkgname}-suspend.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"
	
	for d in `find . -type d`
	do
		install -dm755  "${installDir}/$d"
	done
	for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
	do
		install -m644 "${sourceDir}/$f" "${installDir}/$f"
	done
}
