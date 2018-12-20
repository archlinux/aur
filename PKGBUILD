# maintainer: lorelei <eel@sdf.org>

pkgname=zork
pkgver=0
pkgrel=5
pkgdesc="MDL Zork!"
arch=('any')
license=('none')
depends=('confusion' 'unzip')


_mirror=('http://mirrors.ibiblio.org/interactive-fiction')
source=('http://simh.trailing-edge.com/games/zork-mdl.zip'
	"${_mirror}/programming/mdl/interpreters/confusion/confusion_mdlzork.tgz"
	'http://eel.sdf.org/pit/madadv.diff')

md5sums=('7aa4b442c3e0a156b9517868a05231a4'
	 'f159bc65e1d12463981af5bd934cbb2f'
	 '08e37dc12377f230cc37e1e3b1f7a601')

noextract=('zork-mdl.zip')

package() {
    cd "${srcdir}"

    unzip zork-mdl.zip -d zrc
    patch -d zrc < confusion_mdlzork.diff
    mkdir zrc/MTRZORK
    mkdir zrc/MDL
    patch -d zrc/MDL < ../madadv.diff
    install -dm755 $pkgdir/usr/share/mdl-zork
    cp -r zrc/* $pkgdir/usr/share/mdl-zork

    # required for save & restore 
    chmod -R 777 $pkgdir/usr/share/mdl-zork/MTRZORK

    echo '#!/bin/sh' > $pkgname
    echo 'cd /usr/share/mdl-zork' >> $pkgname
    echo 'mdli -r MDL/MADADV.SAVE' >> $pkgname
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
