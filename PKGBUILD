# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=fnt
pkgver=1.4.1
pkgrel=1
pkgdesc='The missing font manager for Linux'
arch=('any')
url='https://github.com/alexmyczko/fnt'
license=('MIT')
depends=('bash' 'curl' 'chafa' 'texlive-bin')
makedepends=('git')
_commit='500ba216b3cc2ebfcb762726eead5f4b8b12b961'
source=(
  "$pkgname::git+$url#commit=$_commit"
  'fix-zsh-completion-dir.patch'
  'use-arch-pkg-manager.patch'
)
b2sums=('SKIP'
        '64be4a089283e4cd52627fe45a9c57817ed8ed11b870d7cd4a6efa92683632dc818c9ae9f58efb4c0a23ccd0505b7df67e8ab7383a82840543caf76171888500'
        'da252f3546501d12ca53590b88cc8566aa873f0403fcc6a16418498f4b5dafe6f53b5881e98af1a8fcb8ee9178acc88ffa484b79412ea90fa1c8cf74bed68b2f')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # install zsh completions to correct directory
  patch -p1 -i "$srcdir/fix-zsh-completion-dir.patch"

  # cosmetic change, disregard me if you like
  patch -p1 -i "$srcdir/use-arch-pkg-manager.patch"
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir" make install

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
