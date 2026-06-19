# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: dougEfresh <dchimento@gmail.com>

pkgname="github-mcp-server"
pkgver=1.4.0
pkgrel=1
pkgdesc="GitHub's official MCP server which connects AI tools directly to GitHub's platform"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/github/${pkgname}"
license=(
  'MIT'
)
depends=(
  'glibc'
)
makedepends=(
  # 'git'
  'go'
  'jq'
)
# _pkgsrc="${url##*/}"
_pkgsrc="${url##*/}-${pkgver}"
source=(
  # "${_pkgsrc}::git+${url}.git#tag=v${pkgver}"
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${_pkgsrc}.github.json::https://api.github.com/repos/github/${pkgname}/commits/v${pkgver}"
)
sha256sums=('1cf05d7ffa73e43e7d35cbee0dbafcc3722d451926e4cb87c231acbd6a943c40'
            'a295555f5e5bbe8245abdb95e93fe30773d66e4f0f6c0e66bba32bcf8e5448fe')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -modcacherw -x
  go mod verify
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
  go build -v -o "build/${pkgname}" -ldflags "\
    -X main.version=${pkgver} \
    -X main.commit=$(jq .sha ${srcdir}/${_pkgsrc}.github.json -r) \
    -X main.date=$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" '+%Y-%m-%dT%H:%M:%SZ')" \
    ./"cmd/${pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
