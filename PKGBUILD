# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_builders=(
  "slsa-builder-docker"
  "slsa-builder-go"
)
_generators=(
  "slsa-generator-container"
  "slsa-generator-generic"
)
_binname=(
  "${_builders[@]}"
  "${_generators[@]}"
)
pkgbase="slsa-github-generator"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-common"
  "${_binname[@]}"
)
pkgver=2.1.0
pkgrel=3
pkgdesc="Language-agnostic SLSA provenance generation for Github Actions"
arch=('x86_64')
url="https://github.com/slsa-framework/${pkgbase}"
license=('Apache-2.0')
makedepends=(
  'git'
  'go'
)
_pkgsrc="${pkgbase}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
sha256sums=('6a6c6b33364e6bd0ff8af4887e4a79a9a8aeef67fdf6850fa862b16658dcaef7')

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
  for _builder in "${_builders[@]}"; do
    go build -v -o ./"build/${_builder}" -ldflags "\
      -X ${url#https://}/version.Version=${pkgver}" \
      ./"internal/builders/${_builder#slsa-builder-}"
  done
  for _generator in "${_generators[@]}"; do
    go build -v -o ./"build/${_generator}" -ldflags "\
      -X ${url#https://}/version.Version=${pkgver}" \
      ./"internal/builders/${_generator#slsa-generator-}"
  done

  for _name in "${_binname[@]}"; do
    if [[ $_name != "slsa-builder-go" ]]; then
      for _sh in bash fish powershell zsh; do
      ./"build/${_name}" completion "${_sh}" > "completions/${_name}.${_sh}"
      done
    fi
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_slsa-github-generator() {
  pkgdesc+=" (meta)"
  arch=('any')
  depends=(
    "${_binname[@]/%/"=${pkgver}-${pkgrel}"}"
  )
}

package_slsa-github-generator-common() {
  pkgdesc+=" (common files)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgbase}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}

for _name in "${_binname[@]}"; do
  eval "
package_${_name}() {
  pkgdesc+=' (${_name##*-} target)'
  url+='/tree/main/internal/builders/${_name##*-}'
  depends+=(
    '${pkgbase}-common=${pkgver}-${pkgrel}'
    'glibc'
  )
  
  cd \"\${srcdir}/${_pkgsrc}\"
  install -vDm755 'build/${_name}' \"\${pkgdir}/usr/bin/${_name}\"

  if [[ '${_name}' != 'slsa-builder-go' ]]; then
    cd 'completions'
    install -vDm644 '${_name}.bash'       \"\${pkgdir}/usr/share/bash-completion/completions/${_name}\"
    install -vDm644 '${_name}.fish'       \"\${pkgdir}/usr/share/fish/vendor_completions.d/${_name}.fish\"
    install -vDm644 '${_name}.powershell' \"\${pkgdir}/usr/share/powershell/Completions/${_name}.ps1\"
    install -vDm644 '${_name}.zsh'        \"\${pkgdir}/usr/share/zsh/site-functions/_${_name}\"
  fi
}"
done
