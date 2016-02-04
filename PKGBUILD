# Contributor: Jozef Riha <jose1711 at gmail dot com>
# Updated by Manuel Conzelmann, changed to non-branded software
# Updated by Zoe <chp321 at gmail dot com>, for french version
# Maintainer: zoe <chp321@gmail.com>

pkgname=cewe-monlivrephoto
pkgver=6.0.5
pkgrel=1
pkgdesc="Création off-line de livres photos, commandables ensuite en ligne auprès de la FNAC"
url="http://www.livrephoto-cewe.fr/"
license=("custom:eula")
depends=('libx11' 'libjpeg' 'curl' 'wget')
makedepends=('unzip')
conflicts=('cewe-fotobuch')
arch=('i686' 'x86_64')
source=("http://dls.photoprintit.com/download/Data/18455/hps/setup_Atelier_Photo_FNAC.tgz"         
"$pkgname.desktop" "$pkgname.install")
install=$pkgname.install
# setup_Atelier_Photo_FNAC.tgz (script perl) is versatile too much, so it is better to skip its md5sum :
md5sums=(SKIP 'a6b82116c19dcca0b5d8ac74707d8938' '82baecba5be4c2af0cccf0f5bc0e00c7')

package() {
        cd $srcdir
        mkdir -p $pkgdir/usr/{share/$pkgname,bin}
        ./install.pl --installDir=$pkgdir/usr/share/$pkgname --workingDir=$srcdir -k -v
        # create startup script
        (echo "#!/bin/bash
cd /usr/share/$pkgname
./$pkgname \"\$@\"") > $pkgdir/usr/bin/$pkgname
        chmod 755 $pkgdir/usr/bin/$pkgname
        # utf-8 and space in executable filenames is generally a bad idea
        cd $pkgdir/usr/share/$pkgname
        mv "Atelier Photo FNAC" "$pkgname"
        # create desktop shortcut
        install -D -m644 $pkgdir/usr/share/$pkgname/Resources/keyaccount/32.xpm $pkgdir/usr/share/pixmaps/$pkgname.xpm && \
        install -D -m644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop || return 1
}
