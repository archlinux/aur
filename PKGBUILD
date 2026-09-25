# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgbase="interactsh"
pkgname=(
  "${pkgbase}-common"
  "${pkgbase}-client"
  "${pkgbase}-server"
)
pkgver=1.4.0
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
b2sums=('4f991568cbcfced5bbf4e8cc5e1c01da0c6fd019c58f33101441f97697a98757e4c66809703cb96f3354d51e850122594255530bcf440627e0c73c7333d35904')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  # go mod verify
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
  install -vDm644 "README.md"  -t "${pkgdir}/usr/share/doc/${pkgbase}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgbase}"
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
