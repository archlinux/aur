# Maintainer: Morganamilo <morganamilo@gmail.com>
pkgname=pacdiffviewer
pkgver=0.3.1
pkgrel=2
pkgdesc="Pacfiles manager"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Morganamilo/pacdiffviewer"
license=('GPL3')
depends=('pacman' 'glibc')
makedepends=('cargo')
optdepends=("vim: view via 'vim -f'"
  "git: view via 'git diff'"
  "sudo: view via 'sudo -e'")
conflicts=('yaourt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/pacdiffviewer/archive/v$pkgver.tar.gz")
sha512sums=('3db100b3b63fc1627f3aa918a0d22dd9fe4ea3edabd41893a20a9ba5f79415d97c5fce07d2c126015674fc9e45a760db1c704637bc095e958800cfb35067c42f')

build() {
  cd "$pkgname-$pkgver"

  if pacman -T pacman-git > /dev/null; then
    _features=git
  fi

  COMPLETIONS_DIR=target cargo build --release --locked --target-dir target --features "$_features"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

  install -Dm644 target/$pkgname.bash -t "$pkgdir/usr/share/bash-completion/completions"
  install -Dm644 target/$pkgname.fish -t "$pkgdir/usr/share/fish/completions"
  install -Dm644 target/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions"
}
