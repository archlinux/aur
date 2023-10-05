# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=tbls
pkgver=1.69.2
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
arch=(x86_64)
url="https://github.com/k1LoW/tbls"
license=(MIT)
makedepends=(go)
depends=(glibc)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f3a4f3aab5b07afa5b30166cc5020b547576a9d119ea93d7172c0357510464cb')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS} -Wno-format-security -Wno-error=format-security"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -v

  ./tbls completion bash > tbls.bash
  ./tbls completion fish > tbls.fish
  ./tbls completion zsh > tbls.zsh
}

check() {
  cd "$_archive"

  go test \
    ./cmdutil/... \
    ./config/... \
    ./coverage/... \
    ./ddl/... \
    ./dict/... \
    ./drivers/bq/... \
    ./drivers/spanner/... \
    ./output/... \
    ./output/config/... \
    ./output/dot/... \
    ./output/gviz/... \
    ./output/json/... \
    ./output/md/... \
    ./output/mermaid/... \
    ./output/plantuml/... \
    ./output/yaml/... \
    ./schema/...
}

package() {
  cd "$_archive"

  install -Dm755 tbls "${pkgdir}/usr/bin/tbls"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 tbls.bash "$pkgdir/usr/share/bash-completion/completions/tbls"
  install -Dm644 tbls.fish "$pkgdir/usr/share/fish/vendor_completions.d/tbls.fish"
  install -Dm644 tbls.zsh "$pkgdir/usr/share/zsh/site-functions/_tbls"
}
