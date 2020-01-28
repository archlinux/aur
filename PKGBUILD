# Maintainer: Frédéric Potvin <frederic.potvin@platform.sh>

pkgname=platformsh-cli-git
_pkgname=${pkgname%-git}
pkgver=3.52.0.r0.g28172cbc
pkgrel=1
pkgdesc="The unified tool for managing your Platform.sh services from the command line."
arch=('any')
url="https://github.com/platformsh/$_pkgname"
license=('MIT')
depends=('git' 'php' 'composer')
optdepends=('drush')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+$url.git#branch=master")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --tag | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd "$_pkgname"

  composer install
  composer bin all install
}

build() {
  cd "$_pkgname"

  ./bin/platform self:build --yes
}

check() {
  cd "$_pkgname"

  ./vendor/bin/box verify platform.phar
}

package() {
  cd "$_pkgname"

  mkdir -p ~/.platformsh
  install -Dm755 platform.phar "$pkgdir/usr/share/webapps/platform/platform.phar"
  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/share/webapps/platform/platform.phar "$pkgdir/usr/bin/platform"
}
