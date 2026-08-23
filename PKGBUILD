# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="containerlab"
pkgver=0.79.0
pkgrel=1
pkgdesc="Container-based networking labs"
arch=(
  'aarch64'
  'x86_64'
)
url="https://containerlab.dev"
_url="https://github.com/srl-labs/${pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
)
makedepends=(
  'go'
  'git'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=v${pkgver}"
  "${pkgname}.sysusers"
)
b2sums=('1229cb85463c981f6e356b66668a69069ebc60770edbd48d8172317408048ed2720c6590c9febf5e8199abb6e634a17c579743c36229560376b781c77a7853cc'
        '7b0465b94085ad1a63e7a9a7fcf5598c68dd847de4151197fa850032bb4a1265575c8f08c66318fe062bea70a67465e8547a2f941bb628f1a6bf6bb4958540e4')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  # go mod verify

  mkdir -p "completions"
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
  local build_commit="$(git rev-parse --short HEAD)"
  local build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +"%Y-%m-%dT%H:%M:%SZ")"

  go build -v -o "build/${pkgname}" -ldflags "\
    -X ${_url#https://}/cmd.Version=${pkgver} \
    -X ${_url#https://}/cmd.commit=${build_commit} \
    -X ${_url#https://}/cmd.date=${build_date}" \
    .

  for _sh in bash fish zsh; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test ./...
# }

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

  cd "${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  find "lab-examples" -type f ! -name '.gitignore' -exec \
    install -Dm644 "{}" "${pkgdir}/usr/share/doc/${pkgname}/{}" \;

  cd "completions"
  install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -vDm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -vDm644 "${pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

  ln -vsf "${pkgname}" "${pkgdir}/usr/bin/clab"
}
