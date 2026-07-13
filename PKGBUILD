# Maintainer alexvoste <alexvostedev@proton.me>
pkgname=forgezero-git
pkgver=5.3.0.r231.g9ddea99
pkgrel=1
pkgdesc="Zero-overhead build tool for assembly, C, C++, Objective-C, and Gloria"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/forgezero-cli/ForgeZero"
license=('GPL-3.0-only')
makedepends=('go' 'git')
source=("$pkgname::git+https://github.com/forgezero-cli/ForgeZero.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --always 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "0.0.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath"
  export SOURCE_DATE_EPOCH=$(git log -1 --pretty=%ct)
  
  local _ldflags=(
    "-X github.com/forgezero-cli/ForgeZero/cmd/fz/cli.BuildDate=$(date -d "@$SOURCE_DATE_EPOCH" +%Y-%m-%d)"
    "-X github.com/forgezero-cli/ForgeZero/cmd/fz/cli.VersionCore=v$(git describe --tags --always 2>/dev/null | sed 's/^v//')"
    "-s"
    "-w"
    "-extldflags=-Wl,--gc-sections"
  )
  
  go build -ldflags="${_ldflags[*]}" -o build/fz cmd/fz/main.go
}

check() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  go test ./...
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 build/fz "$pkgdir/usr/bin/fz"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  if [[ -d completions ]]; then
    [[ -f completions/fz.bash ]] && install -Dm644 completions/fz.bash "$pkgdir/usr/share/bash-completion/completions/fz"
    [[ -f completions/fz.zsh ]] && install -Dm644 completions/fz.zsh "$pkgdir/usr/share/zsh/site-functions/_fz"
    [[ -f completions/fz.fish ]] && install -Dm644 completions/fz.fish "$pkgdir/usr/share/fish/vendor_completions.d/fz.fish"
  fi
}