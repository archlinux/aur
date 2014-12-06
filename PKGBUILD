# Contributor & Maintainer: Stunts <f.pinamartins@gmail.com>
# Contributor: machoo02 <ichthyoboy@gmail.com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=bibus
pkgver=1.5.2
pkgrel=5
pkgdesc="A bibliographic database that can directly insert references in \
OpenOffice.org/LibreOffice and generate the bibliographic index."
url="http://sourceforge.net/projects/bibus-biblio/"
license="GPL"
arch=('any')
depends=('python2-pysqlite' 'wxpython' 'python2-lxml' 'unixodbc' 'hicolor-icon-theme')
optdepends=('libreoffice' 'openoffice-base-bin')
source=(http://downloads.sourceforge.net/project/$pkgname-biblio/$pkgname-biblio/${pkgname}-${pkgver}/${pkgname}_${pkgver}.orig.tar.gz)
md5sums=('5bb8b26d0980ebb72a2882b618fbe62c')
install=${pkgname}.install
backup=(etc/bibus.config)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ -d /usr/lib/libreoffice ]]; then
	export oopath=/usr/lib/libreoffice/program
	export ooure=/usr/lib/libreoffice/program
	export oobasis=/usr/lib/libreoffice/program
  elif [[ -d /opt/openoffice.org3 ]]; then
	export oopath=/opt/openoffice.org3/program
	export ooure=/opt/openoffice.org3/program
	export oobasis=/opt/openoffice.org3/program
  fi

  make -f Setup/Makefile DESTDIR="$pkgdir/usr" python=/usr/bin/python2 \
        sysconfdir="$pkgdir/etc" oopath=$oopath ooure=$ooure oobasis=$oobasis install
  rm "$pkgdir/usr/bin/bibus"
  ln -s /usr/share/bibus/bibusStart.py "$pkgdir/usr/bin/bibus"
  rm "$pkgdir/usr/share/bibus/Setup/uninstall.sh"
  
  ## Fix .py files for python2 and DOS line breaks
  sed -i -e "s|\x0D$||" \
      -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find $pkgdir -name '*.py')
  
  ## Fix paths in config file
  sed -i -e "s|${pkgdir}||g" "${pkgdir}/usr/share/bibus/bibus.cfg" 
}

