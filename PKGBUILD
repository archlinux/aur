# Maintainer: Frederik “Freso” S. Olesen <freso.dk@gmail.com>
# Contributor: NexAdn <nexadn@yandex.com>
_pkgname=obs-linuxbrowser
pkgname=${_pkgname}-git
pkgver=0.6.1.r3.gb618678
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
conflicts=("${_pkgname}" "obs-linuxbrowser-bin")
depends=(
	"obs-studio>=21.1.2"
	"gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite"
)
makedepends=("make" "cmake" "git" "cef-minimal<75")
optdepends=("pepper-flash: Flash support"
	"cef-minimal: Up-to-date browser backend")
source=(
	"${_pkgname}::git+https://github.com/bazukas/${_pkgname}.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}"/${_pkgname}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}"/${_pkgname}
	mkdir -p ./build
	cd ./build
	cmake -DCEF_ROOT_DIR="/opt/cef" -DINSTALL_SYSTEMWIDE=true -DCMAKE_INSTALL_PREFIX="/usr" ..
	make
}

package() {
	cd "${srcdir}"/${_pkgname}/build
	make DESTDIR="${pkgdir}" install
}
