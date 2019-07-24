# Maintainer: David Hill <davidph55@verizon.net>
# Contributor: PkmX <pkmx.tw@gmail.com>

pkgname=gdcc-git
_pkgname=${pkgname/-git/}
pkgver=0.16.1.4.g66c69a77
pkgrel=1
pkgdesc="Game Data Compiler Collection"
arch=('i686' 'x86_64')
url="http://github.com/DavidPH/GDCC"
license=('GPL2')
depends=('gmp')
makedepends=('git' 'cmake' 'asciidoc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}"::git+https://github.com/DavidPH/GDCC.git)
sha256sums=('SKIP')

pkgver()
{
   cd "${_pkgname}"
   git describe --long | sed 's/v//;s/-/./g'
}

build()
{
   mkdir -p build
   cd build

   cmake ../"${_pkgname}" \
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

