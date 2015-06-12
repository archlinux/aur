
# Maintainer : mdevlamynck <matthias.devlamynck@mailoo.org>

pkgname=kdeplasma-addons-applets-nvidia-monitor-git
_gitname=nvidia-monitor
_gitrepo=https://github.com/mdevlamynck/nvidia-monitor.git
url=https://github.com/mdevlamynck/nvidia-monitor
pkgver=0.4
pkgrel=4
pkgdesc="An applet that monitor nvidia GPU using NVCtrl api (with proprietary drivers). Not supporting SLI yet."

arch=('i686' 'x86_64')
license=('GPL3')
depends=('nvidia-utils' 'kdebase-workspace' 'libxnvctrl' 'automoc4')
makedepends=('git' 'cmake' 'kdeplasma-addons-libs')

source=("git+${_gitrepo}")
install=nvidia-monitor.install
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	git tag|sort -V|tail -1|tr "-" "."|sed "s/^v//"
}

build () {
	cd "${srcdir}/${_gitname}"
	git checkout v${pkgver}
	mkdir -p build
	cd build
	LDFLAGS="$LDFLAGS -Wl,--no-as-needed"
	cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/$(kde4-config --prefix)" -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make install
}

