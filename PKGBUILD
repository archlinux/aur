#Maintainer Ivan Porto Carrero <ivan@flanders.co.nz> (@casualjim)
pkgname=go-swagger
pkgver=0.24.0
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
sha256sums=('463cac52dffc606add5724e76614e2d8432094d43c34e6d5161caa846f33536f')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  local commit_id
  local ldflags

  commit_id=$(zcat ${pkgname}-${pkgver}.tar.gz | git get-tar-commit-id)

  cd "${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export GOFLAGS='-buildmode=pie -trimpath -modcacherw -mod=readonly'

  ldflags="-X github.com/go-swagger/go-swagger/cmd/swagger/commands.Commit=${commit_id}"
  ldflags="$ldflags -X github.com/go-swagger/go-swagger/cmd/swagger/commands.Version=${pkgver}"
  go build -ldflags="$ldflags"  ./cmd/swagger
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 swagger -t "${pkgdir}/usr/bin"
  install -Dm644 cmd/swagger/completion/swagger.bash-completion -T "${pkgdir}/usr/share/bash-completion/completions/swagger"
  install -Dm644 cmd/swagger/completion/swagger.zsh-completion -T "${pkgdir}/usr/share/zsh/site-functions/_swagger"
}
