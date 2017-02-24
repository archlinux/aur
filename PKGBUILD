# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=check_pacman-git
pkgver=1.1.1.r1.g3a5db3e
pkgrel=1
pkgdesc="Nagios monitoring plugin for checking for available Pacman package updates"
arch=('i686' 'x86_64')
depends=('gmp' 'libffi')
makedepends=('git' 'stack' 'ghc')
url="https://github.com/dmp1ce/check_pacman"
license=('custom:Unlicense')
options=('strip')
source=(git+https://github.com/dmp1ce/check_pacman.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/check_pacman"

  msg2 'Installing...'
  mkdir -p "$pkgdir/usr/lib/monitoring-plugins/"
  mkdir -p "$srcdir/stack-home"
  HOME="$srcdir/stack-home" stack --system-ghc --local-bin-path "$pkgdir/usr/lib/monitoring-plugins" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
