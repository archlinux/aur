# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>

pkgname=cherrytree-git
pkgver=1.6.2.r2.g05980868
pkgrel=1
pkgdesc="Hierarchical note-taking application, git version"
arch=('x86_64')
url="https://github.com/giuspen/${pkgname%%-git}"
license=('GPL-3.0-or-later')
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
checkdepends=('gtest')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("git+https://github.com/giuspen/${pkgname%%-git}.git#branch=v1.6.x")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cmake \
    -B "${pkgname%%-git}/build" \
    -S "${pkgname%%-git}" \
    -DAUTO_RUN_TESTING:BOOL='OFF' \
    -DUSE_SHARED_GTEST_GMOCK:BOOL='ON' \
    -Wno-dev
  make -C "${pkgname%%-git}/build"
}

check() {
  ./"${pkgname%%-git}/build/run_tests_no_x"
}

package() {
  make -C "${pkgname%%-git}/build" DESTDIR="${pkgdir}" install
}
