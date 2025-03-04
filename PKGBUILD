# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="koyeb"
pkgname="${_name}-cli"
pkgver=5.4.2
pkgrel=1
pkgdesc="Manage your Koyeb serverless infrastructure directly from your terminal"
arch=('aarch64' 'x86_64')
url="https://github.com/koyeb/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7c9ea6f65b9951999a44a3736518964f6b519bd81f1e91206609b3bfb67da81')

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
  go build -o "build/${_name}" ./"cmd/${_name}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_name}" completion "${_sh}" > "completions/${_name}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./... 
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${_name}" "${pkgdir}/usr/bin/${_name}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_name}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_name}"
  install -vDm644 "${_name}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish"
  install -vDm644 "${_name}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_name}"
  install -vDm644 "${_name}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_name}.ps1"
}
