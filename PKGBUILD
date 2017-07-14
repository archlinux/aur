# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>

pkgname=lib32-libxdg-basedir
_basename=libxdg-basedir
pkgver=1.2.0
pkgrel=2
pkgdesc="An implementation of the XDG Base Directory specifications (32-bit)."
arch=('x86_64')
#url="http://n.ethz.ch/student/nevillm/download/libxdg-basedir"
url="https://github.com/devnev/$_basename"
license=('MIT')
depends=('lib32-glibc' 'libxdg-basedir')
source=(https://github.com/devnev/$_basename/archive/$_basename-$pkgver.tar.gz
        'xdgGetRelativeHome-overflow.patch'
        'LICENSE')
sha1sums=('e671b01b17c8cf785d95dd3aefa93e7cf31e56a5'
          '90ce224344f8075c4ce8241b8f8bf13b8968eec5'
          'c76efede60d0632d4241d718919d8b4ec62056b3')

prepare() {
   cd "${srcdir}/$_basename-$_basename-$pkgver"

#   FS#39490: Fix buffer overflow
   patch -Np0 -i "${srcdir}/xdgGetRelativeHome-overflow.patch"
}

build() {
   export CC='cc -m32'
   export CXX='c++ -m32'
   export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

   cd "${srcdir}/$_basename-$_basename-$pkgver"
   ./autogen.sh --prefix=/usr --build=i686-pc-linux-gnu --libdir=/usr/lib32
   make
}

package() {
   cd "${srcdir}/$_basename-$_basename-$pkgver"
   make DESTDIR=${pkgdir} install

   rm -r "${pkgdir}"/usr/include

   # Install MIT license
   install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

