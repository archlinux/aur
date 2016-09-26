# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=jasper
pkgname=lib32-${_pkgname}
pkgver=1.900.1
pkgrel=1
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard (32-bit)"
arch=('x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('lib32-libjpeg')
source=(http://www.ece.uvic.ca/~mdadams/${_pkgname}/software/${_pkgname}-${pkgver}.zip
        patch-libjasper-stepsizes-overflow.diff jasper-1.900.1-CVE-2008-3520.patch
        jpc_dec.c.patch jasper-1.900.1-CVE-2008-3522.patch
        jasper-1.900.1-CVE-2014-8137.patch jasper-avoid-assert-abort.diff
        jasper-1.900.1-CVE-2014-8138.patch jasper-1.900.1-CVE-2014-9029.patch
        jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch
        jasper-1.900.1-fix-filename-buffer-overflow.patch
        jasper-1.900.1-CVE-2014-8157.patch
        jasper-1.900.1-CVE-2014-8158.patch
        jasper-1.900.1-CVE-2016-1577.patch
        jasper-1.900.1-CVE-2016-2089.patch
        jasper-1.900.1-CVE-2016-2116.patch)
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191'
          'f298566fef08c8a589d072582112cd51c72c3983'
          '2483dba925670bf29f531d85d73c4e5ada513b01'
          'c1a0176a15210c0af14d85e55ce566921957d780'
          '0e7b6142cd9240ffb15a1ed7297c43c76fa09ee4'
          '437519aaaeff6076d11cdbea82125dbcac6f729b'
          '98548b610a7319e569ee0425a32dc1d31a8771d2'
          '6086e717af2f0a026f70e399e28fe115f08a8cc1'
          'f5fe80c8576379d34f372f6a7c6a76630ab9fdcd'
          '3bfb37a4c732caa824563bad2603fcf5f2acf7f7'
          '577dfce40da75818c4d32eb1c4532b1370950bee'
          'aaf96946073d2ece35f3695e8cc7956b5cad9a1d'
          'e69b339de43d1dc2fbb98368cee3d20f76d35941'
          '70dafcbcf76e32d8601e2ed11712d018d38d7f56'
          '06f89116508b1498e97a41ae07e15a4f049e671d'
          '101de5e73ebd690c08a7c1d7639fb35ede41faa3')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/jpc_dec.c.patch"
  patch -p1 -i "${srcdir}/patch-libjasper-stepsizes-overflow.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3520.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2008-3522.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-9029.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8137.patch"
  patch -p1 -i "${srcdir}/jasper-avoid-assert-abort.diff"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8138.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2011-4516-and-CVE-2011-4517.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-fix-filename-buffer-overflow.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8157.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2014-8158.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2016-1577.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2016-2089.patch"
  patch -p1 -i "${srcdir}/jasper-1.900.1-CVE-2016-2116.patch"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --mandir=/usr/share/man \
    --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
