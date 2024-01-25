# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=1.10.1
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
sha512sums=('9a785e7b7eefacc7ab197058d73206669eec2cd72961d26209504f9f3c2a4cbd3d6754c3ecf474c7932f9bfddb8f61a7fe51c22b26bd124f766dbd710e2dc621')

build() {
  cd isolate-$pkgver
  make PREFIX="/usr" VARPREFIX="/var" CONFIGDIR="/etc" isolate isolate.1
}

package() {
  cd isolate-$pkgver
  make PREFIX="$pkgdir/usr" VARPREFIX="$pkgdir/var" CONFIGDIR="$pkgdir/etc" install install-doc

  # Patch the configuration file so that it uses a standard directory
  sed -i "s|/var/local/lib/isolate|/var/lib/isolate|" $pkgdir/etc/isolate

  # The isolate binary has the setuid bit set (to run as root without sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-x $pkgdir/usr/bin/isolate
}
