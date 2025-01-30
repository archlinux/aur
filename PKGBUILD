pkgname=voms-clients
pkgver=3.3.4
_gittag="v$pkgver"
pkgrel=1
pkgdesc="Virtual Organization Membership Service (Java-based clients)"
arch=(any)
url="http://italiangrid.github.io/voms/"
depends=(java-runtime)
makedepends=(java-environment maven)
source=("git+https://github.com/italiangrid/voms-clients#tag=$_gittag")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

build() {
  cd "$pkgname"
  mvn -Dmaven.javadoc.skip=true \
      package
}

package() {
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  bsdtar -C "$pkgdir/usr" --strip-components 1 -xf "$pkgname/target/voms-clients.tar.gz"
  # rename to avoid conflicts with C clients from voms 2.x
  for f in /usr/bin/voms-proxy-{init,info,destroy}; do
    mv "$pkgdir/$f" "$pkgdir/${f/%/3}"
  done
  for f in /usr/share/man/man1/voms-proxy-{init,info,destroy}.1; do
    mv "$pkgdir/$f" "$pkgdir/${f/%.1/3.1}"
  done
}

# vim: ft=sh:ts=2:sw=2:et
