# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=jbigkit-git
pkgver=2.1.r15.g7d3c1be
pkgrel=1
pkgdesc="Software implementation of the JBIG1 data compression standard (ITU-T T.82)"
arch=('i686' 'x86_64')
url="https://www.cl.cam.ac.uk/~mgk25/jbigkit/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('jbigkit')
conflicts=('jbigkit')
options=('staticlibs')
source=("git+https://www.cl.cam.ac.uk/~mgk25/git/jbigkit")
sha256sums=('SKIP')


pkgver() {
  cd "jbigkit"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "jbigkit"

  make \
    CFLAGS="$CFLAGS $LDFLAGS" \
    -C "libjbig"
  make \
    CFLAGS="$CFLAGS $LDFLAGS" \
    -C "pbmtools"
}

check() {
  cd "jbigkit"

  #make test
}

package() {
  cd "jbigkit"

  install -Dm755 pbmtools/{jbgtopbm,jbgtopbm85,pbmtojbg,pbmtojbg85} -t "$pkgdir/usr/bin"
  install -Dm644 libjbig/{jbig,jbig85,jbig_ar}.h -t "$pkgdir/usr/include"
  install -Dm644 libjbig/{libjbig,libjbig85}.a -t "$pkgdir/usr/lib"
  install -Dm644 pbmtools/*.1* -t "$pkgdir/usr/share/man/man1"
  #install -Dm644 pbmtools/*.5* -t "$pkgdir/usr/share/man/man5"
}
