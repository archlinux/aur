# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcb-git
pkgver=1.2.r65.gf7afc3c
pkgrel=1
pkgdesc="Alternative password shadowing scheme"
arch=('i686' 'x86_64')
url="https://www.openwall.com/tcb/"
license=('BSD-3-Clause' 'GPL-1.0-or-later')
depends=('glibc' lib{crypt,pam}.so)
makedepends=('git' 'libxcrypt' 'pam')
provides=("tcb=$pkgver")
conflicts=('tcb')
options=('staticlibs')
source=("git+https://github.com/openwall/tcb.git")
sha256sums=('SKIP')


prepare() {
  cd "tcb"

  sed -i 's/-g chkpwd/-g root/;s/-g shadow/-g root/' "$srcdir/tcb/progs/Makefile"
}

pkgver() {
  cd "tcb"

  _tag=$(git tag -l --sort -v:refname | grep -E '^tcb-[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count "$_tag"..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^tcb-//'
}

build() {
  cd "tcb"

  make
}

package() {
  cd "tcb"

  make \
    DESTDIR="$pkgdir" \
    SBINDIR="/usr/bin" \
    SLIBDIR="/usr/lib" \
    LIBEXECDIR="/usr/lib" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tcb"
}
