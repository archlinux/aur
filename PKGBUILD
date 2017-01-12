# Maintainer: gh0st <gh0st@vivaldi.net>

_pkgname=Shift
pkgname="shift-git"
pkgver=0.9.9
pkgrel=1
pkgdesc='A minimalistic approach to maximum control of your Transmission. (Web UI)'
arch=('i686' 'x86_64' 'any')
url="https://github.com/killemov/$_pkgname"
license=('GPL')
depends=(transmission-cli)
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("kettu-git")
source=("$_pkgname"::"git+https://github.com/killemov/$_pkgname.git")
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
