# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgbase=surge-cli
pkgname=surge
pkgver=0.12.2
pkgrel=1
pkgdesc="Surge is a blazing fast, open-source terminal (TUI) download manager built in Go"
arch=("x86_64")
url="https://github.com/surge-downloader/surge"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('ba95c71d9e392b87bc5df1c84227700f24ddd3718a9bac28edce2601cad51d2b4fa78930536ad1349995f7f2e7be2351949199b94ab15779caf0ecadc51f6c6c')

provides=("surge")
conflicts=("surge")

prepare() {
  cd "Surge-$pkgver" || exit
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "Surge-$pkgver" || exit
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  local ld_flags="-linkmode=external -compressdwarf=false"
  go build -ldflags="$ld_flags" -o ${pkgname}
}

package() {
  cd "Surge-$pkgver" || exit
  install -Dm755 ${pkgname} -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ./${pkgname} completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  ./${pkgname} completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
  ./${pkgname} completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
