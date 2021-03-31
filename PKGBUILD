#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.27.0
pkgrel=1
pkgdesc="Toolkit for swagger in golang (go-swagger)"
arch=('x86_64' 'i686' 'aarch64' 'armv6h' 'armv7h')
groups=('swagger')
provides=('swagger')
conflicts=('swagger')
url="https://goswagger.io"
license=('Apache')
depends=('glibc')
makedepends=('git' 'go' 'gzip' 'tar')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/go-swagger/go-swagger/archive/v${pkgver}.tar.gz")
sha256sums=('1ec5a44ae8bb9ffafd02a9c7b1df5a8a43c2296dece02bb8fab6f13f70007f4f')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  local commit_id
  local goldflags

  commit_id=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)

  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1

  goldflags="-X github.com/go-swagger/go-swagger/cmd/swagger/commands.Commit=${commit_id}"
  goldflags="$goldflags -X github.com/go-swagger/go-swagger/cmd/swagger/commands.Version=${pkgver}"
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "$goldflags -extldflags \"${LDFLAGS}\"" \
    ./cmd/swagger
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 swagger -t "${pkgdir}/usr/bin"
  install -Dm644 cmd/swagger/completion/swagger.bash-completion -T "${pkgdir}/usr/share/bash-completion/completions/swagger"
  install -Dm644 cmd/swagger/completion/swagger.zsh-completion -T "${pkgdir}/usr/share/zsh/site-functions/_swagger"
}
