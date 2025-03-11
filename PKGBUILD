# The existing version is unusable; package your own.
# reference: https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=ida-pro
# Maintainer: vctv <alanhays0617@gmail.com>

pkgver=9.0
pkgname="ida-pro-beta"
pkgrel=1
pkgdesc="Hex-Rays IDA Pro"
url="https://github.com/vctv/IDA-Pro/releases"
license=('custom')
makedepends=('fakechroot')
depends=('libgl'
	'libx11'
	'libxext'
	'libxrender'
	'glib2'
	'qt5-base'
	'python-rpyc'
	)
options=('!strip')

_installer="ida-pro_${pkgver}_x64linux.run"

source=("${url}/download/${pkgver}/${_installer}")

sha256sums=('c0e2d5f410f8a4a3745bb219d821d690ce1768a5ce0a25e86e0c30c1fe599c71')

arch=('x86_64')

package() {
	install -d "${pkgdir}"/opt/${pkgname}
	install -d "${pkgdir}"/usr/bin
	install -d "${pkgdir}"/usr/share/{icons,applications,licenses/${pkgname}}
	install -d "${pkgdir}"/tmp

	cp "${srcdir}"/${_installer} "${pkgdir}"/
	chmod +x "${pkgdir}"/${_installer}

	mkdir -p $pkgdir/$HOME/.local/share/applications
	fakechroot chroot "${pkgdir}" /${_installer} --mode unattended --prefix "/opt/${pkgname}"

	find "${pkgdir}"/opt/${pkgname} -type f -exec chmod -x {} \;
	chmod +x "${pkgdir}"/opt/${pkgname}/{assistant,hv,hvui,ida,idapyswitch,idat,picture_decoder,qwingraph,upg32}
	install "$pkgdir$HOME/.local/share/applications"/*.desktop "${pkgdir}"/usr/share/applications

	rm "${pkgdir}"/${_installer}
	rm "${pkgdir}"/opt/${pkgname}/{uninstall*,Uninstall*}
	rm -Rf "${pkgdir}"/{tmp,home}

	ln -s /opt/${pkgname}/appico.png "${pkgdir}"/usr/share/icons/${pkgname}.png
	ln -s /opt/${pkgname}/hvui.png "${pkgdir}"/usr/share/icons/${pkgname}-teams.png
	ln -s /opt/${pkgname}/ida "${pkgdir}"/usr/bin/ida
}