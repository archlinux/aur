# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=git-sizer
pkgver=1.4.0
pkgrel=1
pkgdesc='Compute various size metrics for a Git repository, flagging those that might cause problems'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/github/git-sizer'
license=('MIT')
depends=('git')
makedepends=('go')
source=("https://github.com/github/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5dafc4014d6bfae40e678d72c0a67a29cd9ac7b38a0894fc75ab8c05a9064a4b')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.BuildVersion=${pkgver} -extldflags ${LDFLAGS}"
  go build -o git-sizer -ldflags="${_LDFLAGS}" git-sizer.go
}

package() {
  cd "${pkgname}-${pkgver}"
  # binary
  install -D -m755 git-sizer "${pkgdir}/usr/bin/git-sizer"
  # doc files
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
