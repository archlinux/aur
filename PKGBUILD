# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgbase=reposurgeon
pkgname=({cy,}reposurgeon)
pkgver=3.42
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/$pkgbase/"
license=('BSD')
depends=('python')
makedepends=('cython' 'asciidoc' 'xmlto')
optdepends=('bitkeeper'
            'bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=("$url$pkgbase-$pkgver.tar.xz")
sha512sums=('6bd8cf43c7e8c9491233b6ff55a3fafaa80a80b226239b28de45fe9f29360deb7475512b0416c2ad6723e1a4111385de24542f19ffe22ed97f771f1fdb2feeff')

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
