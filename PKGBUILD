# Maintainer: German IOI Coaches <coaches@informatik-olympiade.de>
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>
# Maintainer: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate-git
pkgver=r236.303b958
pkgrel=1
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('i686' 'x86_64')
url="https://github.com/ioi/isolate"
license=('GPL-2.0-or-later')
depends=('systemd-libs' 'libcap' 'glibc')
makedepends=('git' 'gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate')
install=$pkgname.install

source=('git+https://github.com/ioi/isolate.git' 'servicefile-path.patch')
sha512sums=('SKIP'
            '125b4d1dac18e17d84e9fdede28a450f21b96bb9c4a0ca4c07ff1d49862c04a5579735edc2e5f3309ddc0a7076c7ffe9af772aa454e9f5a3562efa7e8ecec5cd')

pkgver() {
  cd isolate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd isolate
  make PREFIX="/usr" VARPREFIX="/var" CONFIGDIR="/etc" isolate isolate.1
}

package() {
  cd isolate
  make PREFIX="$pkgdir/usr" VARPREFIX="$pkgdir/var" CONFIGDIR="$pkgdir/etc" SBINDIR="$pkgdir/usr/bin" install install-doc
  patch systemd/isolate.service < ../servicefile-path.patch
  install -D -t "$pkgdir/usr/lib/systemd/system/" systemd/isolate.service systemd/isolate.slice

  # Patch the configuration file so that it uses a standard directory
  sed -i "s|/var/local/lib/isolate|/var/lib/isolate|" "$pkgdir/etc/isolate"

  # The isolate binary has the setuid bit set (to run as root without sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-x "$pkgdir/usr/bin/isolate"
}
