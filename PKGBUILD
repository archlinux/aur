# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=phpactor
pkgver="2023.08.06"
pkgrel=2
_tmppkgver="${pkgver}-1"
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
sha256sums=("ed849509fa966d9b281af18a672870e7049b3e2571c7b246907027b618b1d9df")

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
