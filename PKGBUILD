# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: orbisvicis <orbisvicis at gmail dot com>

pkgname=openstreetmap-map-icons-svn
pkgver=31588
pkgrel=1
pkgdesc="A set of public domain licensed map icons for general OSM use"
arch=("any")
url="http://wiki.openstreetmap.org/wiki/Map_Icons"
license=('custom:CCPL:by-sa' 'LGPL')
makedepends=('subversion' 'perl' 'perl-file-slurp' 'perl-image-info'
	     'perl-xml-simple' 'perl-dbi' 'perl-xml-twig' 'imagemagick'
	     'perl-dbd-sqlite' 'libxslt' 'librsvg' 'cmake' 'optipng')
source=("$pkgname::svn+http://svn.openstreetmap.org/applications/share/map-icons/#revision=$pkgver")
md5sums=('SKIP')

build() {
  cd "${srcdir}/$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "${srcdir}/$pkgname"

  install -dm755 "${pkgdir}/usr/share/icons/map-icons/"
  install -Dm644 icons.xml "${pkgdir}/usr/share/icons/map-icons/"
  install -Dm644 icons.dtd "${pkgdir}/usr/share/icons/map-icons/"
  ( cd "${pkgdir}/usr/share/icons/map-icons/" && perl "${srcdir}/$pkgname/tools/create_geoinfo-db.pl" --lang=en --source=icons.xml )
  ( cd "${pkgdir}/usr/share/icons/map-icons/" && perl "${srcdir}/$pkgname/tools/create_geoinfo-db.pl" --lang=de --source=icons.xml )
  perl "${srcdir}/$pkgname/tools/compile_icons.pl" --dst-dir "${pkgdir}/usr/share/icons/map-icons/"
  ( cd "${pkgdir}/usr/share/icons/map-icons/" && perl "${srcdir}/$pkgname/tools/create_overview.pl" -l -r -P "overview_lic" )
  ( cd "${pkgdir}/usr/share/icons/map-icons/" && perl "${srcdir}/$pkgname/create_icons_index.pl" -r )

  #
  # Documentation
  #
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname%-svn}/"
  install -Dm644 README README.icons "${pkgdir}/usr/share/doc/${pkgname%-svn}/"
  mv "${pkgdir}/usr/share/icons/map-icons/"*.html "${pkgdir}/usr/share/doc/${pkgname%-svn}/"

  #
  # Licenses
  #
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname%-svn}/"
  # License file included with svg-twotone
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname%-svn}/svg-twotone/"
  install -Dm644 "svg-twotone/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname%-svn}/svg-twotone/";
  # Many included svg/png images contain licensing metadata

  # fix broken icons
  find "$pkgdir" -name '*.png' -exec optipng -quiet -force -fix {} \;
}
