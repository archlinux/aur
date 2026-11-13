# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

pkgname=freehire-cli
pkgver=0.30.0
pkgrel=1
pkgdesc='CLI over the freehire job API for agents'
arch=('x86_64' 'aarch64')
url='https://github.com/strelov1/freehire-cli'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "disable-self-update.patch")
sha256sums=('1bf5ecd87224faf77d0940acd68dc83100c9ab43705c6bf620b67cf8d56291e9'
            '864a3c11939dfcd48fbe994d3771aa2a4f9d3e7332daa2e92b53fe02de212087')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -Np1 -i ../disable-self-update.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local cli=github.com/strelov1/freehire-cli/internal/cli
  local update_hint="installed from the AUR package ${pkgname}, update it with your AUR helper (e.g. paru or yay)"
  go build \
    -ldflags "-compressdwarf=false -linkmode external -X ${cli}.Version=v${pkgver} -X '${cli}.UpdateDisabled=${update_hint}'" \
    -o freehire ./cmd/freehire
}

check() {
  cd "${pkgname}-${pkgver}"

  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 freehire "${pkgdir}/usr/bin/freehire"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
