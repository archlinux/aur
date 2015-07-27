# Maintainer: Ant1 <ant[dot]vand[at]gmail[dot]com>
# Contributor: flub <flub123[at]gmx[dot]de> 
# Contributor: Iosca <dvdios[at]aol[dot]com>
pkgname=fpdb
pkgver=0.40.5
_major=0.40
pkgrel=3
pkgdesc="An open source tracker/HUD for use with on-line poker."
url="http://sourceforge.net/projects/fpdb/"
arch=('x86_64' 'i686')
license=('AGPL' 'GPL')
depends=('pygtk' 'python2-matplotlib' 'python2-wnck' 'python2-numpy' 'python2-beautifulsoup3' 'pypoker-eval')
optdepends=('mariadb: mysql database'
            'mysql-python: mysql support'
            'postgresql: postgresql database'
            'python-psycopg2: postgresql support')
source=("http://sourceforge.net/projects/fpdb/files/fpdb/${_major}/${pkgname}-${pkgver}.tar.gz")
md5sums=('95d0527695437eeeb5f4e534b230ebb0')
sha512sums=('f3c9418df51aeaf29bb99c848f1c2b30e8be5198027d3dcd10181400473637c9fdd9eb4bb1ccb2a06d5db8f8d363b4ef832c7c5cb4357ea63c17d13ac3cf4eb7')
package() {

  # building... setup requires ${pkgdir} which is no longer available in build()
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  sed -i 's|Terminal=true|Terminal=false|g' files/fpdb.desktop
  
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  cp -r "gfx" "${pkgdir}/usr/lib/python2.7/site-packages/"
  cp "pyfpdb/HUD_main.pyw" "${pkgdir}/usr/lib/python2.7/site-packages/fpdb/"
  cp "pyfpdb/fpdb.pyw" "${pkgdir}/usr/lib/python2.7/site-packages/fpdb/"
  cd "${pkgdir}/usr/lib/python2.7/site-packages/fpdb/"
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/python2|g' *.py
  sed -i 's|#!/usr/bin/env python|#!/usr/bin/python2|g' *.pyw
  chmod +x "fpdb.pyw"

  # packaging
  mkdir "${pkgdir}/usr/bin"
  ln -s "../lib/python2.7/site-packages/fpdb/fpdb.pyw" "${pkgdir}/usr/bin/fpdb"
}
