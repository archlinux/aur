# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.5.1
pkgrel=2
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.1' 'fwupdate' 'glib2>=2.45.8' 'libsoup>=2.51.92')
makedepends=('docbook2x' 'intltool' 'perl-xml-sax-expat')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "docbook-sgml-arg.patch"
	"fix-strerror-error.patch")
sha256sums=('9640a6099c6be03e335a527b864d058a2621202a3050a3d4f9180cc81ac928f0'
            '9fc817a1d8c3d960e032a03f6ebe9b6d122175258e54129f0b3696d307f43a04'
            '8e9904e080431294dc56cc408e2332add0d8fea90dbee865059c14cac8a2a7f7')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < ../"${source[1]}"
  patch -p1 < ../"${source[2]}"
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
