# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

pkgname=verible
pkgver=0.0r2037.g4cccc6b2
pkgrel=1
pkgdesc="SystemVerilog(Verilog) Parser, Style-Linter, and Formatter from Google"
arch=('x86_64')
url='https://github.com/chipsalliance/verible'
license=('Apache 2.0')
depends=('bash')
makedepends=('bazel' 'git' 'm4' 'flex' 'bison')
provides=('verible')
conflicts=('verible-git')
_gittag="v0.0-2037-g4cccc6b2"
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

  bazel build -c opt --//bazel:use_local_flex_bison //...

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
