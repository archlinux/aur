# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
_pkgname="${pkgname%%-git}"
pkgver=0.99.48.r25.g8ac825c2
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${_pkgname}"
license=('GPL3')
depends=('fmt'
	 'gspell'
	 'gtksourceviewmm'
	 'libxml++2.6'
	 'uchardet')
optdepends=('xorg-xhost: allow chroot access to X server for running tests')
makedepends=('cmake'
	     'git'
	     'python'
	     'spdlog')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/giuspen/${_pkgname}.git"
	"git+https://github.com/google/googletest.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule init
  git config submodule.googletest.url "${srcdir}/googletest"
  git submodule update
}

build() {
  cmake \
	-B "${_pkgname}/build" \
	-S "${_pkgname}" \
	-DINSTALL_GTEST:BOOL='OFF' \
	-DAUTO_RUN_TESTING:BOOL='OFF' \
	-Wno-dev
  make -C "${_pkgname}/build"
}

# NOTE: In order to run tests that depend on the X server in a clean chroot, 
# you must allow the chroot access your X server:
# xhost +local:
# https://wiki.archlinux.org/index.php/chroot#Run_graphical_applications_from_chroot
check() {
  export DISPLAY=:0
  ./"${_pkgname}/build/run_tests_with_x_1"
  ./"${_pkgname}/build/run_tests_with_x_2"
}

package() {
  make -C "${_pkgname}/build" DESTDIR="${pkgdir}" install
}
