# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=casparcg-client
pkgver=2.3.1
pkgrel=1
pkgdesc='A client software used to control the CasparCG Server software'
arch=('x86_64')
url='http://www.casparcg.com/'
license=('GPL-3.0-or-later')
depends=('boost-libs' 'qt6-base' 'qt6-websockets' 'vlc')
makedepends=('git' 'boost' 'time')
conflicts=('casparcg-client-bin' 'casparcg-client-git')
source=('git+https://github.com/CasparCG/Client.git'
        'git+https://github.com/RossBencina/oscpack.git')
sha256sums=('SKIP' 'SKIP')

prepare() {
	cd "${srcdir}/Client"
	git checkout "v${pkgver}"
	git submodule init
	git config submodule.lib/oscpack.url "$srcdir/oscpack"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/Client"
	# fix: compatibility with boost 1.90
	git show 41a1fc5105ae9d668cc4b354ab2a7ba1872a8f8e | patch -p1
	./tools/build-linux.sh
}

package() {
	ar x "${srcdir}/Client/build/CasparCG-Client-1.0-Linux.deb" data.tar.gz
	tar xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
