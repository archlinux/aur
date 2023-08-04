# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=4.38
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
            'sccs'
            'src'
            'subversion')
source=("https://gitlab.com/esr/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('230f2825f59f2a17fbac99f76430cca642a9db9d195e8ed76bdf861e90c33044eccc769cfdd1118106d385785298817d0051265e0253cc4aab04fd068e521d7d')

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

check() {
  cd "$pkgbase-$pkgver"

  make test
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
