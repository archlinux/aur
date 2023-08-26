# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
pkgver=1.0.1.r2.g08eec868
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${pkgname%%-git}"
license=('GPL3')
depends=('gspell'
		 'gtksourceviewmm'
		 'libxml++2.6'
		 'uchardet'
		 'vte3')
makedepends=('cmake'
			 'git'
			 'python')
checkdepends=('gmock'
              'gtest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("git+https://github.com/giuspen/${pkgname%%-git}.git"
        "git+https://github.com/gabime/spdlog.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Remove once extra/spdlog>=1.12
prepare() {
  cd "${pkgname%%-git}"
  git submodule init
  git config submodule.src/spdlog.url "${srcdir}/spdlog"
  git -c protocol.file.allow=always submodule update 
}

build() {
  cmake \
	-B "${pkgname%%-git}/build" \
	-S "${pkgname%%-git}" \
	-DAUTO_RUN_TESTING:BOOL='OFF' \
	-DUSE_SHARED_GTEST_GMOCK:BOOL='ON' \
	-DUSE_SHARED_FMT_SPDLOG:BOOL='OFF' \
	-Wno-dev
  make -C "${pkgname%%-git}/build"
}

check() {
  ./"${pkgname%%-git}/build/run_tests_no_x"
}

package() {
  make -C "${pkgname%%-git}/build" DESTDIR="${pkgdir}" install
}
