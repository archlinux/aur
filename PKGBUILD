# Maintainer: mickybart <mickybart@pygoscelis.org>
# Contributor: BlackEagle <ike.devolder@gmail.com>>

pkgname=kodi-addon-peripheral-joystick-git
pkgver=r742.12e7d52
pkgrel=1
pkgdesc="Joystick support for Kodi"
arch=('armv7h' 'x86_64')
url='https://github.com/xbmc/peripheral.joystick'
license=('GPL')
groups=('kodi-addons' 'kodi-addons-peripheral')
depends=('kodi-platform')
makedepends=('git' 'cmake' 'kodi-dev')
source=("$pkgname::git+https://github.com/xbmc/peripheral.joystick.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	_revision=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
	echo "$_revision"
}

prepare() {
	[[ -d kodi-addons-build ]] && rm -rf kodi-addons-build
	mkdir kodi-addons-build
}

build() {
        cd kodi-addons-build
        cmake \
                -DCMAKE_INSTALL_PREFIX=/usr/share/kodi/addons/ \
                -DCMAKE_BUILD_TYPE=Release \
                -DPACKAGE_ZIP=1 \
                "../$pkgname"
        make
}

package() {
        cd kodi-addons-build
        make DESTDIR="$pkgdir/" install
}

