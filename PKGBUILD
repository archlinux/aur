_npmnamespace=@simon04
_npmname=npm2arch
_npmver=1.0.0
pkgname=nodejs-npm2arch
pkgver=1.0.0
pkgrel=2
pkgdesc="Convert NPM package to a PKGBUILD for ArchLinux"
arch=(any)
url="https://github.com/simon04/npm2arch"
license=(MIT)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/$_npmnamespace/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(e53348f74f661b3430f94011a3d597fb0db80741)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmnamespace/$_npmname@$_npmver

  # npm is in depends
  rm -r "$pkgdir/usr/lib/node_modules/@simon04/npm2arch/node_modules/npm"

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"

  # Fix "Package contains reference to $srcdir/$pkgdir"
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

# vim:set ts=2 sw=2 et:
