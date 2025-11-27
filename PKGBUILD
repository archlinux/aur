# Maintainer: Henil <henil2911 + aur at gmail <.> com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=zellij-git
_pkgname=zellij
pkgver=0.40.1.r33.gabe0f87
pkgrel=1
pkgdesc="A terminal multiplexer"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://zellij.dev"
_url="https://www.github.com/$_pkgname-org/$_pkgname"
license=('MIT')
depends=(curl libcurl.so
         gcc-libs
         glibc)
makedepends=(cargo
             git
             mandown)
provides=("zellij=$pkgver")
conflicts=('zellij')
source=("git+$_url.git")
sha256sums=('SKIP')
options=(!lto)

prepare() {
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 --match="v*" HEAD |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
  ./target/release/zellij setup --generate-completion bash > target/zellij.bash
  ./target/release/zellij setup --generate-completion elvish > target/zellij.elv
  ./target/release/zellij setup --generate-completion fish > target/zellij.fish
  ./target/release/zellij setup --generate-completion zsh > target/zellij.zsh
  mandown docs/MANPAGE.md > assets/zellij.1
}

package() {
  cd "$_pkgname"
  install -Dm755 target/release/zellij -t "${pkgdir}/usr/bin"
  install -Dm644 GOVERNANCE.md README.md -t "${pkgdir}/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -Dm644 target/zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm644 target/zellij.elv "${pkgdir}/usr/share/elvish/lib/zellij.elv"
  install -Dm644 target/zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm644 target/zellij.zsh "${pkgdir}/usr/share/zsh/site-functions/_zellij"
  install -Dm644 assets/zellij.1 "${pkgdir}/usr/share/man/man1/zellij.1"
  install -Dm644 assets/zellij.desktop "${pkgdir}/usr/share/applications/zellij.desktop"
  install -Dm644 assets/logo.png "${pkgdir}/usr/share/pixmaps/zellij.png"
}
