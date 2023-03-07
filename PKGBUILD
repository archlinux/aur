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

# noextract=('zork-mdl.zip')

package() {
    cd "${srcdir}"

    unzip zork-mdl.zip -d mdlzork
    patch -d mdlzork < confusion_mdlzork.diff

    cd mdlzork

    mkdir MDL
    mkdir MTRZORK

    PWD="/tmp"

    echo 'spawn mdli' > zorkfile
    echo 'expect "LISTENING"' >> zorkfile
    echo 'send "<FLOAD \"run.mud\">\r"' >> zorkfile
    echo 'expect "> "' >> zorkfile
    echo 'send "save\r"' >> zorkfile
    echo 'expect "Saving."' >> zorkfile

    expect zorkfile && rm zorkfile

    install -dm755 $pkgdir/usr/share/mdl-zork

    cd "${srcdir}"
    cp -r mdlzork/* $pkgdir/usr/share/mdl-zork

    # required for save & restore 
    # move to postinstall message
    chmod -R 777 $pkgdir/usr/share/mdl-zork/MTRZORK

    echo '#!/bin/sh' > $pkgname
    echo 'cd /usr/share/mdl-zork' >> $pkgname
    echo 'mdli -r MDL/MADADV.SAVE' >> $pkgname
    install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}
