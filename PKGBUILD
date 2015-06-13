# Contributor: Kyle Keen <keenerd@gmail.com>
pkgname=pylisp-git
pkgver=20110926
pkgrel=1
pkgdesc="Python compatible, Scheme-like with CL style macros and w/o continuations."
url="https://github.com/pavpanchekha/pylisp"
arch=('any')
license=("GPL3")
depends=('python2')
makedepends=('git')
source=('git://github.com/pavpanchekha/pylisp.git')
md5sums=('SKIP')

_gitname="pylisp"

pkgver() {
  cd "$srcdir/$_gitname"
  git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/python|/usr/bin/env python2|'
  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/env python|/usr/bin/env python2|'
  # typo
  find ./ -type f | xargs -n 1 sed -i 's|/usr/bin/envv python|/usr/bin/env python2|'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  # bug?
  mv "$pkgdir/usr/pylisp/"* "$pkgdir/usr/lib/python2.7/site-packages/pylisp"
  rmdir "$pkgdir/usr/pylisp/"

  # docs
  install -d "$pkgdir/usr/share/docs/pylisp/"
  install -m644 docs/*.txt "$pkgdir/usr/share/docs/pylisp/"
}
