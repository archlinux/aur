# Maintainer: dszryan
pkgname=pacmanity-git
pkgver=3.0.1
pkgrel=4
epoch=1
pkgdesc="Keeps a list of installed packages in a Gist at your GitHub account"
arch=('x86_64' 'i686')
url="https://github.com/DerekTBrown/${pkgname/-git/}"
license=('GPL')
#groups=('ALPM' 'Backup' 'gist' 'pacman')
depends=('pacman>=5.0' 'gist>=4.5.0')
makedepends=('git')
conflicts=('pacmanity')
source=("${pkgname/-git/}::git+https://github.com/DerekTBrown/${pkgname/-git/}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git/}"
  git describe --all --exact-match `git rev-parse HEAD` | sed "s|tags/||g"
}

package() {
  # install
  mkdir -p "$pkgdir/etc" "$pkgdir/usr/lib/pacmanity" "$pkgdir/usr/share/libalpm/hooks"
  install -m774 "$srcdir/${pkgname/-git/}/src/pacmanity.sh"   "$pkgdir/usr/lib/pacmanity/pacmanity.sh"
  install -m664 "$srcdir/${pkgname/-git/}/src/pacmanity.hook" "$pkgdir/usr/share/libalpm/hooks/zzz-pacmanity.hook"
  if [[ -f "/etc/pacmanity"  ]]; then
    install -m664 "/etc/pacmanity" "$pkgdir/etc/pacmanity"
    sudo rm -f "/etc/pacmanity"
  else
    touch "$pkgdir/etc/pacmanity"
  fi

  # run
  . $pkgdir/usr/lib/pacmanity/pacmanity.sh
  if [[ -z "$GIST_ID" ]]; then
    pacmanity_install
  else
    pacmanity_update
  fi
}
