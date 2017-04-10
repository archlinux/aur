# Maintainer: Peter Hoeg <peter@hoeg.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=wp-cli-git
pkgver=r7283.f9f27c5f
pkgrel=1
pkgdesc="A command-line tool for managing WordPress"
url="http://wp-cli.org/"
arch=('any')
license=('MIT')
depends=('php')
makedepends=('git' 'php-composer')
conflicts=('wp-cli')
source=("$pkgname::git+https://github.com/wp-cli/wp-cli.git")
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
  composer update --no-interaction --prefer-dist
  php -dphar.readonly=off utils/make-phar.php wp-cli.phar --quiet
}

check() {
  cd ${pkgname}
  ./vendor/bin/phpunit
  php ./wp-cli.phar --version
}

package() {
  cd ${pkgname}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm655 wp-cli.phar "${pkgdir}/usr/bin/wp"
  install -Dm644 utils/wp-completion.bash "${pkgdir}/usr/share/bash-completion/completions/wp"
}
