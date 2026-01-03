# Maintainer: Kam1k4dze <me@kam1k4dze.com>
pkgname=inspect-deps
pkgver=1.0.2
pkgrel=1
pkgdesc="ELF dependency analyzer with optional pacman integration"
arch=('x86_64')
url="https://github.com/Kam1k4dze/inspect-deps"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
optdepends=('pacman: for package resolution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9b3d2a0cab2bc8f665eea8f5aee60a8739f77252f61c599a1c3e3df096175f0c')

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

