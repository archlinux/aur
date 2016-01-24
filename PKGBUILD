# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgbase=reposurgeon
pkgname=({cy,}reposurgeon)
pkgver=3.31
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('any')
url="http://www.catb.org/esr/$pkgbase/"
license=('BSD')
depends=('python2')
makedepends=('cython2' 'asciidoc' 'xmlto')
optdepends=('bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=("$url$pkgbase-$pkgver.tar.xz" install-repocutter.patch)
sha256sums=('cf317e29183a67bf819cd39ebf55b91b3f905ed394f740eeb23cee680b130135'
            '99c6b3ba2b11b96b97240ba2f89369b81c89f0a6bcd5fd1ffe32e44b1706ffd0')

prepare() {
  cd "$srcdir/$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  make all

  if [ "$pkgname" == "cyreposurgeon" ]; then
      build_cyreposurgeon
  fi
}

build_cyreposurgeon() {
  cd "$srcdir/$pkgbase-$pkgver"
  make CYTHON=cython2 cyreposurgeon
}

package_reposurgeon() {
  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install
  install -m755 repomapper "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

package_cyreposurgeon() {
  arch=('i686' 'x86_64')

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-cyreposurgeon
}
