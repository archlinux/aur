# Maintainer: Colin Woodbury <colin@fosskers.ca>
pkgname=aura
pkgver=3.2.4
pkgrel=1
pkgdesc="A secure package manager for Arch Linux and the AUR"
url="https://github.com/fosskers/aura"
license=('GPL3')
arch=('x86_64')
depends=('gmp' 'pacman' 'git')
makedepends=('stack')
optdepends=('bash-completion: for bash completions')
conflicts=('aura-bin' 'aura-git')
options=('strip')
backup=("etc/$pkgname.conf")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d6d58396a7d42e870f709a87f0ae944b49ef48ceb2282399382099e30146ac9')

build() {
  cd "$pkgname-$pkgver"
  stack clean "$pkgname"
  stack build --pedantic "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  stack install --local-bin-path="$pkgdir/usr/bin" "$pkgname"

  # Install conf file
  install -Dm644 "$pkgname/doc/$pkgname.conf" -t "$pkgdir/etc"

  # Install man pages
  install -Dm644 "$pkgname/doc/$pkgname.8" -t "$pkgdir/usr/share/man/man8"
  install -Dm644 "$pkgname/doc/$pkgname.conf.5" -t "$pkgdir/usr/share/man/man5"

  # Install bash completions
  install -Dm644 "$pkgname/doc/completions/bashcompletion.sh" \
    "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  # Install zsh completions
  install -Dm644 "$pkgname/doc/completions/_$pkgname" -t \
    "$pkgdir/usr/share/zsh/site-functions"

  # Directories for storing PKGBUILDs, source packages & installed package states
  install -d "$pkgdir/var/cache/$pkgname/"{pkgbuilds,src,states}
}
