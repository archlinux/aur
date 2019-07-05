# Maintainer: Anna <morganamilo@gmail.com>
pkgname=pacdiffviewer
pkgver=0.2.1
pkgrel=1
pkgdesc="Pacfiles manager."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/Morganamilo/pacdiffviewer"
license=('GPL')
depends=('pacman')
makedepends=('cargo')
optdepends=("vim: view via 'vim -f'"
  "git: view via 'git diff'"
  "sudo: view via 'sudo -e'")
conflicts=('yaourt')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Morganamilo/pacdiffviewer/archive/v$pkgver.tar.gz")
sha512sums=('27698b8ce637b7e3c460bb90172155f48d84290131b6a11530ea12bd967d40a628b25e733bcd1efaa95085b5a79d84429fa85f5670a303e5dc33515b68107ee3')

build() {
  cd "$pkgname-$pkgver"

  if pacman -T pacman-git; then
    _features=git
  fi

  COMPLETIONS_DIR=target cargo build --release --locked --features "$_features"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 target/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname.bash"
  install -Dm644 target/$pkgname.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 target/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
