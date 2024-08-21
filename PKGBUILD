# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=fractorium
pkgname=${_pkgname}-git
pkgver=r1029.391ee67
pkgrel=1
pkgdesc="A Qt-based fractal flame editor which uses a C++ re-write of the flam3 algorithm named Ember and a GPU capable version named EmberCL which implements a portion of the cuburn algorithm in OpenCL."
arch=('x86_64')
url="https://bitbucket.org/mfeemster/fractorium/"
license=('GPL3')
makedepends=(
	'git'
	'libgl'
	'glm'
	'libjpeg-turbo'
	'libpng'
	'libxml2'
	'opencl-headers'
)
depends=(
	'ocl-icd'
	'openexr>=3.0'
	'qt6-3d'
)
provides=("${_pkgname}")
conflicts=()
epoch=1
source=(
	"${_pkgname}::git+https://bitbucket.org/mfeemster/fractorium.git"
)

sha256sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	qmake6 main.pro -r -spec linux-g++-64 CONFIG+="release native"
}

build() {
	cd "${srcdir}/${_pkgname}"

	make
}

check() {
	: #Do nothing
}

package() {
	cd "${srcdir}/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}/" install
	install -m644 -D "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
