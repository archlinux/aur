# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

_mintrel=betsy
pkgname=nemo-dropbox
pkgver=3.0.0
pkgrel=1
pkgdesc="Dropbox for Linux - Nemo extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('libnotify' 'nemo>=3.0' 'nemo<3.1' 'hicolor-icon-theme' 'dropbox')
makedepends=('python2-docutils' 'python2' 'pygtk')
conflicts=('nautilus-dropbox' 'caja-dropbox')
install=${pkgname}.install
options=('!libtool' '!emptydirs')

source=("http://packages.linuxmint.com/pool/main/n/$pkgname/${pkgname}_${pkgver}%2b${_mintrel}.tar.gz")
#http://packages.linuxmint.com/pool/main/n/$pkgname/$pkgname_$pkgver%2b$_mintrel.tar.gz
md5sums=('725d19b9fa05fad32daa9ca5affb29c4')

build() {
  cd ${pkgname}-${pkgver}+${_mintrel}

#  sed -i "s|AM_CONFIG_HEADER|AC_CONFIG_HEADERS|g" configure.in

  autoreconf -fi

  sed -i "s/python/python2/" configure dropbox.in Makefile.in rst2man.py
  
  # since python2-docutils, rst2man.py is named "rst2man2.py"
  sed -i "s:rst2man.py:/usr/bin/rst2man2.py:" configure

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${pkgname}-${pkgver}+${_mintrel}
  make DESTDIR="${pkgdir}" install
  # remove executables and depend on 'dropbox' package
  rm "${pkgdir}/usr/bin/dropbox"
  rm "${pkgdir}/usr/share/applications/dropbox.desktop"  
  rm "${pkgdir}/usr/share/man/man1/dropbox.1"
  # install the common license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

