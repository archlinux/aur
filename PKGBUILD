# Maintainer: felix
# Originally based on the cvs package from ABS
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>
# Contributor: MeaTLoTioN <ml@erb.pw>

pkgname=cvs-feature
pkgver=1.12.13
pkgrel=2
pkgdesc="Concurrent Versions System - a source control system (\"feature\" release series, with Debian patches)"
arch=(i686 x86_64)
provides=(cvs)
conflicts=(cvs)
url="http://cvs.nongnu.org/"
license=('GPL')
depends=('krb5' 'zlib' 'libbsd')
optdepends=('openssh: for using cvs over ssh'
            'inetutils: for using cvs over rsh')
source=(
    ftp://ftp.gnu.org/non-gnu/cvs/source/feature/${pkgver}/cvs-${pkgver}.tar.bz2{,.sig}
    http://http.debian.net/debian/pool/main/c/cvs/cvs_1.12.13+real-15+deb8u1.diff.gz
)
sha512sums=(
    '7d10f808de62190b18d4f706d2d03ab218a508bfb52047ff3e830e293ec40c5e8bf6cc743ef72a5c24be5aa867c9e4892d7d475a026a98b296a3764b4bd0f4d8'
    'SKIP'
    'e6a0295624bdee01c3a2cac0f81113d049b82dc51aa67d100263f0e8eb95e2b84e6bc9166025e2ff0429b49862f8f49c1a6e5cb02990e470ea75805d52c1245d'
)
validpgpkeys=('CB6A07CA90C54234E8A3C8D02C3D4E4C17F231A4') # Derek R. Price <moc tod toibmix ta kered>

prepare() {
  cd "${srcdir}/cvs-${pkgver}"
  patch -Np1 < ../cvs_1.12.13+real-15+deb8u1.diff
  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
  find . -name Makefile.am | xargs sed -i -e 's/^INCLUDES/AM_CPPFLAGS/'
}

build() {
  cd "${srcdir}/cvs-${pkgver}"
  unset EDITOR VISUAL

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
