# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>
pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.22.0
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/vbauerster/getparty'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ada1abc13d93a25efea1584387d9e602c9f6430158be6014e1b9b0689aeea84')

build() {
  local _commit _flags
  _commit=$(bsdcat "v${pkgver}.tar.gz" | git get-tar-commit-id)
  _flags=(
    -X=main.version="$pkgver"
    -X=main.commit="${_commit::7}"
    -linkmode=external
  )
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw'

  cd "${pkgname}-${pkgver}/cmd/${pkgname}"
  go build -ldflags="${_flags[*]}"
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "cmd/$pkgname/$pkgname" -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/"$pkgname"
}
