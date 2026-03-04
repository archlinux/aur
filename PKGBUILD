# Maintainer: Ben Smith (shmall03) <contact@bensmithmusic.art>

_pkgname=sonic-tte
pkgname=$_pkgname-git
pkgver=0.1.r0.g0000000
pkgrel=1
pkgdesc="A high-impact animated media screensaver for the terminal using TerminalTextEffects"
arch=('any')
url="https://github.com/shmall03/sonic-tte"
license=('GPL3')
depends=('playerctl' 'figlet' 'python-terminaltexteffects')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Generate version string from git history
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
    printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  
  # Install the main binary to /usr/bin/
  install -Dm755 bin/sonic-tte "$pkgdir/usr/bin/sonic-tte"
  
  # Install helper scripts and assets to /usr/share/sonic-tte/
  install -Dm755 bin/center_text.py "$pkgdir/usr/share/$_pkgname/center_text.py"
  install -Dm644 share/fonts/Delta-Corps-Priest-1.flf "$pkgdir/usr/share/$_pkgname/fonts/Delta-Corps-Priest-1.flf"
  install -Dm644 share/sonic-tte.conf.example "$pkgdir/usr/share/$_pkgname/sonic-tte.conf.example"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
