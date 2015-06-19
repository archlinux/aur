# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=winexe
pkgver=1.00
pkgrel=5
pkgdesc="Remotely execute commands on Windows NT/2000/XP/2003 systems"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/winexe/"
license=('GPL3')
depends=('gnutls' 'libsasl' 'popt' 'talloc' 'tdb')
makedepends=('python2')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "getopts.patch"
        "gnutls.patch"
        "gnutls-priority.patch"
        "pidl.patch")
md5sums=('48325521ddc40d14087d1480dc83d51e'
         '30ca08fe03518e9428799187159c78f4'
         '201d74de823b8b07195a62a5c9e1bfdf'
         '922f19f7156e9663659b8b51327222cd'
         '486d86e0f181a844ddbf1e6267098ef3')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/pidl.patch"  
  cd "source4"
  patch -Np1 -i "${srcdir}/getopts.patch"
  patch -Np2 -i "${srcdir}/gnutls.patch"
  patch -Np2 -i "${srcdir}/gnutls-priority.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/source4"
  ./autogen.sh
  PYTHON_VER=2 ./configure --enable-fhs --prefix=/usr
  make basics
  make bin/winexe
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/source4"
  install -D -m755 bin/winexe "${pkgdir}/usr/bin/winexe"
}

# vim:set ts=2 sw=2 et:
