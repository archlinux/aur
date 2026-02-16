# Maintainer: zarazaex <zarazaex@tuta.io>
pkgname=rz-pm-git
_pkgname=rz-pm
pkgver=0.3.3.r28.gc20d389
pkgrel=1
pkgdesc="Rizin package manager (git version)"
arch=('x86_64')
url="https://github.com/rizinorg/rz-pm"
license=('LGPL3')
depends=('glibc')
makedepends=('git' 'go')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!debug')
source=("git+https://github.com/rizinorg/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${_pkgname}"
  
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"

  go build -o ${_pkgname} .
}

package() {
  cd "${_pkgname}"
  
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
