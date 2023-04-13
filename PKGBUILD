# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyssh-git
pkgver=20230101.r1.g40e0fe7
pkgrel=1
pkgdesc="Minimalistic SSH server"
arch=('i686' 'x86_64')
url="https://tinyssh.org/"
license=('custom:Public Domain')
depends=('glibc')
makedepends=('git')
provides=("tinyssh=$pkgver")
conflicts=('tinyssh')
source=("git+https://github.com/janmojzis/tinyssh.git"
        "tinyssh@.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tinyssh/trunk/tinyssh@.service"
        "tinyssh@.socket::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tinyssh/trunk/tinyssh@.socket"
        "tinysshgenkeys.service::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tinyssh/trunk/tinysshgenkeys.service")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "tinyssh"

  echo "/usr/bin" > "conf-bin"
}

pkgver() {
  cd "tinyssh"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "tinyssh"

  make
}

package() {
  cd "tinyssh"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/tinyssh"
  install -Dm644 "$srcdir"/{tinysshgenkeys.service,tinyssh@.service,tinyssh@.socket} \
    -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "LICENCE" -t "$pkgdir/usr/share/licenses/tinyssh"
}
