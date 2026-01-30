# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="interactsh"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}-client"
  "${pkgbase}-server"
)
pkgver=1.3.0
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
b2sums=('a8d7587c698e514b56570f4eea58033082e063411926a8e0294be64ffb528a1f97e455aab9b42672a283b1434b90002b7a51bded9a1446d187c17d6472616e27')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x

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
