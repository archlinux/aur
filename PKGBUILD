#Maintainer: M0Rf30

pkgname=openbazaar
pkgver=0.5.0
pkgrel=1
pkgdesc="Decentralized marketplace for instantly trading with anyone using Bitcoin"
arch=(any)
url="http://openbazaar.org"
license=('MIT')
depends=(
	    curl
           #gnupg1
	    jquery
            python2-bitcoin
            python2-dnschain
            python2-gnupg-hg
            python2-ipy
            python2-miniupnpc
            python2-obelisk
            python2-pillow
            python2-psutil
            python2-pycountry
            python2-pyee
            python2-pyelliptic
            python2-pystun
            python2-qrcode
            python2-requests
            python2-rfc3986
            python2-tornado
)
optdepends=('pybitmessage: Send and receive messages to anyone on the bitmessage network')
source=(https://github.com/OpenBazaar/OpenBazaar/archive/v${pkgver}.tar.gz
	$pkgname.service
	$pkgname.sh
        $pkgname.conf
	#gnupg1.patch
)
backup=('etc/openbazaar.conf')
install=$pkgname.install
options=('!strip')
conflicts=($pkgname-git)

package(){
  cd $srcdir/OpenBazaar-$pkgver

  # msg2 "Patch against Gnupg2"
  # patch -Np1 -i ../gnupg1.patch

   msg2 "Install systemd service"
   install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service

   msg2 "Install $pkgname sample conf in /etc/$pkgname.conf"
   install -Dm644 $srcdir/$pkgname.conf $pkgdir/etc/$pkgname.conf

   msg2 "Install $pkgname scripts"
   install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname

   msg2 "Create folder for user $pkgname"
   cd installers/ubuntu
   cat build | head -n -2 > create_folders
   python2 create_folders
   install -dm755 $pkgdir/var/lib/

   cp -r output/usr/share/$pkgname $pkgdir/var/lib/
   cp -r $srcdir/OpenBazaar-$pkgver/rudp $pkgdir/var/lib/$pkgname

   msg2 "Jquery symlink"
   ln -s -r /usr/share/jquery/jquery.min.js $pkgdir/var/lib/$pkgname/html/vendors

   msg2 "Python2 bytecode generation"
   cd $pkgdir/var/lib/$pkgname/ && python2 -m compileall .
}

md5sums=('a593fb885847b7f4ac27a717c191179f'
         '1d1e3933c4fd26f565e47f475eede2b4'
         '87ad334f35bce82931151fa94c06bab1'
         '0741fc4c68e499b10cbf272f27efd3a0')
