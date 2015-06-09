# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=lib32-icu48
_pkgname=icu
pkgver=4.8.1.1
pkgrel=3
pkgdesc="International Components for Unicode library, version 4.8"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('lib32-gcc-libs>=4.7.1-5')

source=("http://download.icu-project.org/files/${_pkgname}4c/${pkgver}/${_pkgname}4c-${pkgver//./_}-src.tgz"
        "malayalam-rendering.patch"
        "CVE-2011-4599.patch"
        "indic-ccmp.patch"
        "mlym-crash.patch"
        "CVE-2013-0900.patch"
        "fix-test.diff")

md5sums=('ea93970a0275be6b42f56953cd332c17'
         '9581cfaccbf93b6d6f7f7644bebcdafa'
         '835c9e3ae0b76aa88a6ce144a42a3bce'
         '6602e6d9727376174cbb1b688e5e3325'
         'a6a9daa1e3655c5058148af8903a443b'
         '9528996e1e2099bb79d25fbd799a511e'
         '766a677946f50029e0c01f5b8d30afec')

prepare() {
  cd ${srcdir}/icu/source

  # apply security patches + fixes for Malayalan encoding
  # patches taken from the Debian package, 
  # http://ftp.us.debian.org/debian/pool/main/i/icu/icu_4.8.1.1-12.debian.tar.gz

  patch -p2 -i ../../malayalam-rendering.patch
  patch -p2 -i ../../CVE-2011-4599.patch
  patch -p2 -i ../../indic-ccmp.patch
  patch -p2 -i ../../mlym-crash.patch
  patch -p2 -i ../../CVE-2013-0900.patch
  patch -p2 -i ../../fix-test.diff
}

build() {
  cd ${srcdir}/icu/source

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --mandir=/usr/share/man \
              --libdir=/usr/lib32
  make
}

check() {
  cd "$srcdir/icu/source"
  make -k check # passes all
}

package() {
  cd "${srcdir}/icu/source"

  # Copy only .so libs to the destination dir
  mkdir -p "${pkgdir}/usr/lib32"
  cp -a lib/libicu*48* "${pkgdir}/usr/lib32"

  # Install the license
  install -Dm644 ${srcdir}/icu/license.html ${pkgdir}/usr/share/licenses/lib32-icu48/license.html
}
