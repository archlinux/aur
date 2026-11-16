# Maintainer: Cube1ber (https://github.com/cube-one-ber)
pkgname=zap
pkgver=0.2.0.r14.g3f4f32a94680
pkgrel=1
pkgdesc='Native AUR helper with its own libalpm engine, using run0 or sudo'
arch=('x86_64')
url='https://github.com/cube-one-ber/zap'
license=('GPL-3.0-or-later')
# The engine reimplements libalpm, so libalpm.so is not linked; pacman
# still provides pacman.conf, pacman-key and makepkg, and gnupg verifies
# signatures.
depends=('pacman>=7.0' 'gnupg' 'bzip2' 'xz' 'git' 'bubblewrap' 'systemd>=256' 'base-devel')
optdepends=('polkit: authentication for systemd run0'
            'sudo: alternative to run0 for system changes')
makedepends=('cargo')
conflicts=('zap-git' 'zap-bin')
# makepkg's -flto makes the bundled zstd C objects GCC bitcode, which
# rust-lld cannot link.
options=('!lto')
source=("zap-$pkgver.tar.gz::$url/releases/download/v$pkgver/zap-source.tar.gz")
sha256sums=('4a927c9b26797fbad4e6d1b5c74585a4249a94488ba2906f013cf936c7425ba4')

prepare() {
  cd "$srcdir/zap"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/zap"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target ZAP_VERSION="$pkgver"
  cargo build --frozen --release --bin zap
}

check() {
  cd "$srcdir/zap"
  export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target ZAP_VERSION="$pkgver"
  cargo test --frozen --release --bin zap
}

package() {
  cd "$srcdir/zap"
  install -Dm755 target/release/zap "$pkgdir/usr/bin/zap"
  install -Dm644 packaging/zap.1 "$pkgdir/usr/share/man/man1/zap.1"
  install -Dm644 packaging/completions/zap.bash "$pkgdir/usr/share/bash-completion/completions/zap"
  install -Dm644 packaging/completions/_zap "$pkgdir/usr/share/zsh/site-functions/_zap"
  install -Dm644 packaging/completions/zap.fish "$pkgdir/usr/share/fish/vendor_completions.d/zap.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zap/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/zap/LICENSE"
}
