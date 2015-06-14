# vim:set ts=4 sts=2 sw=2 et ai si:
# Maintainer: Marti Raudsepp <marti@juffo.org>
# Maintainer: Glennie Vignarajah <glennie@glennie.fr>

pkgname=tinyca2
pkgver=0.7.5
pkgrel=2
pkgdesc="Simple graphical user interface to manage a small CA (Certification Authority)"
arch=(i686 x86_64)
url="http://tinyca.sm-zone.net/"
license=('GPL') # GPLv2+
depends=(gtk2-perl perl-locale-gettext openssl)
optdepends=('zip')
source=("$pkgname::git://github.com/glennie/tinyca2"
        fix-tinyca-paths.patch
        stolen-from-debian.patch)

md5sums=('SKIP'
         'd0b8fc9e3fc312ed9fbd98bf2dacbfea'
         'd5ad0010db954820837a3d09c90d018d')

pkgver() {
  echo $pkgver
}

prepare() {
#{{{
  cd ${srcdir}
  for PATCH in $(ls *.patch); do
    patch -p0 < ${PATCH} || exit 2
  done
}
#}}}

build() {
#{{{
  cd ${srcdir}/${pkgname}
  ./install.sh
}
#}}}

package() {
#{{{
  cd ${srcdir}/${pkgname}
  mkdir -p ${pkgdir}/usr/lib/tinyca2
  cp -R lib/* ${pkgdir}/usr/lib/tinyca2/ || return 1
  mkdir -p ${pkgdir}/usr/share/locale
  cp -R locale/* ${pkgdir}/usr/share/locale/ || return 1

  mkdir -p ${pkgdir}/etc/tinyca2
  cp templates/* ${pkgdir}/etc/tinyca2/ || return 1
  mkdir -p ${pkgdir}/usr/bin/
  cp tinyca2 ${pkgdir}/usr/bin/ || return 1
  mkdir -p ${pkgdir}/usr/share/applications/
  cp tinyca2.desktop ${pkgdir}/usr/share/applications/ || return 1

  mkdir -p $pkgdir/usr/share/man/man1
  gzip -c tinyca2.1.man > ${pkgdir}/usr/share/man/man1/tinyca2.1.gz || return 1
}
#}}}
