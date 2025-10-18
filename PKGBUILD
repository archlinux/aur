# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=spicedb
pkgver=1.46.0
pkgrel=1
pkgdesc="Open Source, Google Zanzibar-inspired database for scalably storing and querying fine-grained authorization data"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/authzed/$pkgname"
license=('Apache-2.0')
depends=()
makedepends=(git go)
optdepends=()
provides=("$pkgname")
validpgpkeys=(968479a1aff927e37d1a566bb5690eeebb952194)
source=("git+https://github.com/authzed/spicedb.git#commit=5d778d4e70a3a908395b8a75a01443552811a9e9")
sha256sums=('006d2a142ce4aaa3fe1f511224cbfa281f37fc20942d606860c0dc49a1648651')

build() {
  cd "$srcdir/$pkgname"
  export CGO_ENABLED=0
  # compare with: https://github.com/authzed/spicedb/blob/main/.goreleaser.yml
  go build -trimpath -ldflags "-s -w -X github.com/jzelinskie/cobrautil/v2.Version=v${pkgver}" -o "$pkgname" -v -o "$pkgname" "./cmd/$pkgname"
  "./$pkgname" completion bash > bash-completion.sh
  "./$pkgname" completion fish > fish-completion.fish
  "./$pkgname" completion zsh > zsh-completion.zsh
}

package() {
  install -D -m755 "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

  local bash_completions_dir="$pkgdir/usr/share/bash-completion/completions"
  install -D -d -m755 "$bash_completions_dir"
  install -m644 "$srcdir/$pkgname/bash-completion.sh" "$bash_completions_dir/$pkgname"

  local zsh_completions_dir="$pkgdir/usr/share/zsh/site-functions/"
  install -D -d -m755 "$zsh_completions_dir"
  install -m644 "$srcdir/$pkgname/zsh-completion.zsh" "$zsh_completions_dir/_$pkgname"

  local fish_completions_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -D -d -m755 "$fish_completions_dir"
  install -m644 "$srcdir/$pkgname/fish-completion.fish" "$fish_completions_dir/$pkgname.fish"
}

