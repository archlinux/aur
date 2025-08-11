# Maintainer: Tianhao Wang <i AT shrik3 DOT com>

pkgname=preprocess-git
# the repo and binary names use abbr.
_pkgname=preprocess
_reponame=fiasco
pkgver=0.0.r3920.150b3482
pkgrel=2
pkgdesc="C++ preprocessor to write unit-style single-source-file modules in C++"
arch=('any')
url=""http://os.inf.tu-dresden.de/~hohmuth/prj/preprocess/
depends=(perl)
makedepends=(git doxygen)
options=('!debug')
license=('GPL-2.0-only')
source=(
    'git+https://github.com/kernkonzept/fiasco'
    'doxygen.patch'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${_reponame}"
  printf "0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # build docs
  cd "${srcdir}/${_reponame}/tool/${_pkgname}/doc"
  patch Doxyfile "${srcdir}/doxygen.patch"
  doxygen
}

# wait until upsteam fixes the test cases
# check() {
#   make -C "${srcdir}/${_reponame}/tool/${_pkgname}/test"
# }

package() {
  cd "${srcdir}/${_reponame}/tool/${_pkgname}"
  # EXECUTABLE
  install -Dm755 "src/preprocess" "${pkgdir}/usr/bin/vendor_perl/preprocess"
  # man page
  install -Dm644 "doc/man/man1/preprocess.1" "${pkgdir}/usr/share/man/man1/preprocess.1"
  # LICENSE
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}

