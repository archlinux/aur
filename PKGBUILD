# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=4.1
pkgrel=1
pkgdesc="Performs surgery on version control repositories."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('python')
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
sha512sums=('a434631fc87e165e6dcbcb85152feca0b8468bb7dd65cc657f834b7071697e5579a15a152189165ec6e6d9783275fe055888aa35acc8fbee55f04e96e77992bf')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  GOPATH="$srcdir/go" go get -d -u all
}

build() {
  cd "$pkgbase-$pkgver"

  if [ "$(go version | grep gccgo)" ]; then
    make GOPATH="$srcdir/go" GOFLAGS=""
  else
    make GOPATH="$srcdir/go"
  fi
}

package_reposurgeon() {
  cd "$pkgbase-$pkgver"

  if [ "$(go version | grep gccgo)" ]; then
    make GOPATH="$srcdir/go" GOFLAGS="" DESTDIR="$pkgdir" prefix=/usr install
  else
    make GOPATH="$srcdir/go" DESTDIR="$pkgdir" prefix=/usr install
  fi

  install -dm755 "$pkgdir/usr/share/emacs/site-lisp"
  install -Dm644 reposurgeon-mode.el "$pkgdir/usr/share/emacs/site-lisp"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/reposurgeon/COPYING"
}
