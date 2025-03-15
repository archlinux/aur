# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="gbdotlive"
_commit_rel="8533f92f701b058ec72e32f22ec8af831cb9056a" # 0.1
_commit="ef5716eb45a50d5d225d4fccaa07310abfe652a0" # r50
pkgver="0.1+r50+g${_commit::7}"
pkgrel=1
pkgdesc='A basic gameboy emulator with terminal "Cloud Gaming" support'
arch=('x86_64')
url="https://github.com/HFO4/gameboy.live"
license=('MIT')
depends=('alsa-lib' 'glibc' 'libgl' 'libx11' 'libxcursor' 'libxinerama' 'libxrandr')
makedepends=('go')
optdepends=('inetutils: a "Cloud Gaming" server')
_pkgsrc="gameboy.live-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz"
        "${pkgname}-go.sum")
b2sums=('4433f6f4856e2355c66fcf7a5214ee23b204da8f0feac27b27996d7ef1db5b534835e1ea797ff324cc893b2c71c04222e96b1e6f871a6aa31124df04285cadeb'
        'bd6f2279fefc04c6e2762fd2921f946595cd8d12ac42bb31ce8b41166bf6fc066ba6656bbb4e58cebedcb6776420e3897b922a2f923efc1028d37e8e74a30d6d')

prepare() {
  cd "${srcdir}"
  cp "${pkgname}-go.sum" "${_pkgsrc}/go.sum"

  cd "${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" .
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
