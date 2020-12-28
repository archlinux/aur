# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=4.22
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
makedepends=('asciidoctor' 'go' 'git' 'xmlto')
optdepends=('bitkeeper'
            'bzr'
            'cvs-fast-export'
            'darcs'
            'fossil'
            'git'
            'mercurial'
            'src'
            'subversion')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('134531e9f49cd5601f744f2231c25b45ae8a354141804933cf1c60bb6bf54eb0dbbc2ad6d9bbe45335b46e3a717cf0fe2d22c81d61e86797c5d79fd54adae729')

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

  # Use -j1 so reposurgeon always gets built before options.adoc is needed
  if [ "$(go version | grep gccgo)" ]; then
    make GOFLAGS="" -j1
  else
    make -j1
  fi
}

package_reposurgeon() {
  cd "$pkgbase-$pkgver"

  if [ "$(go version | grep gccgo)" ]; then
    make GOFLAGS="" DESTDIR="$pkgdir" prefix=/usr install
  else
    make DESTDIR="$pkgdir" prefix=/usr install
  fi

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}
