# Maintainer: aur.chaotic.cx
# Contributor: Filipe Nascimento <flipee at tuta dot io>

_pkgname="qrcp"
pkgname="$_pkgname"
pkgver=0.11.7
pkgrel=1
pkgdesc="Transfer files over WiFi from computer to mobile by scanning a QR code at the terminal"
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

makedepends=('go')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('e3dcc23b85e2f37f378cf95b41a7a7c2ee5cd9941e3935a3325e3a0c8c770a06')

build() {
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local _go_ldflags=(
    -X github.com/claudiodangelis/qrcp/version.version=$pkgver
    -X github.com/claudiodangelis/qrcp/version.date=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)
  )

  cd "$_pkgsrc"
  go build -ldflags="${_go_ldflags[*]}"

  ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
  ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
  ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
  cd "$_pkgsrc"
  install -Dm755 qrcp -t "$pkgdir/usr/bin"
  cp -r share/ "$pkgdir/usr"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
