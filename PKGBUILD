# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Lukas Grossar <lukas.grossar@gmail.com>

pkgname=dyff
pkgver=1.11.4
pkgrel=1
pkgdesc="Diff tool for YAML files"
arch=(x86_64)
url="https://github.com/homeport/${pkgname}"
license=(MIT)
depends=(glibc)
makedepends=(go)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('5840e1bfc520d481b0566f50a2ea8f03f1a4d0037503620526fef36be3b4add1')

prepare() {
  cd ${pkgname}-${pkgver}
  mkdir -p build
  go mod download
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd ${pkgname}-${pkgver}
  go build -o build ./...
  build/dyff completion bash >dyff.bash
  build/dyff completion zsh >_dyff
  build/dyff completion fish >dyff.fish
}

check() {
  cd ${pkgname}-${pkgver}
  go test ./...
}

package() {
  cd ${pkgname}-${pkgver}
  install -Dv build/dyff -t "$pkgdir/usr/bin"
  install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dvm644 dyff.bash "$pkgdir/usr/share/bash-completion/completions/dyff"
  install -Dvm644 _dyff -t "$pkgdir/usr/share/zsh/site-functions/"
  install -Dvm644 dyff.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
