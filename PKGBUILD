# Maintainer: David Hill <davidph55@verizon.net>

pkgname=gdcc
pkgver=0.16.1
pkgrel=1
pkgdesc="Game Data Compiler Collection"
arch=('i686' 'x86_64')
url="http://github.com/DavidPH/GDCC"
license=('GPL2')
depends=('gmp')
makedepends=('git' 'cmake' 'asciidoc')
source=("${pkgname}"::git+https://github.com/DavidPH/GDCC.git#tag=v"${pkgver}")
sha256sums=('SKIP')

build()
{
   mkdir -p build
   cd build

   cmake ../"${pkgname}" \
      -DCMAKE_BUILD_TYPE=release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DGDCC_INSTALL_API=ON

   make
}

package()
{
   cd build
   make PREFIX=/usr DESTDIR="${pkgdir}" install

   # Set library path so that data can be generated from binaries.
   export LD_LIBRARY_PATH="${pkgdir}"/usr/lib:"${LD_LIBRARY_PATH}"

   # Generate man pages.
   mkdir -p "${pkgdir}"/usr/share/man/man1
   cd "${pkgdir}"/usr/share/man/man1
   for prog in acc ar-wad as cc cpp irdump ld makelib ntsc
   do
      "${pkgdir}"/usr/bin/gdcc-"${prog}" --help-adoc >gdcc-"${prog}".1.txt
      a2x --doctype manpage --format manpage gdcc-"${prog}".1.txt
      rm gdcc-"${prog}".1.txt
   done
}

# EOF

