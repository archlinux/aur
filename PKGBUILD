# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://gitlab.com/thann/pingg
# Upstream: https://gitlab.com/thann/pingg

pkgname=pingg-git
pkgver=0.0.3
pkgrel=1
pkgdesc='Ping latency graphical CLI.'
arch=('any')
url='http://gitlab.com/thann/pingg/'
license=('UNLICENSE')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('pingg')
conflicts=('pingg')
source=("$pkgname::git+https://gitlab.com/thann/pingg.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #HACK: npm is being lame and only installing a symlink =/
  rm "$pkgdir/usr/lib/node_modules/pingg"
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/pingg/{}" \;
  chmod +x "$pkgdir/usr/lib/node_modules/pingg/pingg"
  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
