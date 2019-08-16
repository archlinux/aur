# Maintainer: Benjamin Lopez <contact@scotow.com>

pkgname=mego
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple megadl wrapper with auto-retry and download list"
arch=('x86_64')
url="https://github.com/scotow/${pkgname}"
license=('MIT')
depends=('megatools')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/scotow/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f7d60a9cefa4fbc1cfad391a6b503085198b2b97d868882bc414d4f7ebb057c2')

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
