# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=authzed-zed
pkgver=1.2.1
pkgrel=1
pkgdesc="Official command-line tool for managing SpiceDB"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/authzed/zed"
license=('Apache-2.0')
depends=()
makedepends=(git go)
optdepends=(bash-completion)
provides=("$pkgname")
validpgpkeys=(968479a1aff927e37d1a566bb5690eeebb952194)
source=("git+https://github.com/authzed/zed.git#commit=3ed81d1ca8301affa051a13b6a87a216b499ea7e")
sha256sums=('aa40b35555cbfee5b8ab3bed9489b3ec8f0ff5878ffbf6c974f57e79888d1a6a')
_binname="zed"

build() {
  cd "$srcdir/zed"
  export CGO_ENABLED=0
  # compare with: https://github.com/authzed/zed/blob/main/.goreleaser.yml
  go build -trimpath -ldflags "-s -w -X github.com/jzelinskie/cobrautil/v2.Version=v${pkgver}" -o "$_binname" "./cmd/$_binname"
  "./$_binname" completion bash > bash-completion.sh
  "./$_binname" completion fish > fish-completion.fish
  "./$_binname" completion zsh > zsh-completion.zsh
}

package() {
  install -D -m755 "$srcdir/zed/$_binname" "$pkgdir/usr/bin/$_binname"

  local bash_completions_dir="$pkgdir/usr/share/bash-completion/completions"
  install -D -d -m755 "$bash_completions_dir" 
  install -m644 "$srcdir/zed/bash-completion.sh" "$bash_completions_dir/$_binname" 

  local zsh_completions_dir="$pkgdir/usr/share/zsh/site-functions/"
  install -D -d -m755 "$zsh_completions_dir" 
  install -m644 "$srcdir/zed/zsh-completion.zsh" "$zsh_completions_dir/_$_binname" 

  local fish_completions_dir="$pkgdir/usr/share/fish/vendor_completions.d"
  install -D -d -m755 "$fish_completions_dir" 
  install -m644 "$srcdir/zed/fish-completion.fish" "$fish_completions_dir/$_binname.fish" 
}

