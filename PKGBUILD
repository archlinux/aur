pkgname=svix-cli
pkgver=1.64.0
pkgrel=1
pkgdesc='The Svix CLI (webhooks as a service)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.svix.com"
license=('MIT')
makedepends=(cargo)
# Disabling LTO due to https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)
source=("https://github.com/svix/svix-webhooks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f6c5c38c2d200899c817b37a39910fa4132f835d0dfcb49d54f6ac78357944d')

srcpkgdir="svix-webhooks-$pkgver/$pkgname"

prepare() {
  cd $srcpkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $srcpkgdir
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd $srcpkgdir
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd $srcpkgdir
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/svix"

  # Syntax highlighting
  "$pkgdir"/usr/bin/svix completion bash > bash-svix
  install -D bash-svix "$pkgdir"/etc/bash_completion.d/svix
  "$pkgdir"/usr/bin/svix completion zsh > zsh-svix
  install -D zsh-svix "$pkgdir"/usr/share/zsh/site-functions/_svix
}
