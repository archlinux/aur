# Maintainer: Morganamilo <morganamilo@gmail.com>
pkgname=pacdiffviewer
pkgver=0.3.0
pkgrel=1
pkgdesc="Pacfiles manager."
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
sha512sums=('86959316cae74fa08b08e1abbc18bf6fe93be4fd1e2e672d0d2190ac4ade1ae5b39fa2e0360b639979a46c08492e529a9cb8f5923388d8fbdb7c3738e7546b30')

build() {
  cd "$pkgname-$pkgver"

  if pacman -T pacman-git > /dev/null; then
    _features=git
  fi

  COMPLETIONS_DIR=target cargo build --release --locked --target-dir target --features "$_features"
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 target/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname.bash"
  install -Dm644 target/$pkgname.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"
  install -Dm644 target/_$pkgname "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
