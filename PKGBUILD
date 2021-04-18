# Maintainer: akliuxingyuan

_pkgname=icu
pkgname=icu68
pkgver=68.2
pkgrel=1
pkgdesc='International Components for Unicode library'
arch=('i686' 'x86_64')
url="http://www.icu-project.org/"
license=('custom:icu')
depends=('gcc-libs' 'sh')
makedepends=('python' 'clang' 'make' 'patch')
source=("https://github.com/unicode-org/icu/releases/download/release-${pkgver//./-}/icu4c-${pkgver//./_}-src.tgz")
sha512sums=('24f3b7981667b37df58118f56ae76a09b719358c1efa8d6f044d28ef8df1c722a894957acadfb3c37aee39ac845893924fc3370d6bbe09875aec8d937059f84b')

build() {
  cd "${_pkgname}/source"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --mandir=/usr/share/man \
    --sbindir=/usr/bin

  make
}

check() {
  cd "${_pkgname}/source"

  make -k check
}

package() {
  cd "${_pkgname}/source"

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{bin,include,share,lib/{pkgconfig,*.so,icu/{current,Makefile.inc,pkgdata.inc}}}

  # install license
  install -Dm644 "${srcdir}"/"${_pkgname}"/LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
