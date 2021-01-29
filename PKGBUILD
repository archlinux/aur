pkgname=renovate-git
pkgver=24.30.0.r1.g2cd92c1a8
pkgrel=1
pkgdesc="Universal dependency update tool that fits into your workflows."
arch=(any)
url="https://github.com/renovatebot/renovate"
source=("$pkgname::git+https://github.com/renovatebot/renovate")
license=(AGPL)
makedepends=('yarn' 'npm')
depends=('nodejs')
sha256sums=('SKIP')

build () {
  cd "$srcdir/$pkgname"
  yarn install
  yarn build
}

package() {
  npmdir="$pkgdir/usr/lib/node_modules/$pkgname"
  mkdir -p "$npmdir"
  
  cp -a "$srcdir/$pkgname/dist" $npmdir
  cp -a "$srcdir/$pkgname/data" $npmdir
  cp -a "$srcdir/$pkgname/package.json" $npmdir

  npm install -g --prefix "${pkgdir}/usr" $npmdir
  
  # npm bug - https://github.com/npm/npm/issues/9359
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}