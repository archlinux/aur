pkgname=zsh-patina-git
_pkgname=${pkgname%-git}
pkgver=1.5.1.r2.gc1c003b
pkgrel=1
pkgdesc='A blazingly fast Zsh syntax highlighter'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/michel-kraemer/zsh-patina"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
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
  "./target/release/$_pkgname" completion > "_$_pkgname"
}

package() {
  cd "$pkgname"
  install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 "_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}
