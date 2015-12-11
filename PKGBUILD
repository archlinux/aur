# Contributor: Procyon
# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto
# Contributor: shiracha

pkgname=unzip-iconv
pkgver=6.0
pkgrel=6
pkgdesc="Unpacks .zip archives such as those made by PKZIP. With iconv patch for -O / -I goodness."
arch=('i686' 'x86_64')
url='http://www.info-zip.org/UnZip.html'
license=('custom::Info-ZIP')
depends=('bzip2'
         'bash')
provides=('unzip')
conflicts=('unzip')
source=("http://downloads.sourceforge.net/infozip/unzip${pkgver/./}.tar.gz"
        'CVE-2014-8139.patch::https://bugzilla.redhat.com/attachment.cgi?id=990132'
        'CVE-2014-8140.patch::https://bugzilla.redhat.com/attachment.cgi?id=969621'
        'CVE-2014-8141.patch::https://bugzilla.redhat.com/attachment.cgi?id=969625'
        'CVE-2014-9636_pt1.patch::https://bugzilla.redhat.com/attachment.cgi?id=990649'
        'CVE-2014-9636_pt2.patch::https://projects.archlinux.org/svntogit/packages.git/plain/trunk/overflow-fsize.patch?h=packages/unzip&id=15e9a8c67463aaf62a718c6e74b1c972de654346'
        'iconv-utf8+CVE-2015-1315.patch::http://www.conostix.com/pub/adv/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch'
        'CVE-2015-7696+CVE-2015-7697_pt1.patch::https://bugzilla.redhat.com/attachment.cgi?id=1073339'
        'CVE-2015-7696+CVE-2015-7697_pt2.patch')
sha1sums=('abf7de8a4018a983590ed6f5cbd990d4740f8a22'
          '8ab9aa19e3743245696223035b04cba9d34aa4f6'
          '614c3e7fa7d6da7c60ea2aa79e36f4cbd17c3824'
          '9904365069c5fc72d10e42ce86eb9b4041aedc98'
          'e8c0bc17c63eeed97ad62b86845d75c849bcf4f8'
          '2852ce1a9db8d646516f8828436a44d34785a0b3'
          '9b5d552cc6ab1f9e8b74fbbbcebfee84d46218c2'
          '1a412abf0861225767c776721a5cd75b7e2011d7'
          '9fe70b98dee314385eba5fdc73baebfb648c7b6e')

prepare() {
  cd "unzip${pkgver/./}"

  patch -Np1 -i ../CVE-2014-8139.patch                              # FS#43300
  patch -Np0 -i ../CVE-2014-8140.patch                              # FS#43391
  patch -Np0 -i ../CVE-2014-8141.patch                              # FS#43300
  patch -Np1 -i ../CVE-2014-9636_pt1.patch                          # FS#44171
  patch -Np1 -i ../CVE-2014-9636_pt2.patch                          # FS#44171
  patch -Np1 -i ../iconv-utf8+CVE-2015-1315.patch                   # iconv patch + CEV 2015-1315 fix http://seclists.org/oss-sec/2015/q1/579
  patch -Np1 -i ../CVE-2015-7696+CVE-2015-7697_pt1.patch            # FS#46955
  patch -Np1 -i ../CVE-2015-7696+CVE-2015-7697_pt2.patch            # FS#46955
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
  make -f unix/Makefile prefix="${pkgdir}/usr" MANDIR="${pkgdir}/usr/share/man/man\$(manext)" install

  # install the license file
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/unzip-iconv/LICENSE
}
