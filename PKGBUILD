# Maintainer: Vladimir Bauer <vbauerster at gmail dot com>
pkgname=getparty
pkgdesc='HTTP download manager with multi-parts'
pkgver=1.23.2
pkgrel=1
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/vbauerster/getparty'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c350d5ac327b094724ce005f60e410114deddd1ba4cd04549e3662a996303726')

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

  go build -C "${pkgname}-${pkgver}/cmd/${pkgname}" -ldflags="${_flags[*]}"
}

package() {
  local _srcdir="${pkgname}-${pkgver}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_srcdir}/cmd/${pkgname}/${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${_srcdir}/LICENSE"
}
