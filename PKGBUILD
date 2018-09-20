# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Christopher Jeffrey
# URL: https://github.com/bcoin-org/bcash
# Upstream: https://github.com/bcoin-org/bcash

pkgname=bcash-git
pkgver=1.0.2.4.g28cf1ef8
pkgrel=1
pkgdesc='An alternative implementation of the Bitcoin Cash protocol, written in node.js.'
arch=('i686' 'x86_64')
url='https://github.com/bcoin-org/bcash'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'python2')
provides=('bcash')
conflicts=('bcash')
source=("$pkgname::git+https://github.com/bcoin-org/bcash.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tag | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #HACK: npm is being lame and only installing a symlink =/
  rm "$pkgdir/usr/lib/node_modules/bcash"
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/bcash/{}" \;
  find "$pkgdir/usr/lib/node_modules/bcash" -exec chmod +x "{}" \;
  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
