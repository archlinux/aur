# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

# PKGBUILD script for tuql
# Automatically create a GraphQL server from a SQLite database or a SQL file
_npmname=tuql
_npmver=1.7.0
pkgname=$_npmname
pkgver=1.7.0
pkgrel=1
pkgdesc="Automatically create a GraphQL server from a SQLite database or a SQL file"
arch=('any')
url="https://github.com/bradleyboy/tuql"
license=('MIT')
groups=()
depends=('npm' 'nodejs')
makedepends=()
# optdepends=('***: for that thing *** does')
provides=("$_npmname")
conflicts=("$_npmname")
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha1sums=(0442e974defdcc042bdf52f8e20912791e9d05b0)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver

  # See https://github.com/sequelize/sequelize/issues/11174
  npm install -g --prefix "$pkgdir/usr" sqlite3

  # Non-deterministic race in npm gives 777 permissions to random directories.
  # See https://github.com/npm/npm/issues/9359 for details.
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # npm gives ownership of ALL FILES to build user
  # https://bugs.archlinux.org/task/63396
  chown -R root:root "${pkgdir}"
}
