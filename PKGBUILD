# Maintainer: Takeshi Shiroma <takeshix@adversec.com>

pkgname=deen-git
_pkgname=deen
_reponame=go-deen
pkgver=3.3.0.beta.r106.gcc108c4
pkgrel=1
pkgdesc='Data encoder, decoder, hasher, compressor and formatter with a Go/Fyne GUI'
arch=('x86_64' 'aarch64')
url='https://github.com/takeshixx/go-deen'
license=('Apache-2.0')
depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxfixes'
  'libxi'
  'libxinerama'
  'libxrandr'
)
makedepends=(
  'gcc'
  'git'
  'go'
  'pkgconf'
)
provides=('deen')
conflicts=('deen')
source=(
  "git+${url}.git"
  "${_pkgname}.desktop"
)
sha256sums=(
  'SKIP'
  '227de2e239a0d7dba03a4f0c8c1393357b134931a9fb4a5376808494e0a60d0f'
)

pkgver() {
  cd "${srcdir}/${_reponame}"

  git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_reponame}"

  export CGO_ENABLED=1
  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

  local version branch
  version="$(git describe --abbrev=0 --tags --always)"
  branch="$(git branch --show-current)"

  go build \
    -tags gui \
    -ldflags "-linkmode external -X github.com/takeshixx/deen/internal/core.version=${version} -X github.com/takeshixx/deen/internal/core.branch=${branch}" \
    -o "${_pkgname}" \
    ./cmd/deen
}

check() {
  cd "${srcdir}/${_reponame}"

  export GOPATH="${srcdir}/gopath"
  export GOCACHE="${srcdir}/gocache"
  export GOFLAGS='-mod=readonly -modcacherw'

  go test -timeout 20s -count=1 ./...
}

package() {
  cd "${srcdir}/${_reponame}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
