# Maintainer: Benjamin Lopez <contact@scotow.com>

pkgname=mego
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple megadl wrapper with auto-retry and download list"
arch=('x86_64')
url="https://github.com/scotow/${pkgname}"
license=('MIT')
depends=('megatools')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scotow/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('431e8ca61e04936bba225925c331f011754cb76eaac894903e7eb256a73e651f')

prepare(){
  mkdir -p src/github.com/scotow
  ln -rTsf "${pkgname}-${pkgver}" "src/github.com/scotow/${pkgname}"
}

build(){
  export GOPATH="${srcdir}"
  cd "src/github.com/scotow/${pkgname}"
  go get -v ./...
  go install \
	-gcflags "all=-trimpath=${GOPATH}/src" \
	-asmflags "all=-trimpath=${GOPATH}/src" \
	-ldflags "-extldflags ${LDFLAGS}" \
	./...
}

package(){
  install -Dm755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  cd "${pkgname}-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
