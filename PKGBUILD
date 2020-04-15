# Maintainer: Gilles Hamel <hamelg@laposte.net>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname='mythweb-git'
br=fixes/31
t="${br#*/}+${br%/[0-9][0-9]}"
pkgver=31+fixes.20200303.d90538ce
pkgrel=1
arch=('any')
url="http://www.mythtv.org"
license=('GPL')
depends=("php" "perl-cgi")
optdepends=('lighttpd' 'php-apache')
pkgdesc="Web interface for the MythTV scheduler"
source=("git+https://github.com/MythTV/mythweb#branch=$br")
sha256sums=('SKIP')

conflicts=('mythplugins-mythweb')
replaces=('mythplugins-mythweb')

pkgver() {
  cd "$srcdir/mythweb"
  echo -n "$t.$(git show -s --format=%cd --date=short | tr -d -).$(git rev-parse --short=8 HEAD)"
}

prepare() {
  cd "$srcdir/mythweb"
  git clean -xfd

  sed -re 's@/usr/local.*/usr/share@/usr/share@' -i 'mythweb.php'
}

package() {
  mkdir -p "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
  cp -R "$srcdir/mythweb/"* "$pkgdir/var/lib/mythtv/mythweb"
  chown -R http:http "$pkgdir/var/lib/mythtv/mythweb"
  chmod g+rw "$pkgdir/var/lib/mythtv/mythweb"/{image_cache,php_sessions}
}

