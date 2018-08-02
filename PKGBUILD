# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Christopher Jeffrey
# URL: https://github.com/handshake-org/hs-miner
# Upstream: https://github.com/handshake-org/hs-miner

pkgname=hs-miner-git
pkgver=0.0.1
pkgrel=1
pkgdesc='Handshake decentralized naming system miner'
arch=('i686' 'x86_64')
url='http://handshake.org/'
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'python2' 'gcc' 'make')
provides=('hs-miner')
conflicts=('hs-miner')
source=("$pkgname::git+https://github.com/handshake-org/hs-miner.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  #git describe | sed 's/^v//;s/-/./g'
  git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  #HACK: npm is being lame and only installing a symlink =/
  rm "$pkgdir/usr/lib/node_modules/hs-miner"
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/hs-miner/{}" \;
  find "$pkgdir/usr/lib/node_modules/hs-miner" -exec chmod +x "{}" \;

  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
