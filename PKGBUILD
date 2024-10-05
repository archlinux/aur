# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="usacloud"
pkgver=1.14.1
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/sacloud/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
sha256sums=('78b9b737006f2c96e5987db51601b53bc74aa5ed682e5e500744b1407c62cff6')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/${pkgname}/pkg/version.Revision=$(git rev-parse --short HEAD)" \
    .

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "AUTHORS"     "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.ps1"
}
