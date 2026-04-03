# Maintainer: zhzy0077 <zhzy0077@hotmail.com>
pkgname=intuneme
pkgver=0.16.0
pkgrel=2
pkgdesc="Run Microsoft Intune on an immutable Linux host (systemd-nspawn container)"
arch=('x86_64')
url="https://github.com/frostyard/intuneme"
license=('MIT')
depends=('systemd' 'polkit' 'dbus')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/frostyard/intuneme/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('99e3d02f52f22202c1b289ff40364c64b2dae0c76f8d9e6fe9567ca79812bac6')

prepare() {
  cd "$pkgname-$pkgver"
  mkdir -p build/completions build/manpages
}

build() {
  cd "$pkgname-$pkgver"
  
  # Arch Linux Go Packaging Guidelines:
  # Use system flags for hardening and PIE support
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  
  # Handle reproducible builds via SOURCE_DATE_EPOCH
  local _date
  if [[ -n "$SOURCE_DATE_EPOCH" ]]; then
    _date=$(date -d "@$SOURCE_DATE_EPOCH" -u +%Y-%m-%dT%H:%M:%SZ)
  else
    _date=$(date -u +%Y-%m-%dT%H:%M:%SZ)
  fi

  # Build with external linking for full hardening (PIE)
  # Removed -s -w to allow makepkg to handle debug symbols/stripping
  go build \
    -ldflags "-linkmode=external -X main.version=$pkgver -X main.commit=none -X main.date=$_date -X main.builtBy=archlinux" \
    -o "$pkgname" .

  # Generate shell completions using the built binary
  ./"$pkgname" completion bash > build/completions/"$pkgname".bash
  ./"$pkgname" completion zsh > build/completions/_"$pkgname"
  ./"$pkgname" completion fish > build/completions/"$pkgname".fish

  # Generate manpage
  ./"$pkgname" man > build/manpages/"$pkgname".1
}

check() {
  cd "$pkgname-$pkgver"
  go test ./...
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install Shell Completions
  install -Dm644 build/completions/"$pkgname".bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -Dm644 build/completions/_"$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -Dm644 build/completions/"$pkgname".fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  # Install Manpage
  install -Dm644 build/manpages/"$pkgname".1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
