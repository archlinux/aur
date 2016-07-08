# Maintainer: Dan McCurry <dan.mccurry at linux dot com>
pkgname=organtrail-hib
pkgver=1366135254
pkgrel=1
pkgdesc="A retro zombie survival game. (Humble Bundle version)"
arch=('i686' 'x86_64')
url="http://www.hatsproductions.com/organtraildc/"
license=('custom: Proprietary')
depends=(
	'libxcursor'
	'glu'
	'gcc-libs'
	)
optdepends=('gendesk: create desktop shortcut')
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
source=("hib://OrganTrail_Linux_${pkgver}.tar.gz")
md5sums=('089396dd1b7a4ec9ee1f1b5898038bb3')

prepare() {
	if [[ $(gendesk --version) ]]; then
		msg2 "gendesk found: generating .desktop"
		gendesk --pkgname "${pkgname}" \
			--pkgdesc "${pkgdesc}" \
			--name "Organ Trail" \
			--genericname "Organ Trail" \
			--exec "/opt/${pkgname}/OrganTrailLinux" \
			--categories "Game"
	else
		warning "gendesk not found: skipping"
	fi
}

package() {
	msg2 "Creating directories"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/applications"
	
	msg2 "Copying game data"
	cd "${srcdir}/OrganTrail"
	cp -aR --no-preserve=ownership ./OrganTrailLinux_Data \
		"${pkgdir}/opt/${pkgname}/"
	
	msg2 "Installing binary"
	case ${CARCH} in
		i686)
			install -m 755 OrganTrailLinux.x86 \
				"${pkgdir}/opt/${pkgname}/OrganTrailLinux" ;
			;;
		x86_64)
			install -m 755 OrganTrailLinux.x86_64 \
				"${pkgdir}/opt/${pkgname}/OrganTrailLinux" ;
			;;
		*)
			error "Unknown architecture!";
			;;
	esac		
	ln -s /opt/${pkgname}/OrganTrailLinux ${pkgdir}/usr/bin/organtrail

	msg2 "Adding license file"
	echo $'Copyright: 2013 Hats Productions\nLicense: Proprietary\nAll rights reserved.' > "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

	if [[ -f "${srcdir}/${pkgname}.desktop" ]]; then
		install -m 755 ${srcdir}/${pkgname}.desktop \
		       "${pkgdir}/usr/share/applications/"
	fi
}
