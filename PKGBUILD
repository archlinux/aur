# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="space"
pkgname="${_binname}-cli"
_pkgver=0.5.0-rc.0
pkgver="${_pkgver//-rc./rc}"
pkgrel=1
pkgdesc="Deta Space CLI"
arch=('x86_64' 'aarch64')
url="https://deta.space"
_url="https://github.com/deta/${pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=("${_binname}")
conflicts=("${_binname}")
_pkgsrc="${pkgname}-${_pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('61bb63ac04f5c984ea184ea2f78dbda0b5da7c2a621c12805bd380e120be353e')

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
  go build -v -o "build/${_binname}" -ldflags "\
    -X github.com/deta/space/cmd/utils.SpaceVersion=${_pkgver} \
    -X github.com/deta/space/cmd/utils.Platform=$(go env GOARCH)-$(go env GOOS)" \
    .

  for _sh in bash fish zsh powershell; do
    ./"build/${_binname}" completion "${_sh}" > "completions/${_binname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md"         "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"           "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -vDm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -vDm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -vDm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
