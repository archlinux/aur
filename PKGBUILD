# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=2.0
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('GPL2')
depends=()
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate-git')
install=$pkgname.install

source=("https://github.com/ioi/isolate/archive/v$pkgver.zip")
sha512sums=('12a19607b8b4f8f1ea3416e0f344a24f4546a384069f80aa8fb57bc64dd1b2630d7b6573f096ab9458e624e90de9c3b573556cfab08d43d04cdb3c000ca6af89')

build() {
  cd isolate-$pkgver
  make PREFIX="/usr" VARPREFIX="/var" CONFIGDIR="/etc" isolate isolate.1
}

package() {
  cd isolate-$pkgver
  make PREFIX="$pkgdir/usr" VARPREFIX="$pkgdir/var" CONFIGDIR="$pkgdir/etc" SBINDIR="$pkgdir/usr/bin" install install-doc

  # Patch the configuration file so that it uses a standard directory
  sed -i "s|/var/local/lib/isolate|/var/lib/isolate|" $pkgdir/etc/isolate

  # The isolate binary has the setuid bit set (to run as root without sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-x $pkgdir/usr/bin/isolate
}
