#depends() very incomplete
# you may need to edit this / rename your installer file. See _installer
#based on ida-free PKGBUILD by fatalis
#maintainer: fenugrec

pkgver=7.3
pkgname="ida-pro"
pkgrel=1
pkgdesc="Hex-Rays IDA Pro {pkgver}"
url="https://www.hex-rays.com/products/ida/${pkgver}/index.shtml"
license=('custom')
makedepends=('fakechroot')
depends=('libgl'
	'qt5-base'
	)
options=('!strip')

_installer='x64_idapronl_7.3.run'

source=('ida-pro.desktop')

sha256sums=('6ac694f7956d5baf466db1983bcece84a3b8bc5d8ae82d5d69a46921d673d0c8')

arch=('x86_64')

package() {
	read -rp "Enter your installation password: " _installpw
	[[ -z $_installpw ]] && return -1

	install -d "${pkgdir}"/opt/${pkgname}
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/{icons,applications,licenses/${pkgname}}
	install -d "${pkgdir}"/tmp

	# chroot is needed to prevent the installer from creating a single file outside of prefix
	# have to copy the installer due to chroot
	cp "${srcdir}"/${_installer} "${pkgdir}"/
	chmod +x "${pkgdir}"/${_installer}
	fakechroot chroot "${pkgdir}" /${_installer} --mode unattended --prefix /opt/${pkgname} --installpassword ${_installpw}
	rm "${pkgdir}"/${_installer}
	rm -R "${pkgdir}"/tmp

	# the installer needlessly makes a lot of files executable
	find "${pkgdir}"/opt/${pkgname} -type f -exec chmod -x {} \;
	chmod +x "${pkgdir}"/opt/${pkgname}/{ida{,64},assistant,qwingraph}

	rm "${pkgdir}"/opt/${pkgname}/{uninstall*,Uninstall*}

	install "${srcdir}"/ida-pro.desktop "${pkgdir}"/usr/share/applications
	ln -s /opt/${pkgname}/appico64.png "${pkgdir}"/usr/share/icons/ida-pro.png
	ln -s /opt/${pkgname}/license.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
	ln -s /opt/${pkgname}/ida64 "${pkgdir}"/usr/bin/ida64
}
