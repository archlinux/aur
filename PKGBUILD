# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=liri-pulseaudio-git
pkgver=r76.fdfb2e9
pkgrel=1
pkgdesc="PulseAudio support for Liri Shell"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://liri.io"
license=('LGPL3')
depends=('fluid-git' 'pulseaudio')
makedepends=('git' 'liri-cmake-shared-git')
options=(debug !strip)
conflicts=('liri-pulseaudio')
replaces=('liri-pulseaudio')
provides=('liri-pulseaudio')
groups=('liri-git')

_gitroot="git://github.com/lirios/pulseaudio.git"
_gitbranch=develop
_gitname=pulseaudio
source=(${_gitname}::${_gitroot}#branch=${_gitbranch})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING:BOOL=OFF \
		-DINSTALL_SYSCONFDIR=/etc \
		-DINSTALL_LIBDIR=/usr/lib \
		-DINSTALL_LIBEXECDIR=/usr/lib \
		-DINSTALL_QMLDIR=/usr/lib/qt/qml \
		-DINSTALL_PLUGINSDIR=/usr/lib/qt/plugins
	make
}

package() {
	cd build
	make DESTDIR="$pkgdir" install
}
