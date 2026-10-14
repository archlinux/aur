# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=spicedb
pkgver=1.56.2
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
source=("git+https://github.com/authzed/spicedb.git#commit=be3e1ef65427df44adf26bd01f54d4f0c5312893")
sha256sums=('4ea5b91f1c93492383f1a66fa6d3a157639a1454a8b87f629bea3446dd8698d3')

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

