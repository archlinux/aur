#Maintainer: M0Rf30

_pkgname=openbazaar
pkgname=${_pkgname}-git
pkgver=4073.837b466
pkgrel=1
pkgdesc="A decentralized marketplace proof of concept. It is based off of the POC code by the darkmarket team and protected by the GPL"
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

makedepends=(git)
optdepends=('pybitmessage-git: Send and receive messages to anyone on the bitmessage network')
source=("${_pkgname}::git+https://github.com/OpenBazaar/OpenBazaar.git#branch=develop"
	 ${_pkgname}.service
	 ${_pkgname}.sh
	 ${_pkgname}.conf
#	 gnupg1.patch
)
backup=('etc/openbazaar.conf')
install=${_pkgname}.install
options=('!strip')
provides=(${_pkgname})
replaces=(${_pkgname})

package(){
  cd $srcdir/${_pkgname}

 # msg2 "Patch against Gnupg2"
 # patch -Np1 -i ../gnupg1.patch

  msg2 "Install systemd service"
  install -Dm644 $srcdir/${_pkgname}.service $pkgdir/usr/lib/systemd/system/${_pkgname}.service

  msg2 "Install ${_pkgname} sample conf in /etc/${_pkgname}.conf"
  install -Dm644 $srcdir/${_pkgname}.conf $pkgdir/etc/${_pkgname}.conf

  msg2 "Install ${_pkgname} scripts"
  install -Dm755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}

  msg2 "Create folder for user ${_pkgname}"
  cd installers/ubuntu
  cat build | head -n -2 > create_folders
  python2 create_folders
	install -dm755 $pkgdir/var/lib/

  cp -r output/usr/share/${_pkgname} $pkgdir/var/lib/
  cp -r $srcdir/${_pkgname}/rudp $pkgdir/var/lib/${_pkgname}

  msg2 "Jquery symlink"
  ln -s -r /usr/share/jquery/jquery.min.js $pkgdir/var/lib/${_pkgname}/html/vendors

  msg2 "Python2 bytecode generation"
  cd $pkgdir/var/lib/${_pkgname}/ && python2 -m compileall .
}

pkgver() {
  cd ${_pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP'
         '1d1e3933c4fd26f565e47f475eede2b4'
         '87ad334f35bce82931151fa94c06bab1'
         '0741fc4c68e499b10cbf272f27efd3a0')
