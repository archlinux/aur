# Maintainer: Nikolay Arhipov <nikolajs.arhipovs@gmail.com>

_pkgname=dingo
pkgname=${_pkgname}-git
pkgver=0.13.r4.gf79f3dd
pkgrel=2
pkgdesc='A DNS client in Go that supports Google DNS over HTTPS'
provides=('dingo')
conflicts=('dingo')
arch=('i686' 'x86_64')
license=('unknown')
makedepends=('go' 'git')
url='https://github.com/pforemski/dingo'
_gopkg=github.com/pforemski
source=("git+https://${_gopkg}/${_pkgname}.git#branch=master"
       dingo.service)
sha256sums=('SKIP'
            '4ba90fdb9ab77f50fc50012f42187fd570921f3f6b868b32619955e910c5cdd5')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  [ -d "${srcdir}/go" ] && rm -rf "${srcdir}/go"

  mkdir -p "${srcdir}/go/src/${_gopkg}/"
  ln -s "${srcdir}/${_pkgname}" "$srcdir/go/src/${_gopkg}/"
  cd "${srcdir}/go/src/${_gopkg}/${_pkgname}"
  GOPATH="${srcdir}/go" go get -v \
        -ldflags="-s -w" \
        -gcflags "-trimpath $GOPATH/src" \
		./...
}

package() {
  cd "${srcdir}/go/bin"
  install -Dm755 dingo "${pkgdir}/usr/bin/dingo"

  cd "${srcdir}"
  install -Dm644 dingo.service "${pkgdir}/usr/lib/systemd/system/dingo.service"
}

