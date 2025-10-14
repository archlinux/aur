# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="fga"
pkgver=0.7.5
pkgrel=1
pkgdesc="Cross-platform CLI to interact with an OpenFGA server"
arch=('aarch64' 'i686' 'x86_64')
url="https://openfga.dev"
_url="https://github.com/openfga/cli"
license=('Apache-2.0')
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${pkgname}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}?signed")
b2sums=('48e3498872c067c8a2bf4632e1453c0d73ba25151c25d29576f44a72cf7d7e2efe58e60a435069d0ddd2938b0d880c83de259494374d552dd3feada1e1ca7749')
validpgpkeys=('510C64A6CDC3F0965291ED872E31AD2F054526F0') # Raghd Hamzeh <raghd.hamzeh@openfga.dev> (https://github.com/rhamzeh.gpg)

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build" "completions" "manpages"
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
  local build_commit="$(git rev-parse HEAD)"
  local build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ")"

  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/internal/build.Version=${pkgver}
    -X ${_url#https://}/internal/build.Commit=${build_commit}
    -X ${_url#https://}/internal/build.Date=${build_date}" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
  ./"build/${pkgname}" man > "manpages/${pkgname}.1"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "manpages" -type f -name '*.1' -execdir \
    install -vDm644 "{}" "${pkgdir}/usr/share/man/man1/{}" \;

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -vDm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
