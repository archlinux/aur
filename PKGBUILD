# Maintainer: Matt Fields (0x6d617474) <aur at 0x6d617474 dot net>
# Contributor: Peter Hoeg <peter@hoeg.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=wp-cli-git
pkgver=r2717.dc3beeff
pkgrel=1
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
makedepends=('git' 'composer')
conflicts=('wp-cli' 'wp-cli-bin')
provides=('wp-cli')
source=("$pkgname::git+https://github.com/wp-cli/wp-cli-bundle.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd ${pkgname}
  git submodule update --init
}

build() {
  cd ${pkgname}
  # Replace specific version numbers with dev-main to pull latest versions
  sed -i 's/"^[0-9]\+"/"dev-main"/g' composer.json
  sed -i 's/"^[0-9]\+\.[0-9]\+"/"dev-main"/g' composer.json
  sed -i 's/"^[0-9]\+\.[0-9]\+\.[0-9]\+"/"dev-main"/g' composer.json
  sed -i 's/"[0-9]\+\.[0-9]\+\.x-dev"/"dev-main"/g' composer.json
  # Some dependencies use dev-master instead of dev-main...
  sed -i 's/core-command": "dev-main/core-command": "dev-master/g' composer.json
  sed -i 's/cron-command": "dev-main/cron-command": "dev-master/g' composer.json
  sed -i 's/db-command": "dev-main/db-command": "dev-master/g' composer.json
  sed -i 's/entity-command": "dev-main/entity-command": "dev-master/g' composer.json
  sed -i 's/export-command": "dev-main/export-command": "dev-master/g' composer.json
  sed -i 's/extension-command": "dev-main/extension-command": "dev-master/g' composer.json
  sed -i 's/import-command": "dev-main/import-command": "dev-master/g' composer.json
  sed -i 's/media-command": "dev-main/media-command": "dev-master/g' composer.json
  sed -i 's/scaffold-command": "dev-main/scaffold-command": "dev-master/g' composer.json
  sed -i 's/search-replace-command": "dev-main/search-replace-command": "dev-master/g' composer.json
  composer update --no-interaction --prefer-dist --no-scripts && composer dump
  echo -n "Building phar... "
  php -dphar.readonly=off utils/make-phar.php wp-cli.phar --quiet
  echo "Done!"
}

check() {
  cd ${pkgname}
  composer phpunit

  echo -n "Binary reporting as "
  php ./wp-cli.phar --version
}

package() {
  cd ${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/wp-cli/LICENSE"
  install -Dm655 wp-cli.phar "${pkgdir}/usr/bin/wp"
  install -Dm644 vendor/wp-cli/wp-cli/utils/wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
