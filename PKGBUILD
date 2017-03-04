# Maintainer: Michael DeGuzis
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>

_pkgname=playonlinux4
pkgname=${_pkgname}-git
pkgver=4.2.10.r38.g36e5b281
pkgrel=2
epoch=1
pkgdesc="GUI for managing Windows programs under linux"
url="http://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'imagemagick' 'xterm' 'wxpython2.8' 'cabextract' 'unzip' 'mesa-demos' 'gnupg'
         'icoutils' 'xdg-user-dirs' 'libxmu' 'netcat' 'wget' 'p7zip')
arch=('any')
provides=('playonlinux')
conflicts=('playonlinux')
source=("${_pkgname}::git://github.com/PlayOnLinux/POL-POM-4.git")
options=(!strip)
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "${srcdir}/${_pkgname}"

	install -d "${pkgdir}/usr/share/${_pkgname}"
	install -d "${pkgdir}/usr/bin"
	cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/usr/share/"
	rm -rf "${pkgdir}/usr/share/${_pkgname}/.git"

	echo '#!/bin/bash' > "${pkgdir}/usr/bin/${_pkgname}"
	echo "/usr/share/${_pkgname}/playonlinux \"\$@\"" >> "${pkgdir}/usr/bin/${_pkgname}"
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# Needed for wxpython2.8 support, wxpython 3.0 is buggy with POL
	sed -i "s/wxversion.ensureMinimal/wxversion.select/g" "${pkgdir}/usr/share/${_pkgname}/python/mainwindow.py"

	install -D -m644 "${srcdir}/${_pkgname}/etc/PlayOnLinux.desktop" "${pkgdir}/usr/share/applications/playonlinux4.desktop"
	sed -i 's/ %F//g' "${pkgdir}/usr/share/applications/playonlinux4.desktop"

	# Fixup desktop file
	sed -i 's/playonlinux/playonlinux4/g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	sed -i 's/PlayOnLinux/PlayOnLinux 4/g' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

	# Install icons
	for size in 16 22 32; do
		install -Dm644 "${srcdir}/${_pkgname}/etc/playonlinux${size}.png" \
		"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/playonlinux4.png"
	done

}
