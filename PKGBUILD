# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgbase=reposurgeon
pkgname=({cy,}reposurgeon)
pkgver=3.41
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/$pkgbase/"
license=('BSD')
depends=('python')
makedepends=('cython' 'asciidoc' 'xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=("$url$pkgbase-$pkgver.tar.xz")
sha256sums=('abfa983612249142190ad7e83a639dc322d0f4033385ba6503475ba67a640eba')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgbase-$pkgver"
  make all

  if [ "$pkgname" == "cyreposurgeon" ]; then
      build_cyreposurgeon
  fi
}

build_cyreposurgeon() {
  cd "$srcdir/$pkgbase-$pkgver"
  make PYVERSION=3.6 cyreposurgeon
}

package_reposurgeon() {
  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

package_cyreposurgeon() {
  arch=('i686' 'x86_64')

  cd "$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-cyreposurgeon
}
