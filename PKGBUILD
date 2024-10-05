# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kubectl-dba"
pkgname="${_pkgname}-git"
pkgver=0.48.0.r0.g6d82a89
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
arch=('x86_64' 'aarch64')
url="https://kubedb.com"
_url="https://github.com/kubedb/cli"
license=('custom:AppsCode-Community-1.0.0')
makedepends=('git' 'go')
depends=('glibc')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${_url}.git"
        "LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md")
sha256sums=('SKIP'
            '98112798ec6560d74223511ed367c2c170a63e5cdf5855dd444009cb3c80b07c')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  go build -v -o "build/${_pkgname}" -ldflags "\
    -X main.Version=${pkgver%%.r*} \
    -X main.VersionStrategy=tag \
    -X main.GitTag=$(git describe --exact-match --abbrev=0 2>/dev/null || echo '') \
    -X main.GitBranch=$(git rev-parse --abbrev-ref HEAD) \
    -X main.CommitHash=$(git rev-parse --verify HEAD) \
    -X main.CommitTimestamp=$(date --date="@$$(git show -s --format=%ct)" --utc +%FT%T) \
    -X main.GoVersion=$(go version | cut -d " " -f 3) \
    -X main.Compiler=$(go env CC) \
    -X main.Platform=$(go env GOOS)/$(go env GOARCH)" \
    ./"cmd/${_pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"

  cd "${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
