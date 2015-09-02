# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgbase=reposurgeon
pkgname=({cy,}reposurgeon)
pkgver=3.29
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
source=("$url$pkgbase-$pkgver.tar.xz"
        0001-missing-reporting-bugs.patch)
sha256sums=('6105a99f0e6c01d4a499a32b7bcc5d55c37ca1d3386101c20b7c1738fc086aa2'
            '0b4c9fba16b0d5afe734f4a09dac510c04644961444dedcd3603a1c3c093d7ef')

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

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}

package_cyreposurgeon() {
  arch=('i686' 'x86_64')

  cd "$srcdir/$pkgbase-$pkgver"
  make DESTDIR="$pkgdir" prefix=/usr install-cyreposurgeon
}
