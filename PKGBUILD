# Maintainer: Mendel Greenberg <mendel at chabad360 dot com>

pkgname=run-git
_pkgname=run
pkgver=v0.7.0.r8.g0d33f74
pkgrel=1
pkgdesc="Easily manage and invoke small scripts and wrappers"
arch=('i686' 'x86_64')
url="https://github.com/TekWizely/run"
license=('MIT')
provides=('run')
makedepends=(
  'go'
  'git'
)
source=("git+https://github.com/TekWizely/run.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "${srcdir}/${_pkgname}"
  export GOCACHE="${srcdir}/cache"
  export GOPATH="${srcdir}/gopath"
  go mod vendor
  go build \
    -mod=vendor \
    -trimpath \
    -ldflags "-extldflags $LDFLAGS" .
}

package(){
  cd "${srcdir}/${_pkgname}"
  install -Dm755 run "${pkgdir}/usr/bin/run"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
