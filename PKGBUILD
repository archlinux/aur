# Maintainer: James An <james@jamesan.ca>
# Contributor: Tess 'socketwench' Flynn <tess@deninet.com>

_pkgname=drush
pkgname=$_pkgname-git
pkgver=8.0.0.beta12.r1.g54f9394
pkgrel=1
pkgdesc='The Drupal command-line shell, git version.'
arch=('any')
url="https://github.com/drush-ops/$pkgname"
license=('GPL')
depends=('bash' 'php-composer')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://github.com/drush-ops/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    ) 2>/dev/null
}

prepare() {
    composer install --prefer-source --no-interaction --working-dir "$_pkgname"
}

package() {
  cd "$_pkgname"

  install -d "$pkgdir/usr/share/webapps/$_pkgname"
  install -d "$pkgdir/usr/bin"

  cp -rf * "$pkgdir/usr/share/webapps/$_pkgname"
  ln -s "/usr/share/webapps/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
