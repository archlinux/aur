# Maintainer: torculus <20175597+torculus@users.noreply.github.com>
# Contributor: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgbase=surge-cli
pkgname=surge
pkgver=0.12.0
pkgrel=1
pkgdesc="Surge is a blazing fast, open-source terminal (TUI) download manager built in Go"
arch=("x86_64")
url="https://github.com/surge-downloader/surge"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('f56a4e47fe7f3998d01ce57dab321e7d02a15909edd858ca7f7eccfa5341f84cd66fada7375e80244165a5b781839954a97e303c9b748ec84cc46f3417968522')

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
