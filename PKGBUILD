# Maintainer: bloominstrong < archlinux at mail dot bloominstrong dot net >
pkgname=hyprkeys
pkgver=1.0.3
pkgrel=1
pkgdesc='A simple, scriptable keybind retrieval utility for Hyprland'
arch=('x86_64')
url='https://github.com/hyprland-community/Hyprkeys'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('go')
options=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('90692f3531e51a9fe97ab01e5a6d3c0ba5f991d81c0106bfbea67c52f0eddb57')


_upstreamname=Hyprkeys

build() {
  cd "${_upstreamname}-${pkgver}"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/${pkgname} -ldflags "-X 'main.version=v${pkgver}'" .

  mkdir -p completions
  ./build/${pkgname} completion zsh > completions/_${pkgname}
  ./build/${pkgname} completion bash > completions/${pkgname}
  ./build/${pkgname} completion fish > completions/${pkgname}.fish

}

check() {
  cd "${_upstreamname}-${pkgver}"

  go test -v ./...
}

package() {
  cd "${_upstreamname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "completions/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}

