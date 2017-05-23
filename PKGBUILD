# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.9.2
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.10' 'fwupdate' 'colord')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml'
	'openjade' 'opensp' 'meson' 'perl-sgmls' 'autoconf-archive' 'efivar' 'valgrind'
	'gobject-introspection')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a5a7a9886b0efbea57cbcbc841923a9272e4f26dd8658a8e1a90f6eec371cce1')

# hack for docbook2man to find sgmlspl
prepare() {
  mkdir -p "${srcdir}/bin"
  ln -s -f /usr/bin/vendor_perl/sgmlspl.pl "${srcdir}/bin/sgmlspl"
  export PATH="$PATH:${srcdir}/bin"
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
