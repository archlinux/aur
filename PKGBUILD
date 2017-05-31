# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.9.2
pkgrel=2
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.10' 'fwupdate' 'colord')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml'
	'openjade' 'opensp' 'meson' 'perl-sgmls' 'efivar' 'valgrind'
	'gobject-introspection' 'libgpg-error')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"0001-Remove-lib-prefix-when-looking-for-libraries.patch")
sha256sums=('a5a7a9886b0efbea57cbcbc841923a9272e4f26dd8658a8e1a90f6eec371cce1'
            'c8e6f91ca1d3ae60b201ee58f58e9037f9b477f41734ef2c3d9fe4ab5d048411')

prepare() {
# hack for docbook2man to find sgmlspl
  mkdir -p "${srcdir}/bin"
  ln -s -f /usr/bin/vendor_perl/sgmlspl.pl "${srcdir}/bin/sgmlspl"
  export PATH="$PATH:${srcdir}/bin"
  
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ${srcdir}/${source[1]}
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  meson --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib \
        --buildtype=plain \
        "${srcdir}/build"

  ninja -v -C "${srcdir}/build"
}

check() {
  ninja -C "${srcdir}/build" test
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
}
