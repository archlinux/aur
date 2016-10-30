# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.7.5
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.10' 'fwupdate' 'libsoup' 'colord')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml' 'openjade' 'opensp' 'perl-sgmls' 'autoconf-archive')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8e63daddc3f582a951a0602c4e2753bd241a9bf05f5a6cea37ba9f0b7dbedc0d')

# hack for docbook2man to find sgmlspl
prepare() {
  mkdir "${srcdir}/bin"
  ln -s /usr/bin/vendor_perl/sgmlspl.pl "${srcdir}/bin/sgmlspl"
  export PATH="$PATH:${srcdir}/bin"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var \
               --libexecdir=/usr/lib/fwupd \
               --enable-uefi \
               --enable-colorhug \
               --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
