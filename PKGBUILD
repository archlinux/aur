# Maintainer: poscat

pkgname=verible
pkgver=0.0r3841.g5eb8aa34
pkgrel=1
pkgdesc="SystemVerilog(Verilog) Parser, Style-Linter, and Formatter from Google"
arch=('x86_64')
url='https://github.com/chipsalliance/verible'
license=('Apache 2.0')
depends=('bash')
makedepends=('bazel' 'git' 'm4' 'flex' 'bison')
provides=('verible')
conflicts=('verible-git')
_gittag="v0.0-3841-g5eb8aa34"
source=(
  "verible::git+https://github.com/chipsalliance/verible.git#tag=${_gittag}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir:?}/verible" || (
    echo -e "\E[1;31mCan't cd to ${srcdir}/verible build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  git describe --long --tags | cut -f1-3 -d- | cut -c2- | sed 's/-/r/;s/-/./'
}

build() {
  cd "${srcdir:?}/verible" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/verible! Build Failed!\E[0m"
    exit 1
  )

  bazel build -c opt --//bazel:use_local_flex_bison :install-binaries
}

check() {
  cd "${srcdir:?}/verible" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/verible! Check Failed!\E[0m"
    exit 1
  )

  bazel test -c opt --//bazel:use_local_flex_bison //...
}

package() {
  cd "${srcdir:?}/verible" || (
    echo -e "\E[1;31mCan't change working directory to ${srcdir}/verible! Package Failed!\E[0m"
    exit 1
  )

  bazel run -c opt --//bazel:use_local_flex_bison //:install -- "${pkgdir:?}/usr/bin"
}
