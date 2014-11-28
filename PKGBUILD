# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=transolution
pkgver=0_4b8
pkgrel=1
pkgdesc="Computer Aided Translation (CAT) suite supporting the XLIFF standard"
arch=('any')
url="http://sourceforge.net/projects/eviltrans/"
license=('GPL')
depends=('python2' 'pygtk' 'desktop-file-utils' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('4suite')
install=$pkgname.install
source=($pkgname.zip::http://bitbucket.org/fredrik_corneliusson/$pkgname/get/d91da181993c.zip \
        $pkgname.desktop)
sha256sums=('f8bb8a45d79212d649d619991eb5e3800142a79f68e73e3a20dafa251d905d11'
            '672bf984c3d12b3bf967d3980ea591c22c710f4a5bb80ffe33753f9d904238d5')

package() {
  cd ${srcdir}/fredrik_corneliusson-transolution-*

  install -d ${pkgdir}/usr/share/$pkgname \
             ${pkgdir}/usr/bin \
             ${pkgdir}/usr/share/$pkgname/filters

  cp -r * ${pkgdir}/usr/share/$pkgname
  rm ${pkgdir}/usr/share/$pkgname/*{bat,txt,ico,png}
  find ${pkgdir}/usr/share/$pkgname/$pkgname -type f -exec chmod 644 "{}" \;
  install -D -m644 readme.txt ${pkgdir}/usr/share/$pkgname/README

#links to run files
  for i in *.py
    do ln -s /usr/share/$pkgname/$i ${pkgdir}/usr/bin/$i
  done

#icons and .desktop file
  install -D -m644 icon_16x16.png \
    ${pkgdir}/usr/share/icons/hicolor/16x16/apps/$pkgname.png
  install -D -m644 icon_32x32.png \
    ${pkgdir}/usr/share/icons/hicolor/32x32/apps/$pkgname.png
  install -D -m644 ${srcdir}/$pkgname.desktop \
    ${pkgdir}/usr/share/applications/$pkgname.desktop

# python2 fix
  cd ${pkgdir}/usr/share/transolution
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

#make executable
  cd ${pkgdir}/usr/share/$pkgname/
  for i in *.py
    do chmod +x $i
  done

#links to filter files for easy use
  cd ${pkgdir}/usr/share/$pkgname/$pkgname/filters/filter_settings
  for i in *.ini
    do ln -s /usr/share/$pkgname/$pkgname/filters/filter_settings/$i \
      ${pkgdir}/usr/share/$pkgname/filters/$i
  done

  rm ${pkgdir}/usr/{bin/win_setup.py,share/$pkgname/win_setup.py}
}
