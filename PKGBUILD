# Contributor: zlowly <zlowly@gmail.com>
pkgname=wqy-zenhei-nightly_build
_pkgname=wqy-zenhei
pkgver=0.9.47
pkgrel=2
pkgdesc="A Hei Ti Style (sans-serif) Chinese Outline Font. This is a nightly-build version."
arch=(any)
license=('GPL2' 'custom:"font embedding exception"')
install=${pkgname}.install
url="http://wenq.org"
depends=('fontconfig' 'xorg-font-utils')
optdepends=('zenity: configuration gui support')
conflicts=('wqy-zenhei')
provides=('wqy-zenhei')
source=("http://wenq.org/daily/zenhei/$_pkgname-$pkgver-nightlybuild.tar.gz"
"44-wqy-zenhei.conf")
md5sums=(SKIP 'bd2d5dd235260fce873a6eeb513ac3ef')

build() {
  cd $srcdir/${_pkgname}
  tail README --lines=15|head --lines=-2>| FONTEXCEPTION
  if [ -f i18n/en/wqy-zenhei.* ]; then
    sed -i 's/TEXTDOMAIN=wqy-zenhei-cfg/TEXTDOMAIN=wqy-zenhei/' ${_pkgname}-cfg
  fi
}
package() {
  cd $srcdir/${_pkgname}/
  install -d $pkgdir/usr/share/fonts/wenquanyi/${_pkgname}/
  install -d $pkgdir/etc/fonts/{conf.avail,conf.d}
  install -d $pkgdir/usr/bin/
  install -d $pkgdir/usr/share/{pixmaps,applications,locale}
  install -m644 -D FONTEXCEPTION $pkgdir/usr/share/licenses/${_pkgname}/FONTEXCEPTION || return 1
  install -m644 *.ttc $pkgdir/usr/share/fonts/wenquanyi/${_pkgname}/ || return 1
  install -m644 pixmap/* $pkgdir/usr/share/pixmaps || return 1
  install -m644 *.desktop $pkgdir/usr/share/applications || return 1
  install -m644 43-wqy-zenhei-sharp.conf $pkgdir/etc/fonts/conf.avail/ || return 1
  install -m755 zenheiset ${_pkgname}-cfg $pkgdir/usr/bin/ || return 1
  install -m644 $srcdir/44-wqy-zenhei.conf $pkgdir/etc/fonts/conf.avail/ || return 1
  for _lang in `ls -1 i18n | sed -e 's/^i18n\///g'`
  do
    if [ -f i18n/${_lang}/*.mo ]; then
      install -d $pkgdir/usr/share/locale/${_lang}/LC_MESSAGES
      install -m644 i18n/${_lang}/*.mo $pkgdir/usr/share/locale/${_lang}/LC_MESSAGES/
    fi
  done
  cd $pkgdir/etc/fonts/conf.d/
  ln -s ../conf.avail/44-wqy-zenhei.conf .
}
# vim:set ts=2 sw=2 et:
