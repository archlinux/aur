# Contributor: Integral <integral@murena.io>
pkgname=klevernotes-git
_pkgname=klevernotes
_name=klever
pkgver=0.1_r83.g8e76043
pkgrel=1
pkgdesc="A convergent markdown note taking application."
url="https://gitlab.com/schul9louis/klever"
arch=('x86_64')
license=('GPL' 'LGPL' 'BSD')
depends=('kio' 'qt5-webengine')
makedepends=('extra-cmake-modules' 'git')
source=("git+https://gitlab.com/schul9louis/klever.git")
md5sums=('SKIP')

pkgver() {
	cd ${_name}/
	_version=$(grep -m1 "${_pkgname} VERSION" CMakeLists.txt | awk '{print $3}' | sed 's/)//')
	echo "${_version}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
	install -d build/
}

build() {
	cd build/
	cmake -B build/ -S ../${_name} -DBUILD_TESTING=OFF
	cmake --build build/
}

package() {
	cd build/
	DESTDIR="${pkgdir}/" cmake --install build/

	# Licenses
	install -Dm644 ${srcdir}/${_name}/src/LICENSES/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
