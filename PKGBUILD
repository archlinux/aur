# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=reposurgeon
pkgver=3.46
pkgrel=3
pkgdesc="Performs surgery on version control repositories."
arch=('x86_64')
url="http://www.catb.org/esr/$pkgname/"
license=('BSD')
depends=('pypy')
makedepends=('asciidoc' 'go' 'git' 'xmlto')
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
sha512sums=('470a35b6c74bd8d22012f7f5c1dd2e3dab5dce7c7ce67c17d401fe2a67e22d9199cd9be24186a85669ea51032198fc59aabff9766791f0f40e4683384671e6bb')

prepare() {
  cd "$pkgbase-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  GOPATH="$srcdir/go" go get -d ./go-repocutter
  GOPATH="$srcdir/go" go get -d ./go-reposurgeon
}

build() {
  cd "$pkgbase-$pkgver"

  if [ "$(go version | grep gccgo)" ]; then
    make GOPATH="$srcdir/go" GOFLAGS="" all
  else
    make GOPATH="$srcdir/go" all
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
