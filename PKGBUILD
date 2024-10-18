# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="kubectl-dba"
pkgver=0.48.1
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://kubedb.com"
_url="https://github.com/kubedb/cli"
license=('custom:AppsCode-Community-1.0.0')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
sha256sums=('a7402e0e392584d0fbcc468e4385939527bfdd68cf35af1175cdd1c13d1f2e00'
            '98112798ec6560d74223511ed367c2c170a63e5cdf5855dd444009cb3c80b07c')

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
    -X main.Version=${pkgver} \
    -X main.VersionStrategy=tag \
    -X main.GitTag=$(git describe --exact-match --abbrev=0 2>/dev/null || echo '') \
    -X main.GitBranch=$(git rev-parse --abbrev-ref HEAD) \
    -X main.CommitHash=$(git rev-parse --verify HEAD) \
    -X main.CommitTimestamp=$(date --date="@$$(git show -s --format=%ct)" --utc +%FT%T) \
    -X main.GoVersion=$(go version | cut -d " " -f 3) \
    -X main.Compiler=$(go env CC) \
    -X main.Platform=$(go env GOOS)/$(go env GOARCH)" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  cd "${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
