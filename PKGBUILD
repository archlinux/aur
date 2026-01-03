# Maintainer: Kam1k4dze <me@kam1k4dze.com>
pkgname=inspect-deps
pkgver=1.0.0
pkgrel=1
pkgdesc="ELF dependency analyzer with optional pacman integration"
arch=('x86_64')
url="https://github.com/Kam1k4dze/inspect-deps"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
optdepends=('pacman: for package resolution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed4230ae6dae54bb85b611076cb625e5642e4a035d4db15ee3361c436b1dcdbf')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build --parallel
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  build/inspect-deps --completions fish > completion.fish
  install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"

  build/inspect-deps --completions zsh > completion.zsh
  install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  build/inspect-deps --completions bash > completion.bash
  install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
}

