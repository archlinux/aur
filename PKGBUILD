# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="koyeb"
pkgname="${_name}-cli"
pkgver=5.7.0
pkgrel=1
pkgdesc="Manage your Koyeb serverless infrastructure directly from your terminal"
arch=('aarch64' 'x86_64')
url="https://github.com/koyeb/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
sha256sums=('2a305cd30bd6ae3b8fc6083ec32242cc6479ccaacb41c4ae61a6a1a0c31d5834')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build" "completions"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
  local BuildDate="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ")"

  go build -v -o "build/${_name}" -ldflags "\
    -X ${url#https://}/pkg/koyeb.BuildDate=${BuildDate} \
    -X ${url#https://}/pkg/koyeb.Version=${pkgver} \
    -X ${url#https://}/pkg/koyeb.Commit=$(git rev-parse HEAD 2>/dev/null || echo "unknown")" \
    ./"cmd/${_name}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_name}" --config='/dev/null' completion "${_sh}" > "completions/${_name}.${_sh}"
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
