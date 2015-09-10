# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.1.6
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.0' 'fwupdate')
makedepends=('docbook2x' 'intltool' 'perl-xml-sax-expat')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "docbook-sgml-arg.patch")
sha256sums=('83517547adf7fd09091fc63204906b44e960eb61e1aeb9d1da2e83a0c8fa1540'
            '9fc817a1d8c3d960e032a03f6ebe9b6d122175258e54129f0b3696d307f43a04')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../"${source[1]}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var \
               --libexecdir=/usr/lib/fwupd \
               --enable-colorhug \
               --enable-uefi \
               --enable-fwsignd \
               --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
