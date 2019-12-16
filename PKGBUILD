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
pkgrel=2
pkgdesc="Linux kernel drivers module for RTS5129/RTS5139 USB MMC card reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/aurorafossorg/rts5139.git#tag=v${pkgver}"
	dkms.conf)
sha512sums=('SKIP'
            '4cfe8db8f5de6a81bf431a54291ee60f16b93f1928fb5c29bd157c0c896f03fca383a35b11b2e137ee711403d3692e7c9794909f3c3273916393bf7308700c6e')

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
