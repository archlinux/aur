# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wolfssh-git
pkgver=1.4.11.r0.gd42230d
pkgrel=1
pkgdesc="A small, fast, portable SSH implementation, including support for SCP and SFTP"
arch=('i686' 'x86_64')
url="https://www.wolfssl.com/"
license=('GPL' 'custom')
depends=('glibc' 'wolfssl')
makedepends=('git')
provides=("wolfssh=$pkgver")
conflicts=('wolfssh')
options=('staticlibs')
source=("git+https://github.com/wolfSSL/wolfssh.git")
sha256sums=('SKIP')


pkgver() {
  cd "wolfssh"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//;s/-stable//'
}

build() {
  cd "wolfssh"

  ./autogen.sh
  ./configure \
    --prefix="/usr" \
    --enable-static
  make
}

check() {
  cd "wolfssh"

  make check
}

package() {
  cd "wolfssh"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSING" -t "$pkgdir/usr/share/licenses/wolfssh"
}
