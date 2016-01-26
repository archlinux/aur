# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=1.2
commit=450096de61b40358f2151c3006785b48c946ec9b
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('GPL2')
depends=('libcgroup')
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate-git')
install=$pkgname.install

source=("https://github.com/ioi/isolate/archive/$commit.zip")
sha512sums=('ae0a6897d977e5f4767cba50087a2bd20fc32adb2f2d20addce8702fd02bfebdac9ab392356d05ebfb89ebc91c79e1ac5d6c95e3ef6739bc4a132ab5110cc53e')

build() {
  cd isolate-$commit
  make PREFIX="/usr" VARPREFIX="/var" CONFIGDIR="/etc" isolate isolate.1
}

package() {
  cd isolate-$commit
  make PREFIX="$pkgdir/usr" VARPREFIX="$pkgdir/var" CONFIGDIR="$pkgdir/etc" install install-doc

  # Patch the configuration file so that it uses a standard directory
  sed -i "s|/var/local/lib/isolate|/var/lib/isolate|" $pkgdir/etc/isolate

  # The isolate binary has the setuid bit set (to run as root without sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-x $pkgdir/usr/bin/isolate
}
