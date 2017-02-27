# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.8.1
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.10' 'fwupdate' 'colord')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml' 'openjade' 'opensp' 
'perl-sgmls' 'autoconf-archive' 'efivar' 'valgrind')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('737dd0a5c85cba9b6fce1402e0987a6d25fb2668f9e9e7c3e6e79af6186c26c8')

# hack for docbook2man to find sgmlspl
prepare() {
  mkdir -p "${srcdir}/bin"
  ln -s -f /usr/bin/vendor_perl/sgmlspl.pl "${srcdir}/bin/sgmlspl"
  export PATH="$PATH:${srcdir}/bin"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var \
               --libexecdir=/usr/lib \
               --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
