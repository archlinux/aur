# Maintainer: Sebastian Lau <lauseb644 _at_ gmail.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=nemo-dropbox
pkgver=3.4.0
pkgrel=1
pkgdesc="Dropbox for Linux - Nemo extension"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('nemo>=3.2' 'dropbox' 'pygtk' 'python2-pygpgme')
makedepends=('python2-docutils' 'python2' 'pygtk' 'glib2')
conflicts=('nautilus-dropbox' 'caja-dropbox')
install=${pkgname}.install
options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
md5sums=('b8aff74acc98be098fe46a54dcb5c35f')

build() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

#  sed -i "s|AM_CONFIG_HEADER|AC_CONFIG_HEADERS|g" configure.in

  autoreconf -fi

  sed -i "s/python/python2/" configure dropbox.in Makefile.in rst2man.py

  # since python2-docutils, rst2man.py is named "rst2man2.py"
  sed -i "s:rst2man.py:/usr/bin/rst2man2.py:" configure

  PYTHON=python2 ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  make DESTDIR="${pkgdir}" install

  # remove executables and depend on 'dropbox' package
  rm "${pkgdir}/usr/bin/dropbox"
  rm "${pkgdir}/usr/share/applications/dropbox.desktop"
  rm "${pkgdir}/usr/share/man/man1/dropbox.1"

  # install the common license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
