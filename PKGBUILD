# Maintainer: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgbase=surge-cli
pkgname=surge
pkgver=0.5.5
pkgrel=1
pkgdesc="Surge is a blazing fast, open-source terminal (TUI) download manager built in Go"
arch=("x86_64")
url="https://github.com/surge-downloader/surge"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('26f7849e5458bff8aef56dc9cb443711bfc50e291fabe45e24a735f5a6731dd3ca631f740ffcf548521c00839738be094353f896ceb66546c9cc694f50d4615e')
options=(!strip)
provides=("surge")
conflicts=("surge")

prepare() {
  cd "$pkgname-$pkgver" || exit
  GOFLAGS="-mod=readonly" go mod vendor -v
}

build() {
  cd "$pkgname-$pkgver" || exit
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
  local ld_flags="-linkmode=external -compressdwarf=false"
  go build -ldflags="$ld_flags" -o ${pkgname}
}

package() {
  cd "$pkgname-$pkgver" || exit
  install -Dm755 ${pkgname} -t "$pkgdir/usr/bin"

  ./${pkgname} completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/${pkgname}"
  ./${pkgname} completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_${pkgname}"
  ./${pkgname} completion fish | install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
