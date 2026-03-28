pkgname=zsh-patina-git
pkgver=1.2.0.r0.g018f978
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/michel-kraemer/zsh-patina"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  cargo update
  cargo fetch --locked
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -D -t "$pkgdir/usr/bin" target/release/zsh-patina
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
