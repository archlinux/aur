# Maintainer: Jonathan Neidel <aur@jneidel.com>

pkgname=phpactor
pkgver="2026.07.22.0"
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
source=("https://github.com/phpactor/phpactor/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("e3bd68bba0805afafea681c9442e8c902da2a603206f5345647eed88bf8a9b7a")

check() {
  if ! php -m | grep iconv >/dev/null; then
    echo "The iconv extension is not installed for the php installation in use.
See: https://wiki.archlinux.org/title/PHP#Extensions

For the default php enable the extension in /etc/php/conf.d/extensions.ini with:
extension=iconv"
    false
  fi
}

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
