# Contributor: jchamplin <jake.champlin.27@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=abiword-minimal
pkgver=3.0.2
pkgrel=1
pkgdesc="A fully-featured word processor"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.abisource.com"
makedepends=('boost')
depends=('fribidi' 'wv' 'enchant' 'desktop-file-utils' 'goffice' 'libical' 'redland' 'libchamplain')
conflicts=('abiword' 'abiword-plugins')
provides=('abiword')
options=('!makeflags' '!libtool')
source=("http://www.abisource.com/downloads/abiword/${pkgver}/source/abiword-${pkgver}.tar.gz"
	'abiword-3.0.0-librevenge.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/abiword-3.0.0-librevenge.patch?h=packages/abiword'
	'abiword-3.0.1-libwps-0.4.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/abiword-3.0.1-libwps-0.4.patch?h=packages/abiword'
	'aiksaurus-plugin.m4::https://git.archlinux.org/svntogit/packages.git/plain/trunk/aiksaurus-plugin.m4?h=packages/abiword'
	'command-plugin.m4::https://git.archlinux.org/svntogit/packages.git/plain/trunk/command-plugin.m4?h=packages/abiword'
	'python-override.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/python-override.patch?h=packages/abiword'
        'bug13815.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/bug13815.patch?h=packages/abiword')
md5sums=('cda6dd58c747c133b421cc7eb18f5796'
         '6fc2d653d3b814bbfd9b0d71c69c4796'
         'd7fd4dfc77879781883f48c63f979dac'
         '8d780c2559a18d0dad5a02b11932b88c'
         '06131a46d9d537249db0d107296f4a4e'
         'bf7ed8608b790886433c1f2cc23348ce'
         '385e359cc05e149b0d56e8bb59048b4a')

prepare() {
  cd "${srcdir}/abiword-${pkgver}"

  # fix build with librevenge based import filters
  patch -Np0 -i "${srcdir}"/abiword-3.0.0-librevenge.patch

  # Fix libwpd 0.4 detection
  patch -Np1 -i "${srcdir}"/abiword-3.0.1-libwps-0.4.patch
  
  # Fix python override code to work with Python 3.x
  patch -Np1 -i "${srcdir}"/python-override.patch

  # Fix black on black (FS#51667)
  # http://bugzilla.abisource.com/show_bug.cgi?id=13815
  patch -Np1 -i "${srcdir}"/bug13815.patch

  # Install missing m4 files
  install -m644 "${srcdir}"/aiksaurus-plugin.m4 plugins/aiksaurus/plugin.m4
  install -m644 "${srcdir}"/command-plugin.m4 plugins/command/plugin.m4

  # Generate m4 file for configure
  find plugins -name plugin.m4 | xargs cat > plugin-configure.m4

  libtoolize --force
  autoreconf -fi
}

build() {
  cd "${srcdir}/abiword-${pkgver}"
  ./configure --prefix=/usr --enable-clipart --enable-templates \
	      --without-gnomevfs --with-gio --disable-default-plugins \
	      --disable-builtin-plugins --disable-static \
	      --with-psiconv-config=/nothere --with-goffice \
	      --enable-plugins="opendocument openwriter openxml pdf goffice"
  make
}

package() {
  cd "${srcdir}/abiword-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
