# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Fredrik Strandin <fredrik@strandin.name>

_commit='b9550bf460e6429e2557d55fcfe206930d86d639'
pkgname=mop
pkgver=2021.11.29
pkgrel=1
pkgdesc='Stock market tracker for hackers'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/mop-tracker/mop'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
conflicts=('mop-git')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mop-tracker/${pkgname}/archive/${_commit}.tar.gz")
b2sums=('361562d17ca90539f30b454e4eec36aeb6bf6b51c3f82092435e14994ea18ada6dfa5974b07a10597f95de8ecfd30a3a9adde4ffb785a276c23c2709980f39a0')

build() {
  cd "${pkgname}-${_commit}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -X main.commit=${_commit} -extldflags ${LDFLAGS}"
  go build -o mop -ldflags="${_LDFLAGS}" "./cmd/..."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${_commit}/mop" \
    "${pkgdir}/usr/bin/mop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${_commit}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
