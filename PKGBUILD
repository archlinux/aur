# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# Contributor: Braydon Fuller
# URL: https://github.com/braydonf/gpk
# Upstream: https://github.com/braydonf/gpk

_pkgname=gpk
pkgname=gpk-git
pkgver=2.0.4
pkgrel=1
pkgdesc='A decentralized and secure package manager for nodejs.'
arch=('i686' 'x86_64')
url='https://github.com/braydonf/gpk'
license=('APACHE')
depends=('nodejs' 'python2' 'git')
#makedepends=('gcc' 'make')
provides=('gpk')
conflicts=('gpk')
source=("$pkgname::git+https://github.com/braydonf/gpk.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//;s/-/./g'
}

package() {
  cd "$pkgname"
  npm install -g --prefix "$pkgdir"/usr --user root --unsafe-perm --production
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chmod -R 755 "$pkgdir"/usr/bin
  #HACK: npm is being lame and only installing a symlink =/
  rm "$pkgdir/usr/lib/node_modules/$_pkgname"
  find * -exec install -D -m644 "{}" "$pkgdir/usr/lib/node_modules/$_pkgname/{}" \;
  find "$pkgdir/usr/lib/node_modules/$_pkgname" -exec chmod +x "{}" \;

  #HACK: remove references to $srcdir & $pkgdir (if you care)
  # npm install -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
  # "$pkgdir"/usr/bin/removeNPMAbsolutePaths "$pkgdir"/usr
  # npm uninstall -g removeNPMAbsolutePaths --prefix "$pkgdir"/usr
}
