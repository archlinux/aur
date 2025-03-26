# Maintainer:
# Contributor: Filipe Nascimento <flipee at tuta dot io>

_pkgname="qrcp"
pkgname="$_pkgname"
pkgver=0.11.6
pkgrel=2
pkgdesc="Transfer files over WiFi from computer to mobile by scanning a QR code at the terminal"
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')

depends=('glibc')
makedepends=('go')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('a3eff505f366713fcb7694e0e292ff2da05e270f9539b6a8561c4cf267ec23c8')

build() {
  cd "$_pkgsrc"

  local _go_ldflags=(
    -linkmode=external
    -X github.com/claudiodangelis/qrcp/version.version=$pkgver
    -X github.com/claudiodangelis/qrcp/version.date=$(date -d@"$SOURCE_DATE_EPOCH" +%Y-%m-%dT%H:%M:%SZ)
  )

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

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
