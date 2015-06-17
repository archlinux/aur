#Maintainer: ava1ar <mail(at)ava1ar(dot)info>

pkgname=skypetab-ng-git
_pkgname=skypetab-ng
pkgver=v0.5.0.fixed.27.g9e5b1ed
pkgrel=1
pkgdesc='A program that adds tabs to Skype™ for Linux'
url='http://keks-n.net/skypetab'
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4' 'qtwebkit' 'skype')
options=('!strip')
install=skypetab-ng.install
makedepends=('git')
[[ "${CARCH}" = 'x86_64' ]] && makedepends+=('gcc-multilib')
source=('git+http://github.com/kekekeks/skypetab-ng.git')
sha1sums=('SKIP')

pkgver () {
	cd ${_pkgname}
	echo $(git describe --always | sed 's/-/./g')
}

build() {
	cd ${_pkgname}
	qmake-qt4 -spec linux-g++-32
}

package() {
	cd ${_pkgname}
	make INSTALL_ROOT=${pkgdir} install
	# moving libs to /usr/lib32 instead of /usr/lib on 64-bit systems
	[[ "${CARCH}" = 'x86_64' ]] && mv ${pkgdir}/usr/lib ${pkgdir}/usr/lib32
	# applying PulseAudio workaround
	sed -i 's/skypetab-ng/env PULSE_LATENCY_MSEC=60 skypetab-ng/' ${pkgdir}/usr/share/applications/skypetab-ng.desktop  
}
