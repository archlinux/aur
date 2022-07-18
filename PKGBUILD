# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=stalld-git
pkgver=1.17.0.r0.g8710a48
pkgrel=1
pkgdesc="A daemon to prevent the starvation of operating system threads"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/utils/stalld/stalld.git/"
license=('GPL2')
depends=('glibc')
makedepends=('git')
provides=("stalld=$pkgver")
conflicts=('stalld')
source=("git+https://git.kernel.org/pub/scm/utils/stalld/stalld.git")
sha256sums=('SKIP')


pkgver() {
  cd "stalld"

  _tag=$(git tag -l --sort -v:refname | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "stalld"

  make
}

package() {
  cd "stalld"

  make DESTDIR="$pkgdir" install
  install -Dm644 "redhat/stalld.service" -t "$pkgdir/usr/lib/systemd/system"
}
