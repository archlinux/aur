# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.9.3
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib' 'fwupdate' 'colord')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml'
	'openjade' 'opensp' 'meson' 'perl-sgmls' 'efivar' 'valgrind'
	'gobject-introspection' 'libgpg-error')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
	"0001-trivial-Fix-missing-test-files.patch")
sha256sums=('56840998a4a7757ac93732c4a51e203e1fef1497dc98ebc175310b132da2a2cc'
            'ee2bb86e1efaff2d4ca3f2ed55fd8b685cba2cb40debf1418d4e91e27dba00a7')

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
