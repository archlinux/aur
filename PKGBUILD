# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgbase=reposurgeon
pkgname=({cy,}reposurgeon)
pkgver=3.43
_commit=a513685ebefd5f5dc78caff6272f5a7d2d692e1d
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
source=("https://gitlab.com/esr/$pkgbase/repository/$pkgver/archive.tar.gz")
sha512sums=('0f01b1281d85fc746758c2de7e28b9d26907a938f642c7b9519877d5d717c5fb8ab45c85a36abd874a19bf87b673a814852d4e984bf4dfc0d60dce861dabaf29')

prepare() {
  cd "$pkgbase-$pkgver-$_commit"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgbase-$pkgver-$_commit"
  make all

  if [ "$pkgname" == "cyreposurgeon" ]; then
      build_cyreposurgeon
  fi
}

build_cyreposurgeon() {
  cd "$srcdir/$pkgbase-$pkgver-$_commit"
  make PYVERSION=3.6 cyreposurgeon
}

package_reposurgeon() {
  cd "$pkgbase-$pkgver-$_commit"
  make DESTDIR="$pkgdir" prefix=/usr install

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

package_cyreposurgeon() {
  arch=('i686' 'x86_64')

  cd "$pkgbase-$pkgver-$_commit"
  make DESTDIR="$pkgdir" prefix=/usr install-cyreposurgeon
}
