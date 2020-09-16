# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=liburcu-git
pkgver=0.12.1.r3.g4af3e30
pkgrel=1
pkgdesc="Userspace RCU implementation"
arch=('i686' 'x86_64')
url="https://liburcu.org/"
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('liburcu')
conflicts=('liburcu')
options=('staticlibs')
source=("git+https://github.com/urcu/userspace-rcu.git")
sha256sums=('SKIP')


pkgver() {
  cd "userspace-rcu"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "userspace-rcu"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "userspace-rcu"

  make check
}

package() {
  cd "userspace-rcu"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/liburcu"

  rm "$pkgdir/usr/share/doc/userspace-rcu/LICENSE"
}
