# Maintainer: Cooper Pierce <cppierce@andrew.cmu.edu>
# Contributor: Derek Brown <derekbro@andrew.cmu.edu>
pkgname=c0-bin
pkgver=0.771
pkgrel=1
pkgdesc="A small safe subset of the C programming language, augmented with contracts"
url="http://c0.cs.cmu.edu"
arch=('x86_64' 'i686')
license=('MIT')
depends=('libpng>=1.2' 'zlib>=1.2' 'gcc>=5.1' 'ncurses5-compat-libs>=6.0')
conflicts=('c0' 'c0-git')
provides=('cc0')
source=("$pkgname::https://c0.cs.cmu.edu/downloads/aux/cc0-r771.tgz" "fno-common.patch")
md5sums=('e03e3c90b07603d899acedfc445faaf4'
         '41a1d89191c6420779cf05a1f55339ab')

prepare() {
    cd "cc0.r771"
    patch --forward --strip=1 --input="${srcdir}/fno-common.patch"
}

package() {
  # Create Installation Folder Structure
  mkdir -p ${pkgdir}/usr/lib/c0
  cp -r ${srcdir}/cc0.r771/* ${pkgdir}/usr/lib/c0

  mkdir -p ${pkgdir}/usr/bin

  bins=('cc0' 'coin' 'codex' 'wrappergen')
  for bin in "${bins[@]}"; do
      chmod +x ${pkgdir}/usr/lib/c0/bin/${bin}.bin
      echo -e "#!/bin/sh\n/usr/lib/c0/bin/${bin}.bin \$@" >> ${pkgdir}/usr/bin/${bin}
      chmod +x ${pkgdir}/usr/bin/${bin}
  done
}
