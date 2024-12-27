# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="RadioGoGo"
pkgname="${_name,,}"
_commit_rel="af64914529f483f76bec535f7c4eed258f25e42d" # 0.3.2
_commit="efad593841c4f8ba8b5918763a57ac6757f9b0f2" # r5
pkgver="0.3.2+r5+g${_commit::7}"
pkgrel=1
pkgdesc="Go-powered CLI to surf global radio waves via a sleek TUI."
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/matteo-pacini/${_name}"
license=('MIT')
depends=('glibc')
makedepends=('go')
_pkgsrc="${_name}-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('30ad7d8f4e8d95d4635970ed6932b52ce5628ba9b3c835abc82a9095f3974f8c5bdc84ed443e43eec1e37d45a2aeecd2dc1bab7ce9f99913befff62e8bad5e64')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "build/${pkgname}" .
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
