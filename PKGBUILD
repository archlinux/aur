pkgname=diom-cli
pkgver=0.2.0
pkgrel=1
pkgdesc='The Diom CLI (components platform)'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://diom.svix.com"
license=('MIT')
makedepends=(cargo)
# Disabling LTO due to https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/20
options=(!lto)
source=("https://github.com/svix/diom/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f91bd444d7147747cfb7cddebc940b0f2f9faf1c12a411072f081b89cfffba6')

srcpkgdir="diom-$pkgver/z-clients/cli"

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
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/diom"

  # Syntax highlighting
  "$pkgdir"/usr/bin/diom completion bash > bash-diom
  install -D bash-diom "$pkgdir"/etc/bash_completion.d/diom
  "$pkgdir"/usr/bin/diom completion zsh > zsh-diom
  install -D zsh-diom "$pkgdir"/usr/share/zsh/site-functions/_diom
}
