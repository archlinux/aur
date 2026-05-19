# Maintainer: Leonardo Amaral <archlinux@leonardoamaral.com.br>
# Contributor: Luís Ferreira <luis@aurorafoss.org>
# Contributor: robertfoster
# Contributor: mober <maxATmoberDOTat>
# Contributor: muhviehstarr
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229

_pkgbase=rts5139
pkgname=${_pkgbase}-dkms-git
pkgver=2025.09.05+6fe0d80
pkgrel=1
pkgdesc="Linux kernel drivers module for RTS5129/RTS5139 USB MMC card reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/asymingt/rts5139.git#branch=master"
	dkms.conf
	blacklist-rts5139-dkms-git.conf
	rts5139-dkms-git-suspend.sh
	patch-required_enum_scsi_qc_status.patch)
sha512sums=('SKIP'
            'f2a7278201fa8c9ec06029083b7b8d5b24f2e788ca7f7c1758d3c2130934fb2fc24b42ca64b76f51a5ef69e7b4191dac12cf31d4bd925ecedcbb686062a5b476'
            '4f72873c1202806e78e9b126baca5f1c6c369d0bed9911a05fab9770cbde5324a882dcee0aae6962f4b4c815efd42ddec023065e1de934d98fdbe5cc8c55f5ec'
            '03d1a1e304fd9b172f05edebc438c0c6c96bb6408510e9510e7bbf6ccd482491ba6d5ccc394da37b65ef7515e8f1504c39a5969f0392730c76f70b7d6e5732fa'
            '2833934cebee7c68732ac6555a4daf35db75134305107f7bab40192badf30a51fce5062f98aeec1ae3a3237a16603caceb5ede2170928311ba922975f2b2e8a1')

pkgver() {
	cd "${srcdir}/${_pkgbase}"
	git log --format='%cd+%h' -n1 --date=format:'%Y.%m.%d'
}

package() {
	sourceDir="${srcdir}/${_pkgbase}"
	installDir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	# Copy dkms.conf
	install -Dm644 dkms.conf "${installDir}/dkms.conf"

	# Blacklist rtsx_pci
	install -Dm644 "blacklist-${pkgname}.conf" "${pkgdir}/etc/modprobe.d/blacklist-${pkgname}.conf"
	install -Dm755 "${pkgname}-suspend.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"

	# Copy sources (including Makefile)
	cd "${sourceDir}"

	git apply ${srcdir}/patch-required_enum_scsi_qc_status.patch

	for d in $(find . -type d)
	do
		install -dm755  "${installDir}/$d"
	done

	for f in $(find . -type f ! -name 'README.md' ! -name '.gitignore')
	do
		install -m644 "${sourceDir}/$f" "${installDir}/$f"
	done
}
