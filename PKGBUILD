# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig
pkgver=2.0.3
pkgrel=1
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=('i686' 'x86_64')
url="http://www.swig.org/"
license=('custom')
depends=('gcc-libs' 'zlib' 'pcre')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz 
        swig-deprecated-pycobject.patch
        swig-pyslice.patch)
sha1sums=('da09610f0b925fae40b40186d262c46e3e1f2bf0'
          'add71330c5d839d9a27b1ca688e6c5e31f1edb7b'
          'b8e28148fcef01f24a9acc6218dc090dbde03c37')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Use PyCapsule API instead of deprecated PyCObject API in python bindings
  # See https://bugzilla.redhat.com/show_bug.cgi?id=623854
  patch -Np1 -i ../swig-deprecated-pycobject.patch

  # Fix PySlice* API/ABI issues with the Python 3.2
  # See https://bugzilla.redhat.com/show_bug.cgi?id=666429
  patch -Np1 -i ../swig-pyslice.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}
