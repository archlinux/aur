# Maintainer: Obed N Munoz <obed.n.munoz@intel.com>

pkgname=ciao
pkgver=83
pkgrel=4
pkgdesc="Ciao - Cloud Integrated Advanced Orchestrator"
arch=('x86_64' 'i686')
url="https://github.com/01org/ciao"
license=('Apache')
makedepends=('git' 'go')
depends=('ceph' 'qemu' 'libisoburn' 'psmisc' 'docker')
options=('!strip' '!emptydirs')
_gourl=github.com/01org/ciao

build() {
  export GOPATH="$srcdir"
  export GOBIN="$GOPATH/bin"
  go get -v ${_gourl}/...
  cd $srcdir/src/$_gourl
  git fetch --tags
  git checkout tags/$pkgver
  go install ${_gourl}/...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et: