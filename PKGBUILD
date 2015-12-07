# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.5.4
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.2' 'fwupdate' 'libsoup')
makedepends=('docbook2x' 'intltool' 'perl-xml-sax-expat')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "docbook-sgml-arg.patch")
sha256sums=('e321acea03cb0558edc39e8aa9c0aec6dec7d4162194d665922e873d26849a34'
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
