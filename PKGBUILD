# Maintainer: James An <james@jamesan.ca>

_pkgname=kettu
pkgname="$_pkgname-git"
pkgver=r370.036767e
pkgrel=1
pkgdesc='Rewrite of the Transmission Web Client with jQuery, Sammy and Mustache'
arch=('i686' 'x86_64' 'any')
url="https://github.com/endor/$_pkgname"
license=('GPL')
depends=(transmission-cli)
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/endor/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    #~ The repo doesn't have any releases or other tagged commits.
    #~ git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cat << EOF >| $_pkgname.conf
[Service]
Environment=TRANSMISSION_WEB_HOME=/usr/share/webapps/$_pkgname
EOF
}

package() {
  install -Dm644 $_pkgname.conf "$pkgdir/usr/lib/systemd/system/transmission.service.d/$_pkgname.conf"
  install -dm755 "$pkgdir/usr/share/webapps/$_pkgname"

  cd "$_pkgname"
  cp -a * "$pkgdir/usr/share/webapps/$_pkgname"
}
