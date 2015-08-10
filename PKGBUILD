# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=firefox-pentadactyl
pkgver=r7170
pkgrel=1
pkgdesc="plugin for firefox designed to make browsing more efficient"
arch=('any')
url="http://5digits.org/pentadactyl/"
license=('MIT')
depends=("firefox")
makedepends=('unzip' 'git')
provides=('firefox-pentadactyl')
conflicts=('firefox-pentadactyl-hg')
source=("$pkgname::git+https://github.com/5digits/dactyl.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s" "$(git rev-list --count HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make -C pentadactyl xpi
}

package() {
  cd "$srcdir/$pkgname"
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' pentadactyl/install.rdf)
  local emversion=$(sed -n -e '/<\?em:version>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' pentadactyl/install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  [ -n ${emversion} ] || return 1
  install -d $dstdir
  unzip -d $dstdir "downloads/pentadactyl-${emversion}.xpi"
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}
