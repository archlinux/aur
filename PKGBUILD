# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: K. Hampf <khampf@users.sourceforge.net>
# Contributor: Skunnyk <skunnyk@archlinux.fr>
gitdir='POL-POM-4'
_pkgname='playonlinux'
pkgname="${_pkgname}-git"
pkgver=4.2.10.r19.gfe283cd
pkgrel=1
epoch=1
pkgdesc="GUI for managing Windows programs under linux"
url="http://www.playonlinux.com/"
license=('GPL')
depends=('wine' 'imagemagick' 'xterm' 'wxpython' 'cabextract' 'unzip' 'mesa-demos' 'gnupg' 'icoutils' 'xdg-user-dirs' 'libxmu' 'netcat' 'wget' 'p7zip')
arch=('any')
provides=('playonlinux')
conflicts=('playonlinux')
source=("git://github.com/PlayOnLinux/POL-POM-4.git")
options=(!strip)
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${gitdir}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${gitdir}"
    make
}
package() {
	cd "${srcdir}/${gitdir}"

	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	cp -rf * "${pkgdir}/usr/share/${_pkgname}/"
	rm -rf "${pkgdir}/usr/share/${_pkgname}/.git"

	echo '#!/bin/bash' > "${pkgdir}/usr/bin/${_pkgname}"
	echo "/usr/share/${_pkgname}/${_pkgname} \"\$@\"" >> "${pkgdir}/usr/bin/${_pkgname}"
	chmod +x "${pkgdir}/usr/bin/${_pkgname}"

	# Needed for wxpython2.8 support, wxpython 3.0 is buggy with POL
	#sed -i "s/wxversion.ensureMinimal/wxversion.select/g" "${pkgdir}/usr/share/${_pkgname}/python/mainwindow.py"

	install -D -m644 etc/PlayOnLinux.desktop "${pkgdir}/usr/share/applications/playonlinux.desktop"
	sed -i 's/ %F//g' "${pkgdir}/usr/share/applications/playonlinux.desktop"
}
