pkgname=voms-clients
pkgver=3.0.6
pkgrel=1
arch=(any)
url="http://italiangrid.github.io/voms/"
depends=(java-runtime)
makedepends=(java-environment maven)
_gitrev="c30b6625f842f9c8f4fac3441745ae8845bf2adb" # v3.0.6
source=("git+https://github.com/italiangrid/voms-clients#commit=$_gitrev")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./g'
}

build() {
  cd "$pkgname"
  mvn -Dmaven.javadoc.skip=true \
      -Dvoms-clients.libs="/usr/share/$pkgname/lib" \
      package
}

package() {
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  bsdtar -C "$pkgdir/usr" --strip-components 1 -xf "$pkgname/target/voms-clients.tar.gz"
  mv "$pkgdir/usr/share/java" "$pkgdir/usr/share/$pkgname/lib"
  # rename to avoid conflicts with C clients from voms 2.x
  for f in /usr/bin/voms-proxy-{init,info,destroy}; do
    mv "$pkgdir/$f" "$pkgdir/${f/%/3}"
  done
  for f in /usr/share/man/man1/voms-proxy-{init,info,destroy}.1; do
    mv "$pkgdir/$f" "$pkgdir/${f/%.1/3.1}"
  done
}

# vim: ft=sh:ts=2:sw=2:et
