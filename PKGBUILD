# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
_pkgname="${pkgname%%-git}"
pkgver=0.99.25.r22.g7f00d91b
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/cherrytree"
license=('GPL3')
depends=('gspell'
	 'gtksourceviewmm'
	 'libxml++2.6'
	 'uchardet')
makedepends=('cmake'
	     'git'
	     'python')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/giuspen/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Fix automatic optimisation flag override
  sed -i 's/-O3/-O2/' "${_pkgname}/CMakeLists.txt"
}

build() {
  cmake \
	-B "${_pkgname}/build" \
	-S "${_pkgname}" \
	-DBUILD_TESTING:BOOL=OFF \
	-Wno-dev
  make -C "${_pkgname}/build"
}

package() {
  make -C "${_pkgname}/build" DESTDIR="${pkgdir}" install
}
