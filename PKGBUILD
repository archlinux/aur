# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: icasdri <icasdri at gmail dot com>

pkgname=diff-so-fancy-git
pkgver=1.2.0.r7.g63568e8
pkgrel=1
pkgdesc="Make your diff's human readable instead of machine readable"
arch=('any')
url="https://github.com/so-fancy/diff-so-fancy"
license=('MIT')
depends=('perl')
makedepends=('git')
checkdepends=('bash-bats-assert' 'bash-bats-support')
provides=('diff-so-fancy')
conflicts=('diff-so-fancy')
source=("git+https://github.com/so-fancy/diff-so-fancy.git")
sha256sums=('SKIP')


prepare() {
  cd "diff-so-fancy"

  sed -e 's|test_helper/bats-support|/usr/lib/bats-support|' \
    -e 's|test_helper/bats-assert|/usr/lib/bats-assert|' \
    -e "s|load'$|load.bash'|" \
    -i test/*.bats
}

pkgver() {
  cd "diff-so-fancy"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "diff-so-fancy"

  bats test/*.bats
}

package() {
  cd "diff-so-fancy"

  sed -i 's|^use lib .*$|use lib "/usr/share/diff-so-fancy";|' diff-so-fancy

  install -Dm755 "diff-so-fancy" "$pkgdir/usr/bin/diff-so-fancy"
  install -Dm755 "lib/DiffHighlight.pm" "$pkgdir/usr/share/diff-so-fancy/DiffHighlight.pm"
  
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/diff-so-fancy/README.md"
}
