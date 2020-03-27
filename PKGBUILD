# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Christopher Jeffrey
# URL: https://github.com/handshake-org/hsd
# Upstream: https://github.com/handshake-org/hsd

pkgname=hsd-git
pkgver=2.1.3.23.ged53f5f8
pkgrel=1
pkgdesc='Handshake decentralized naming system Daemon & Full Node'
arch=('i686' 'x86_64')
url='http://handshake.org/'
license=('MIT')
depends=('nodejs' 'unbound')
makedepends=('git' 'npm' 'python2' 'gcc' 'make')
provides=('hsd')
conflicts=('hsd')
source=("$pkgname::git+https://github.com/handshake-org/hsd.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm --production
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #HACK: npm is being lame and only installing a symlink =/
  rm "$pkgdir/usr/lib/node_modules/hsd"
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/hsd/{}" \;
  find "$pkgdir/usr/lib/node_modules/hsd" -exec chmod +x "{}" \;

  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
