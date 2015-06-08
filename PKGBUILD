# Maintainer : Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.0.0
pkgrel=4
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program."
arch=('i686' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license="GPL"
depends=('zlib')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz \
        patch-backup-lynxit.c \
        patch-libdiscimage-misc_z.c \
        patch-libdiscimage-unzip.h \
        patch-misc-archive.c \
        patch-misc-unzip.h \
        patch-ucon64.c \
        patch-ucon64_misc.c)
md5sums=('33804256edb265d43bc3dbb9ada4441a'
         '0c315bce4b590749b7451b33f86d5b2d'
         '3a405c6696069b8799dce85c21c6c6e9'
         '249aaa950fba7bc9983b4dafdeaf37ab'
         '42057845212bf93dee24584912316494'
         'fbd555b1fa8b0d6a1547fcca5110e8a9'
         'a991ce0999b9724dec816fb1747b1237'
         'edac4423575708755e7dc1a603538c01')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}-src/src
  for i in ../../patch*; do patch -p0 < $i; echo $i; done
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}-src/src
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}-src/src

  install -Dm775 ${pkgname} ${pkgdir}/usr/bin/${pkgname}

  if [ -f libdiscmage/discmage.so ]; then
    install -Dm755 libdiscmage/discmage.so ${pkgdir}/usr/lib/discmage.so
  elif [ -f discmage.so ]; then
    install -Dm755 discmage.so ${pkgdir}/usr/lib/discmage.so
  fi
}
