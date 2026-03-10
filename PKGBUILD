# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="interactsh"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}-client"
  "${pkgbase}-server"
)
pkgver=1.3.1
pkgrel=1
pkgdesc="OOB interaction gathering server and client library"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/projectdiscovery/${pkgbase}"
license=(
  'MIT'
)
makedepends=(
  'git'
  'go'
)
_pkgsrc="${url##*/}"
source=(
  "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
)
b2sums=('6a856b98dd6c7716168b7bed76f8aa98d45e044f5f3e9c4775610d5a363a014590c31d7d317f1bc479b88d61bd603f15f8709b4a7c25f35a5645748c4d5a27a0')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
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
  go build -v -o "build/${pkgbase}-client" ./"cmd/${pkgbase}-client"
  go build -v -o "build/${pkgbase}-server" ./"cmd/${pkgbase}-server"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package_interactsh-common() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"
}

package_interactsh-client() {
  pkgdesc+=" (${pkgname##*-})"
  depends+=(
    "${pkgbase}-common>=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

package_interactsh-server() {
  pkgdesc+=" (${pkgname##*-})"
  depends+=(
    "${pkgbase}-common>=${pkgver}"
    'glibc'
  )

  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
