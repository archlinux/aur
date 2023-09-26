# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=phpactor
pkgver="2023.09.24.0"
pkgrel=1
_tmppkgver="${pkgver}"
pkgdesc="PHP completion, refactoring, introspection tool and language server"
arch=(any)
url="https://github.com/phpactor/phpactor"
license=(MIT)
depends=(php)
makedepends=(composer)
optdepends=('composer: faster class location and more features'
  'git: faster refactorings in your repository scope')
provides=(phpactor)
source=("https://github.com/phpactor/phpactor/archive/refs/tags/${_tmppkgver}.tar.gz")
sha256sums=("ddb9ee21471c65e76503020cb7197aa14c598cda01456fb626a86d4186104819")

package() {
  cd "$srcdir/${pkgname}-${_tmppkgver}"

  LIB_DIRECTORY="$pkgdir/usr/lib/$pkgname"
  mkdir -p "$pkgdir/usr/bin" "$LIB_DIRECTORY"

  rm -r "$LIB_DIRECTORY" 2>/dev/null
  cp -r . "$LIB_DIRECTORY"

  export COMPOSER_ALLOW_SUPERUSER=1 # allow su in fakeroot env
  composer install --no-interaction --no-dev --optimize-autoloader --working-dir "$LIB_DIRECTORY"

  mkdir "$LIB_DIRECTORY/extensions"
  chmod 777 "$LIB_DIRECTORY/extensions" # allows to configure internal extensions while running on unpriviledged users

  ln -s "/usr/lib/$pkgname/bin/phpactor" "$pkgdir/usr/bin/phpactor"
}
