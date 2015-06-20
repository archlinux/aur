pkgname=git-lfs-test-server-git
pkgver=v0.2.1.r1.g90efc5f
pkgrel=1
pkgdesc="Standalone Git LFS server"
url="https://github.com/github/lfs-test-server"
license=('custom')
arch=('x86_64' 'i686')
makedepends=('mercurial' 'git' 'go')
conflicts=('git-lfs-test-server' 'git-lfs-test-server-bin')
provides=('git-lfs-test-server')
md5sums=('SKIP')
options=('!strip' '!emptydirs')
source=('git://github.com/github/lfs-test-server')

pkgver() {
  cd lfs-test-server
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/bin"
  GOBIN="$srcdir/bin" GOPATH="$srcdir" go get -v -x -fix ./lfs-test-server/...
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/lib/go"
    cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/usr/lib/go"

    # Package license (if available)
    for f in LICENSE COPYING LICENSE.* COPYING.*; do
      if [ -e "$srcdir/src/$_gourl/$f" ]; then
        install -Dm644 "$srcdir/src/$_gourl/$f" \
          "$pkgdir/usr/share/licenses/$pkgname/$f"
      fi
    done
}
