# Maintainer: mafuzyk <mafuzyk@gmail.com>
# Git package. For a tagged release, replace `source` with the GitHub tarball
# and fill in the checksum with `updpkgsums`.

pkgname=sharky-shell-git
pkgver=2.1.0.r82.g115d429
pkgrel=1
pkgdesc="Unix-first interactive shell written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/mafuzyk/sharky-shell"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('cargo' 'git')
provides=('sharky' 'sharky-shell')
conflicts=('sharky' 'sharky-shell')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd sharky-shell
  printf '2.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd sharky-shell/rust
  export CARGO_HOME="$srcdir/cargo"
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=$srcdir=."
  cargo build --release --locked --jobs 6
}

package() {
  cd sharky-shell/rust
  install -Dm755 target/release/sharky "$pkgdir/usr/bin/sharky"
  install -Dm644 man/sharky.1 "$pkgdir/usr/share/man/man1/sharky.1"
  install -Dm644 examples/config.sharky "$pkgdir/usr/share/sharky/config.sharky"
  install -Dm644 examples/theme.sharky "$pkgdir/usr/share/sharky/theme.sharky"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
