# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libutempter-git
pkgver=1.2.1.alt1.r14.g9f29181
pkgrel=2
pkgdesc="A library for utmp/wtmp updates"
arch=('i686' 'x86_64')
url="https://github.com/altlinux/libutempter"
license=('LGPL')
depends=('glibc')
makedepends=('git' 'systemd')
provides=("libutempter=$pkgver")
conflicts=('libutempter')
source=("git+https://github.com/altlinux/libutempter.git")
sha256sums=('SKIP')


pkgver() {
  cd "libutempter"

  _tag=$(git tag -l --sort -v:refname | grep -E '^[0-9\.]+-alt.*$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/-/./g'
}

build() {
  cd "libutempter/libutempter"

  make
}

package() {
  cd "libutempter/libutempter"

  make DESTDIR="$pkgdir" install

  echo 'z /usr/lib/utempter/utempter 2755 root utmp' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/libutempter.conf"
}
