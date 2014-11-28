# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Fubar

pkgname=adesklets
pkgver=0.6.1
pkgrel=12
pkgdesc="An imlib2-based system to have interactive 'desklets'."
arch=('i686' 'x86_64')
url="http://adesklets.sourceforge.net/"
license=('GPL2')
depends=('imlib2' 'fontconfig' 'python2' 'perl' 'ttf-bitstream-vera' 'libx11')
install=$pkgname.install
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
        fontconfig-2.4.patch posix_signal.patch)
md5sums=('cd390c9398449c5566033e2e4792bccb'
         '0374aec97670c90713fcabc2710e2160'
         'd9ac15cc92f833f2446218e487e6c607')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/posix_signal.patch"

  #patch for fontconfig => 2.4
  patch -Np0 -i "${srcdir}/fontconfig-2.4.patch"

  autoreconf
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr

  #makefile Fix
  sed -i 's/\/bin\/sh//' doc/Makefile

  #python2 fix
  for file in checkin installer submit; do
      sed -i 's_/usr/bin/env python_/usr/bin/env python2_' utils/${pkgname}_${file}
  done

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" INSTALLDIRS=vendor install

  #remove the font stuff
  rm -f "${pkgdir}"/usr/share/adesklets/{FONT_LICENSE,Vera.ttf}

  find "${pkgdir}" -name '.packlist' -exec rm  '{}' \;
  find "${pkgdir}" -name 'perllocal.pod' -exec rm  '{}' \;
}
