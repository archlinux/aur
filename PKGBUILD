# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Jonathan Neidel <aur@jneidel.com>

_pkgname=phpactor
pkgname=phpactor-git
pkgver=2024.06.30.0.r27.g5196cfa02
pkgrel=1
pkgdesc="PHP completion, refactoring, introspection tool and language server"
arch=(any)
url="https://github.com/phpactor/phpactor"
license=(MIT)
depends=(php)
makedepends=(composer)
optdepends=(
  'composer: faster class location and more features'
  'git: faster refactorings in your repository scope'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/phpactor/phpactor")
sha256sums=("SKIP")
options=('!strip')

pkgver() {
	cd "${_pkgname}"

	if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
		echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
	else
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	fi
}

package() {
  cd "$srcdir/$_pkgname"

  LIB_DIRECTORY="$pkgdir/usr/lib/$_pkgname"
  mkdir -p "$pkgdir/usr/bin" "$LIB_DIRECTORY"

  rm -rf .git*
  rm -r "$LIB_DIRECTORY" 2>/dev/null

  export COMPOSER_ALLOW_SUPERUSER=1 # allow su in fakeroot env
  composer --optimize-autoloader install

  cp -r . "$LIB_DIRECTORY"

  mkdir "$LIB_DIRECTORY/extensions"
  chmod 777 "$LIB_DIRECTORY/extensions" # allows to configure internal extensions while running on unpriviledged users

  ln -s "/usr/lib/$_pkgname/bin/phpactor" "$pkgdir/usr/bin/phpactor"
}
