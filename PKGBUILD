# Maintainer: Matt Fields (0x6d617474) <aur at 0x6d617474 dot net>
# Contributor: Peter Hoeg <peter@hoeg.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=wp-cli-git
pkgver=r8814.ae5557d7
pkgrel=2
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
makedepends=('git' 'composer')
conflicts=('wp-cli')
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
  # Replace specific version numbers with dev-master to pull latest versions
  sed -i 's/"^[0-9]\+"/"dev-master"/g' composer.json
  sed -i 's/"^[0-9]\+\.[0-9]\+\.[0-9]\+"/"dev-master"/g' composer.json
  sed -i 's/"[0-9]\+\.[0-9]\+\.x-dev"/"dev-master"/g' composer.json
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
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm655 wp-cli.phar "${pkgdir}/usr/bin/wp"
  install -Dm644 vendor/wp-cli/wp-cli/utils/wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
