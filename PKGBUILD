# Maintainer: Michael Taboada <michael@2mb.solutions>
# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
                                                                                                                                                                
pkgname="dkim-git"
pkgver=r10.e1128f0
pkgrel=1
pkgdesc="simple dkim tools written in go. Easily sign and verify dkim signatures on emails."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://github.com/driusan/dkim"
license=('MIT')
depends=(glibc)
makedepends=('git' 'go')
source=("dkim::git+https://github.com/driusan/dkim")
sha512sums=('SKIP')

  prepare(){
      mkdir -p gopath/src/github.com/driusan
        ln -rTsf dkim gopath/src/github.com/driusan/dkim
              }

pkgver() {
    cd "${srcdir}/dkim"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${srcdir}/gopath/src/github.com/driusan/dkim"
  for x in dkimsign dkimverify dkimkeygen ; do
    cd cmd/$x
    go install \
    -buildmode=pie \
    -gcflags "all=-trimpath=$GOPATH" \
    -asmflags "all=-trimpath=$GOPATH" \
    -ldflags "-extldflags $LDFLAGS" -v
    cd ../..
  done
}
                                                                                                                                                                
package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/doc/dkim"
  for x in dkimsign dkimverify dkimkeygen ; do install -p -m755 "$srcdir/gopath/bin/$x" "$pkgdir/usr/bin" ; done
  install -p -m644 "$srcdir/dkim/README.md" "$pkgdir/usr/share/doc/dkim"
                                                                                                                                                                
  #mkdir -p "$pkgdir/$GOPATH"
  #cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"
                                                                                                                                                                
}
                                                                                                                                                                
# vim:set ts=2 sw=2 et:
