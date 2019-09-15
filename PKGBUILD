# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=1.8.1
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
sha512sums=('b907cd9493b04eea01de3f5e90ea71c3f6773f6757ed5d8445dafe001bdb786f52d80255d355af1fbeb8957f83e8768be67ff5449e91f9f6de973187d87629b0')

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
