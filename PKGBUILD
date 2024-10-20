# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: 2ion <dev@2ion.de>

set -u
pkgname=miller
pkgname+='-git'
pkgver=6.13.0.r17.g05aa16cfc
pkgrel=1
pkgdesc='sed, awk, cut, join, and sort for name-indexed data such as CSV and tabular JSON.'
arch=('x86_64' 'i686')
url='https://github.com/johnkerl/miller'
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('go' 'git')
options=('!lto')
source=("$pkgname::git+$url#tag=v$pkgver")
#source[0]='https://github.com/johnkerl/miller/archive/master.tar.gz'; _srcdir='miller-master'
md5sums=('754c6d69ef4bfaa6c16257a2d8301f09')
sha256sums=('4f41ff06c1fbf524127574663873ba83bb3f4e3eb31e29faf5c2ef3fc6595cb4')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  source[0]="git+${url}"
  makedepends+=('git')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  echo "${pkgver%.r*}"
}
fi

prepare() {
  cd "${_srcdir}"

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
  chmod -R u+w "${GOPATH}/pkg/mod"
}

build() {
  cd "${_srcdir}"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}'" \
    ./cmd/mlr
}

package() {
  cd "${_srcdir}"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" mlr

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/man/man1" man/mlr.1
  install -vDm644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" LICENSE.txt
}
set +u
