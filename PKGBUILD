# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=1.3
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('GPL2')
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate-git')
install=$pkgname.install

source=("https://github.com/ioi/isolate/archive/v$pkgver.zip")
sha512sums=('1f2f93d97e383a9d0526cb137137dca0cb8beb64a8a1037ac5e7ac83907ef37b73add1b12a14cf0a3bc8db137c12e9488c7b50d5206d6bfd0b01df725a52c2c6')

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
