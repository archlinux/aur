# Maintainer: ByteDream
pkgname=crunchy-cli
pkgdesc="Command-line downloader for Crunchyroll"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/crunchy-labs/crunchy-cli"
license=('MIT')

pkgver=3.0.1
pkgrel=1

depends=('ffmpeg' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crunchy-labs/crunchy-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c045fac99b1777f4b15ba82a197946fb0d12a94c8acda53e37e092333f05f4b0')

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  export CARGO_HOME="$srcdir/cargo-home"
  export RUSTUP_TOOLCHAIN=stable

  cargo build --release --no-default-features --features openssl
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  install -Dm755 target/release/crunchy-cli $pkgdir/usr/bin/crunchy-cli
  install -Dm644 target/release/manpages/* -t $pkgdir/usr/share/man/man1
  install -Dm644 target/release/completions/crunchy-cli.bash $pkgdir/usr/share/bash-completion/completions/crunchy-cli
  install -Dm644 target/release/completions/_crunchy-cli $pkgdir/usr/share/zsh/site-functions/_crunchy-cli
  install -Dm644 target/release/completions/crunchy-cli.fish $pkgdir/usr/share/fish/vendor_completions.d/crunchy-cli.fish
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/crunchy-cli/LICENSE
}

