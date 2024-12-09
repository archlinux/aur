# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="mrg"
pkgname="mergetb-cli"
pkgver=1.3.6
pkgrel=1
pkgdesc="Command-line tool used to interact and manage a Merge testbed and experiments"
arch=('x86_64' 'aarch64' 'i686')
url="https://next.mergetb.org/docs/experimentation/cli-reference"
_url="https://gitlab.com/mergetb/portal/cli"
license=('custom:Unknown')
depends=('glibc')
makedepends=('go')
_pkgsrc="cli-v${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/-/archive/v${pkgver}/cli-v${pkgver}.tar.gz")
sha256sums=('6614ac138499d67c2922eceaa8037907057c495ffa4c7fe6ed205dad997c66e5')

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
  go build -o "build/${_binname}" .

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
  install -Dm755 "build/${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_binname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "${_binname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_binname}.fish"
  install -Dm644 "${_binname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
  install -Dm644 "${_binname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_binname}.ps1"
}
