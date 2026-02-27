# Maintainer: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034
# shellcheck disable=SC2154
pkgname=gochecker
pkgver=0.0.2
pkgrel=1
pkgdesc="Version checker for software releases written in go."
arch=("x86_64")
url="https://github.com/cilginc/gochecker"
license=("GPL-3.0")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('3cedeae2c1186de63ee4cf5fd54974656f52bc6b0f54da07382f78d4289d2ec7fa8ac8086764974df1ae010d95c0ec0c1a9baffbc5de23d6047df755a19f221a')
provides=("gochecker")
conflicts=("gochecker")

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
