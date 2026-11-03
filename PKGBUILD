# Maintainer: Rocket Aaron <rocka@archlinuxcn.org>

pkgname=git-pages
pkgver=0.10.1
pkgrel=1
pkgdesc='Scalable static site server for Git forges'
url='https://codeberg.org/git-pages/git-pages'
arch=(x86_64)
license=(0BSD)
depends=(glibc)
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'git-pages.service')
sha256sums=('667b141c7865a416c790bdddeb545072bfd857b78fb7df4e85bdee4385bbc1f9'
            'e44ad5aa362efce9454f88356fdddac9336dcacb6ef64f5e0efd8578d37e8003')

prepare() {
  cd "${pkgname}"
  # create directory for build output
  mkdir build
  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "${pkgname}"
  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"
  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -s -w -buildid='' \
    -extldflags '${LDFLAGS}' \
    -X main.versionOverride=v$pkgver" \
    -o build/git-pages
}

package() {
  cd "${pkgname}"
  install -vDm755 -t "${pkgdir}/usr/bin" build/git-pages
  install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/git-pages.service"
  install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
