# Maintainer: JW (replace "jjj" with "j" in email) <jjj101r@outlook.com>
# Contributor: Vasili Novikov (replace "vvv" with "v" in email) vvvasya.novikov+cm3513git@gmail.com
pkgname=rua-fork
pkgver=0.20.0
pkgrel=1
pkgdesc='Opinionated fork of rua, an AUR helper written in Rust that provides control, review, patch application, and safe build options'
url='https://github.com/J101R/rua'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/J101R/rua/archive/v${pkgver}.tar.gz")
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPL3')

makedepends=('cargo' 'libseccomp' 'sed')
depends=('bubblewrap' 'git' 'pacman' 'xz')
optdepends=(
  'bubblewrap-suid: version of bubblewrap that works on linux-hardened kernel'
  'shellcheck: allows checking PKGBUILD scripts, taking care of special variables'
  'sudo: allows package installation via sudo, if desired'
)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})

# Depending on the environment Rust packages may fail to build with LTO,
# see https://aur.archlinux.org/packages/rua#comment-861014
options=('!lto')

sha256sums=(f614093cdd694aab28fcaf5c5f3567dfa994c2d973d4688bdf0c436a43ad59af)

#options+=(!strip)  # uncomment if you want readable stack traces

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build () {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p target/completions

  # RUSTUP_TOOLCHAIN is specified in project's .rust-toolchain.toml
  COMPLETIONS_DIR=target/completions \
    CARGO_TARGET_DIR=target \
    cargo build --frozen --release
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo test --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0755 target/release/rua "${pkgdir}/usr/bin/rua"

  install -Dm0644 target/completions/rua.bash "${pkgdir}/usr/share/bash-completion/completions/rua.bash"
  install -Dm0644 target/completions/rua.fish "${pkgdir}/usr/share/fish/completions/rua.fish"
  install -Dm0644 target/completions/_rua "${pkgdir}/usr/share/zsh/site-functions/_rua"
}
