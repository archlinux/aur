# Maintainer: dszryan
pkgname=pacmanity-git
pkgver=r51.a2f674b
pkgrel=1
epoch=2
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
  cd "$srcdir/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  source "$srcdir/${pkgname/-git/}/pacmanity.sh" && pacmanity_build
}

package() {
  # copy gist_id if exists
  [[ -r "$srcdir/gist_id" ]] && (mkdir -p "$pkgdir/etc" && install -m644 "$srcdir/gist_id" "$pkgdir/etc/pacmanity")

  # copy required script files
  mkdir -p "$pkgdir/usr/lib/pacmanity" "$pkgdir/usr/share/libalpm/hooks"
  install -m774 "$srcdir/${pkgname/-git/}/pacmanity.sh"   "$pkgdir/usr/lib/pacmanity/pacmanity.sh"
  install -m664 "$srcdir/${pkgname/-git/}/pacmanity.hook" "$pkgdir/usr/share/libalpm/hooks/zzz-pacmanity.hook"
}
