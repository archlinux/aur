# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="supabase"
pkgname="${_name}-beta"
pkgver=2.12.0
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=('aarch64' 'x86_64')
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/${_name}/cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
# checkdepends=('docker')
provides=("${_name}")
conflicts=("${_name}")
_pkgsrc="cli-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('15c91fd85910087bc2957edb4b911d1cafc5786d949f38dbfee252568ed35e29b0fc7d9fcc4f7ad3039c19a5d874a4bf17ee6513dd7b9a89fbeff9b76adef1ed')

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
  go build -o "build/${_name}" .

  for _sh in bash fish zsh powershell; do
    ./"build/${_name}" completion "${_sh}" > "completions/${_name}.${_sh}"
  done
}

# check() {
#  cd "${srcdir}/${_pkgsrc}"
#  go test ./...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_name}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  cd "completions"
  install -vDm644 "${_name}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_name}"
  install -vDm644 "${_name}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish"
  install -vDm644 "${_name}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
  install -vDm644 "${_name}.powershell" "${pkgdir}/usr/share/powershell/Modules/${_name}/${_name}.ps1"
}
