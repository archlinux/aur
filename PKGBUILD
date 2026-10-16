# Maintainer: MeaTLoTioN <ml@erb.pw>
# Contributor: felix
# Originally based on the cvs package from ABS
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=cvs-feature
pkgver=1.12.13
pkgrel=3
_debrel=31
pkgdesc="Concurrent Versions System - a source control system (\"feature\" release series, with Debian patches)"
arch=(i686 x86_64)
provides=(cvs)
conflicts=(cvs)
url="https://cvs.nongnu.org/"
license=('GPL-2.0-or-later')
depends=('krb5' 'zlib' 'libbsd')
optdepends=('openssh: for using cvs over ssh'
            'inetutils: for using cvs over rsh')
source=(
    https://ftp.gnu.org/non-gnu/cvs/source/feature/${pkgver}/cvs-${pkgver}.tar.bz2{,.sig}
    https://deb.debian.org/debian/pool/main/c/cvs/cvs_${pkgver}+real-${_debrel}.diff.gz
)
sha512sums=('7d10f808de62190b18d4f706d2d03ab218a508bfb52047ff3e830e293ec40c5e8bf6cc743ef72a5c24be5aa867c9e4892d7d475a026a98b296a3764b4bd0f4d8'
            'SKIP'
            '08615091443b38f6acb73958336bbd35e6e1c1b97d7258a107cac8bf93f8c0c006ae5307c614fddfb509b0e9808402fb7ea743663af84aa32661fd6645bed208')
validpgpkeys=('CB6A07CA90C54234E8A3C8D02C3D4E4C17F231A4') # Derek R. Price <moc tod toibmix ta kered>

prepare() {
  cd "${srcdir}/cvs-${pkgver}"
  patch -Np1 < ../cvs_${pkgver}+real-${_debrel}.diff
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
  find . -name Makefile.am | xargs sed -i -e 's/^INCLUDES/AM_CPPFLAGS/'
}

build() {
  cd "${srcdir}/cvs-${pkgver}"
  unset EDITOR VISUAL

  # 2005-era K&R-style code; GCC 15 defaults to C23
  CFLAGS+=" -std=gnu17 -D_GNU_SOURCE"

  AUTOMAKE='automake --add-missing' autoreconf
  ./configure LIBS="-lbsd" --prefix=/usr \
    --with-editor=/usr/bin/vi \
    --with-external-zlib
  make
}

package() {
  cd "${srcdir}/cvs-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/info/dir
}
