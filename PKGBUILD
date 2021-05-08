# Maintainer: Grigory Vasilyev <echo "h0tc0d3(-*A*-)g-m*a-i-l(-d#t-)c#m" | sed -e 's/-//ig;s/*//ig;s/(A)/@/i;s/#/o/ig;s/(dot)/./i'>

validpgpkeys=('33ED753E14757D79FA17E57DC4C1F715B2B66B95')

pkgname=verible
pkgver=0.0.r1213.9e5c085b
pkgrel=1
pkgdesc="Verilog, SystemVerilog Parser, Style-Linter, and Formatter from GOOGLE"
arch=('x86_64')
url='https://github.com/google/verible'
license=('Apache 2.0')
depends=('bash')
makedepends=('bazel' 'git')
provides=('verible')
conflicts=('verible-git')
_gitcommit="9e5c085b9563f496f2b8b08e75e9a02007da18e3"
source=("verible::git+https://github.com/google/verible.git#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1m\E[31mCan't cd to ${srcdir}/gost-engine build directory! PkgVer Failed! \E[0m"
    exit 1
  )

  _tagver=$(git describe --long --tags HEAD | sed 's/^v//;s/-.*//')
  _gitrev=$(($(git rev-list --count HEAD) - 1))
  _githash=$(git rev-parse --short HEAD)

  echo "${_tagver}.r${_gitrev}.${_githash}"

}

build() {
  
  cd "${srcdir:?}/${pkgname}"  || (
    echo -e "\E[1m\E[31mCan't change working directory to ${srcdir}/${pkgname}! Build Failed!\E[0m"
    exit 1
  )

  bazel build -c opt //...
  
}

check() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1m\E[31mCan't change working directory to ${srcdir}/${pkgname}! Check Failed!\E[0m"
    exit 1
  )

  bazel test //...

}

package() {

  cd "${srcdir:?}/${pkgname}" || (
    echo -e "\E[1m\E[31mCan't change working directory to ${srcdir}/${pkgname}! Package Failed!\E[0m"
    exit 1
  )

  install -d "${pkgdir:?}/usr/bin"

  bazel run :install -c opt -- "${pkgdir:?}/usr/bin"

}
