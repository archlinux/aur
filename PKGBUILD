# Maintainer: ServiusHack <serviushack at gmx dot de>
pkgname=casparcg-client-git
pkgver=next_r1235.e0642dc3
pkgrel=1
pkgdesc='A client software used to control the CasparCG Server software'
arch=('x86_64')
url='http://www.casparcg.com/'
license=('GPL')
depends=('boost-libs' 'qt6-base' 'qt6-websockets' 'vlc')
makedepends=('git' 'boost' 'time')
source=('git+https://github.com/CasparCG/Client.git'
        'git+https://github.com/RossBencina/oscpack.git')
sha256sums=('SKIP' 'SKIP')
conflicts=('casparcg-client-bin')

pkgver() {
	cd "$srcdir/Client"
	printf "next_r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/Client"
	git submodule init
	git config submodule.lib/oscpack.url "$srcdir/oscpack"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir/Client"

	./tools/build-linux.sh
}

package() {
	ar x "${srcdir}/Client/build/CasparCG-Client-1.0-Linux.deb" data.tar.gz
	tar xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}
