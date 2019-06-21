# Maintainer: Alexandre Demers <alexandre.f.demers@gmail.com>
# Contributor: Rustam Tsurik <rustam.tsurik@gmail.com>

pkgname=lib32-icu48
_pkgname=icu
pkgver=4.8.2
pkgrel=2
pkgdesc="International Components for Unicode library, version 4.8"
arch=(i686 x86_64)
url="http://www.icu-project.org/"
license=('custom:"icu"')
depends=('lib32-gcc-libs>=4.7.1-5')

source=("https://github.com/unicode-org/${_pkgname}/releases/download/release-${pkgver//./-}/${_pkgname}4c-${pkgver//./_}-src.tgz"
        "malayalam-rendering.patch"
        "indic-ccmp.patch"
        "mlym-crash.patch"
        "CVE-2013-0900.patch")

sha256sums=('4c70131bcb87205622ed9a3349175f287d2b677f29a389b47da46c6e50b29373'
         '564c15b78512085bd72261b37c98fdc47247ee00e4f17509b6cd3cc3bd2ce40a'
         '7dd3719b9f1ed6c197088a2b5c17285480c1e2941a248ac2d173122a02c4b500'
         '9cf60a03d5d6e41028395a1c4031843b60e03f4860e11afa8b92fd6670870e22'
         'ffa998b285706b3c665cd73a0c6889892402bb96a83c1661fec9e57960ae4aa0')

prepare() {
  cd ${srcdir}/icu/source

  # apply security patches + fixes for Malayalan encoding
  # patches taken from the Debian package,
  # http://ftp.us.debian.org/debian/pool/main/i/icu/icu_4.8.1.1-12.debian.tar.gz

  patch -p2 -i ../../malayalam-rendering.patch
  patch -p2 -i ../../indic-ccmp.patch
  patch -p2 -i ../../mlym-crash.patch
  patch -p2 -i ../../CVE-2013-0900.patch
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
