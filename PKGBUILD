# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="interactsh"
pkgname=("${pkgbase}"-{common,client,server})
pkgver=1.2.4
pkgrel=1
pkgdesc="OOB interaction gathering server and client library"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${pkgbase}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
b2sums=('03c50500704938a15a13009335d9a9d46b64364e5a66e8ae87a7f28f0555f1ca4722f4d36ae04b1843cca89be7dbb1421dc7e2b317c2eaa4612358d8fda0317e')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

  mkdir -p "build"
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
  for binary in "${pkgname[@]}"; do
    if [[ "${binary}" == "interactsh-common" ]]; then
      continue
    fi
    go build -v -o "build/${binary}" ./"cmd/${binary}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_interactsh-common() {
  pkgdesc+=" (${pkgname##*-})"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"
}

package_interactsh-client() {
  pkgdesc+=" (${pkgname##*-})"
  depends+=("${pkgbase}-common")
  optdepends=("${pkgbase}-server: server functionality")

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

package_interactsh-server() {
  pkgdesc+=" (${pkgname##*-})"
  depends+=("${pkgbase}-common")
  optdepends=("${pkgbase}-client: client functionality")

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
