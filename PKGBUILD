# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate-git
pkgver=r68.a3a2c4d
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('GPL2')
depends=('libcgroup')
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate')
install=$pkgname.install

source=('git://github.com/ioi/isolate.git')
sha512sums=('SKIP')

pkgver() {
  cd isolate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd isolate
  make isolate isolate.1
}

package() {
  cd isolate
  make PREFIX="$pkgdir/usr" install install-doc

  # The isolate binary has the suid bit set (to run as root without using sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-r-x $pkgdir/usr/bin/isolate
}
