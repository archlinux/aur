# Maintainer: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgbase=surge-cli
pkgname=surge
pkgver=0.7.0
pkgrel=1
pkgdesc="Surge is a blazing fast, open-source terminal (TUI) download manager built in Go"
arch=("x86_64")
url="https://github.com/surge-downloader/surge"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2ba8277809764f664246fd0fcde91af41a672aacf068d93b3a01529b9d3874f1b5aadaa559d5d9f9c36b4dcb3b546f67cc76c106372d62480e128ac187be86bb')
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

  ./${pkgname} completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  ./${pkgname} completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
  ./${pkgname} completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
