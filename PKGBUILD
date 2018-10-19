# Maintainer: robertfoster
# Contributor: mober <maxATmoberDOTat>
# Thanks to:
# * astyonax@github
#   https://github.com/astyonax/patched-RTS5227-5229

_pkgbase=rts5227
pkgname=${_pkgbase}-dkms
pkgver=1.07
pkgrel=6
pkgdesc="Driver to support Realtek RTS5227/5229 SD Card Reader"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/Downloads/downloadsView.aspx?Langid=1&PNid=15&PFid=25&Level=4&Conn=3&DownTypeID=3&GetDown=false"
license=('GPL2')
depends=('dkms')
source=("rts5229::git+https://github.com/astyonax/patched-RTS5227-5229.git"
	'blacklist-rts5227-dkms.conf'
	'rts5227-dkms-suspend.sh'
)

package(){
	sourceDir="${srcdir}/rts5229/rts5229"
	installDir="${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

	# Blacklist rtsx_pci
	install -Dm644 "blacklist-${pkgname}.conf" "${pkgdir}/etc/modprobe.d/blacklist-${pkgname}.conf"

	# Fix suspend
	install -Dm755 "${pkgname}-suspend.sh" "${pkgdir}/usr/lib/systemd/system-sleep/${pkgname}-suspend.sh"

	# Copy sources (including Makefile)
	cd "${sourceDir}"
	for d in `find . -type d`
	do
		install -dm755  "${installDir}/$d"
	done
	for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
	do
		install -m644 "${sourceDir}/$f" "${installDir}/$f"
	done
}

md5sums=('SKIP'
         '6640eecc5bcc3584397a7d1a33eb028f'
         'e59828310982d2943318900d7017b99f')
