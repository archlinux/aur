# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
_pkgname="${pkgname%%-git}"
pkgver=0.99.51.r2.gd54dd23e
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${_pkgname}"
license=('GPL3')
depends=('fmt'
		 'gspell'
		 'gtksourceviewmm'
		 'libxml++2.6'
		 'uchardet'
		 'vte3')
makedepends=('cmake'
			 'git'
			 'python'
			 'spdlog')
checkdepends=('gmock'
              'gtest')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/giuspen/${_pkgname}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake \
	-B "${_pkgname}/build" \
	-S "${_pkgname}" \
	-DAUTO_RUN_TESTING:BOOL='OFF' \
	-DUSE_SHARED_GTEST_GMOCK:BOOL='ON' \
	-Wno-dev
  make -C "${_pkgname}/build"
}

check() {
  ./"${_pkgname}/build/run_tests_no_x"
}

package() {
  make -C "${_pkgname}/build" DESTDIR="${pkgdir}" install
}
