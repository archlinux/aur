# Contributor: Procyon
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto
# Contributor: shiracha

pkgname=unzip-iconv
pkgver=6.0
pkgrel=3
pkgdesc="Unpacks .zip archives such as those made by PKZIP. With iconv patch for -O / -I goodness."
arch=('i686' 'x86_64')
url='http://www.info-zip.org'
license=('custom')
depends=('bzip2' 'bash')
provides=('unzip')
conflicts=('unzip')
source=('http://downloads.sourceforge.net/infozip/unzip60.tar.gz'
        'http://www.conostix.com/pub/adv/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch'
        'overflow-fsize.patch'
        'cve20149636.patch'
        'test_compr_eb.patch'
        'getZip64Data.patch'
        'crc32.patch')
sha1sums=('abf7de8a4018a983590ed6f5cbd990d4740f8a22'
          '9b5d552cc6ab1f9e8b74fbbbcebfee84d46218c2'
          '2852ce1a9db8d646516f8828436a44d34785a0b3'
          'e8c0bc17c63eeed97ad62b86845d75c849bcf4f8'
          '614c3e7fa7d6da7c60ea2aa79e36f4cbd17c3824'
          '691d0751bf0bc98cf9f9889dee39baccabefdc4d'
          '82c9fe9172779a0ee92a187d544e74e8f512b013')

prepare() {
  cd "unzip${pkgver/./}"

  patch -Np1 -i ../06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch #iconv patch+CEV fix http://seclists.org/oss-sec/2015/q1/579
  patch -p1 -i ../overflow-fsize.patch #FS#44171
  patch -p1 -i ../cve20149636.patch #FS#44171
  patch -i ../test_compr_eb.patch # FS#43391
  patch -i ../getZip64Data.patch # FS#43300
  patch -i ../crc32.patch # FS#43300
}

build() {
  cd "unzip${pkgver/./}"

  # set CFLAGS -- from Debian
  DEFINES='-DACORN_FTYPE_NFS -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT \
-DUNICODE_SUPPORT -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD \
-DDATE_FORMAT=DF_YMD -DUSE_BZIP2 -DNOMEMCPY -DNO_WORKING_ISPRINT'

  # make -- from Debian
  make -f unix/Makefile prefix=/usr \
  D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 \
  LF2="${LDFLAGS}" CF="${CFLAGS} ${CPPFLAGS} -I. ${DEFINES}" \
  unzips
}

package() {
  cd "unzip${pkgver/./}"

  # install -- from Debian
  make -f unix/Makefile prefix="${pkgdir}"/usr MANDIR="${pkgdir}/usr/share/man/man\$(manext)" install

  # install the license file
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/unzip/LICENSE
}
