# Maintainer: Ilya Oshchepkov 
pkgname=glab
pkgver=2.2.8
pkgrel=1
pkgdesc="Interactive educational multipurpose package to process and analyse GNSS data"
arch=(i686 x86_64)
url="http://gage.upc.edu/drupal6/gLAB"
license=('Apache')
depends=('python2' 'python2-matplotlib' 'wxpython2.8' 'tk')
source=($pkgname.tgz::http://gage.upc.edu/sites/default/files/gLAB/src/LINUX/gLAB_2.2.8_Linux.tgz)
noextract=($pkgname.tgz)
md5sums=('a31b3a6e9a17fcd704eb090d00b9eb55')

build() {
    tar -xf $pkgname.tgz
    mv "$srcdir"/gLAB_2.2.8_Linux "$srcdir/$pkgname" 
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"

    install -dm755 "$pkgdir"/usr/bin/
    install -m755 gLAB_linux  "$pkgdir"/usr/bin/glab-dpc

    # fix python2
    sed -i 's/\#!\/usr\/bin\/python/\#!\/usr\/bin\/env python2/g' gLAB_GUI.py
    sed -i 's/\#!\/usr\/bin\/python/\#!\/usr\/bin\/env python2/g' graph.py

    # fix wxpython version
    sed -i '/import wx, wx.html/i\import wxversion\nwxversion.select("2.8")' gLAB_GUI.py

    # change the names for DAT and DPC
    sed -i 's/graph.py/glab-dat/g' gLAB_GUI.py
    sed -i 's/gLAB_linux/glab-dpc/g' gLAB_GUI.py

    install -m755 gLAB_GUI.py "$pkgdir"/usr/bin/glab
    install -m755 graph.py "$pkgdir"/usr/bin/glab-dat

    install -dm755 "$pkgdir"/usr/share/gLAB/

    # move all images
    install *.gif *.ico *.png "$pkgdir"/usr/share/gLAB/ 
}
