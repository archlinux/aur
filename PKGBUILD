# Maintainer: Nikolay Arhipov <nikolajs.arhipovs@gmail.com>

pkgname=dingo
pkgver=0.13
pkgrel=1
pkgdesc='A DNS client in Go that supports Google DNS over HTTPS'
provides=('dingo')
conflicts=('dingo-git')
arch=('i686' 'x86_64')
license=('unknown')
makedepends=('go' 'git')
url='https://github.com/pforemski/dingo'
_gopkg=github.com/pforemski
source=("git://${_gopkg}/${pkgname}.git#tag=${pkgver}"
       dingo.config
       dingo.service)
sha256sums=('SKIP'
            'b550726b87687f0dc659d0d3eb2eb1e2448d0bf556743992d853de572675fefd'
            'c84e727bb76af4c7a8d88014de5992e6a6bf056aa5be4654d96b1229df55984c')

backup=('etc/dingo')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags
}

build() {
  [ -d "${srcdir}/go" ] && rm -rf "${srcdir}/go"

  mkdir -p "${srcdir}/go/src/${_gopkg}/"
  ln -s "${srcdir}/${pkgname}" "$srcdir/go/src/${_gopkg}/"
  cd "${srcdir}/go/src/${_gopkg}/${pkgname}"
  GOPATH="${srcdir}/go" go get -v \
		-gcflags "-trimpath $GOPATH/src" \
		./...
}

package() {
  cd "${srcdir}/go/bin"
  install -Dm755 dingo "${pkgdir}/usr/bin/dingo"

  cd "${srcdir}"
  install -Dm644 dingo.config "${pkgdir}/etc/dingo"
  install -Dm644 dingo.service "${pkgdir}/usr/lib/systemd/system/dingo.service"
}

