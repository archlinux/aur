# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=keyutils-git
pkgver=1.6.3.r6.gc076dff
pkgrel=1
pkgdesc="Key management utilities"
arch=('i686' 'x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/"
license=('GPL' 'LGPL')
depends=('glibc' 'sh')
makedepends=('git')
provides=("keyutils=$pkgver" 'libkeyutils.so')
conflicts=('keyutils')
backup=('etc/request-key.conf')
options=('staticlibs')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git"
        "reproducible.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/keyutils/-/raw/main/reproducible.patch"
        "request-key.conf.patch::https://gitlab.archlinux.org/archlinux/packaging/packages/keyutils/-/raw/main/request-key.conf.patch")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')


prepare() {
  cd "keyutils"

  patch -Np1 -i "$srcdir/reproducible.patch"
  patch -Np0 -i "$srcdir/request-key.conf.patch"
}

pkgver() {
  cd "keyutils"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "keyutils"

  make \
    CFLAGS="$CFLAGS" \
    LDFLAGS="$LDFLAGS" \
    BINDIR="/usr/bin" \
    SBINDIR="/usr/bin"
}

check() {
  cd "keyutils"

  #make test
}

package() {
  cd "keyutils"

  make \
    DESTDIR="$pkgdir" \
    BINDIR="/usr/bin" \
    SBINDIR="/usr/bin" \
    LIBDIR="/usr/lib" \
    USRLIBDIR="/usr/lib" \
    install
}
