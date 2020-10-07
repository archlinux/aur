# Maintainer: dszryan
pkgname=pacmanity-git
pkgver=r47.71a7d21
pkgrel=1
epoch=1
pkgdesc="Keeps a list of installed packages in a Gist at your GitHub account"
arch=('x86_64' 'i686')
url="https://github.com/dszryan/${pkgname/-git/}"
license=('GPL')
#groups=('ALPM' 'Backup' 'gist' 'pacman')
depends=('pacman>=5.0' 'gist>=4.5.0')
makedepends=('git')
conflicts=('pacmanity')
source=("${pkgname/-git/}::git+https://github.com/dszryan/${pkgname/-git/}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # install
  mkdir -p "$pkgdir/etc" "$pkgdir/usr/lib/pacmanity" "$pkgdir/usr/share/libalpm/hooks"
  install -m774 "$srcdir/${pkgname/-git/}/src/pacmanity.sh"   "$pkgdir/usr/lib/pacmanity/pacmanity.sh"
  install -m664 "$srcdir/${pkgname/-git/}/src/pacmanity.hook" "$pkgdir/usr/share/libalpm/hooks/zzz-pacmanity.hook"

  # run
  if [[ -r "/etc/pacmanity" ]]; then # if file is present, assume it is maanged externally (via a build system)
    . $pkgdir/usr/lib/pacmanity/pacmanity.sh
  else
    source $pkgdir/usr/lib/pacmanity/pacmanity.sh
    pacmanity_install
  fi
}
