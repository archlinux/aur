# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Stunts <f.pinamartins@gmail.com>
# Contributor: machoo02 <ichthyoboy@gmail.com>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=bibus
pkgver=1.5.2
pkgrel=7
pkgdesc="A bibliographic database that can directly insert references in \
OpenOffice.org/LibreOffice and generate the bibliographic index."
url="http://sourceforge.net/projects/bibus-biblio/"
license=('GPL')
arch=('any')
depends=('python2-pysqlite' 'wxpython' 'python2-lxml' 'unixodbc' 'hicolor-icon-theme')
optdepends=('libreoffice' 'openoffice')
source=(https://downloads.sourceforge.net/project/$pkgname-biblio/$pkgname-biblio/${pkgname}-${pkgver}/${pkgname}_${pkgver}.orig.tar.gz)
sha512sums=('33d091dacc707859a11010fcba57691a3e2726ae7579d601720b4398f7be29b580be978da8cd058fab491ec5b52dd3ce33c964a8d5077f8e80d8f0f387ffa2c4')
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

