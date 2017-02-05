# Maintainer: Duarte David <deltaduartedavid@gmail.com>
pkgname=nodebb
pkgrel=1
pkgver=1.x.x
pkgdesc='Node.js based forum software built for the modern web'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('nodejs')
optdepends=("mongodb: Default database")

makedepends=('npm' 'git')
install="$pkgname.install"
source=('nodebb::git+https://github.com/NodeBB/NodeBB.git#branch=v1.x.x' "$pkgname.service")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | cut -c 2-
}

build() {
  cd "$srcdir/$pkgname"

  npm install --production --cache "${srcdir}/npm-cache"

}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm LICENSE

  # Remove windows script
  rm *.bat
  rm Dockerfile


  cp -r * "$pkgdir/opt/$pkgname"

  # systemd service
  install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
}
