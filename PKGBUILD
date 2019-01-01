# maintainer: lorelei <eel@sdf.org>

pkgname=zork
pkgver=1981
pkgrel=1
pkgdesc="MDL Zork!"
license=('none')
arch=('any')
depends=('confusion')
makedepends=('expect' 'unzip')

_mirror=('http://mirrors.ibiblio.org/interactive-fiction')
source=('http://simh.trailing-edge.com/games/zork-mdl.zip'
	"${_mirror}/programming/mdl/interpreters/confusion/confusion_mdlzork.tgz")

md5sums=('7aa4b442c3e0a156b9517868a05231a4'
	 'f159bc65e1d12463981af5bd934cbb2f')

noextract=('zork-mdl.zip')

package() {
    cd "${srcdir}"

    unzip zork-mdl.zip -d foo
    patch -d foo < confusion_mdlzork.diff

    mkdir foo/{MDL,MTRZORK}

    ./zork.ex

    cp -r foo/* $pkgdir/usr/share/mdl-zork
    install -dm755 $pkgdir/usr/share/mdl-zork

    # required for save & restore 
    chmod -R 777 $pkgdir/usr/share/mdl-zork/MTRZORK

    echo '#!/bin/sh' > $pkgname
    echo 'cd /usr/share/mdl-zork' >> $pkgname
    echo 'mdli -r MDL/MADADV.SAVE' >> $pkgname

    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
