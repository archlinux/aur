# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
_pkgname="${pkgname%%-git}"
pkgver=0.99.27.r6.g6e9d4a38
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${_pkgname}"
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
source=("git+https://github.com/giuspen/${_pkgname}.git"
        "git+https://github.com/gabime/spdlog.git"
	"git+https://github.com/google/googletest.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.spdlog.url "${srcdir}/spdlog"
  git config submodule.googletest.url "${srcdir}/googletest"
  git submodule update
}

build() {
  cmake \
	-B "${_pkgname}/build" \
	-S "${_pkgname}" \
	-DBUILD_GMOCK:BOOL='OFF' \
	-DBUILD_TESTING:BOOL='OFF' \
	-DINSTALL_GTEST:BOOL='OFF' \
	-Wno-dev
  make -C "${_pkgname}/build"
}

package() {
  make -C "${_pkgname}/build" DESTDIR="${pkgdir}" install
}
