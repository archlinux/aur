# Maintainer: Martchus <martchus@gmx.net>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Ionut Biru  <ibiru@archlinux.ro>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

_name=geany
pkgname=mingw-w64-geany
pkgver=1.26
pkgrel=1
pkgdesc='Fast and lightweight IDE (mingw-w64)'
arch=('any')
url='http://www.geany.org/'
license=('GPL')
depends=('mingw-w64-crt' 'mingw-w64-gtk2')
makedepends=('perl-xml-parser' 'setconf' 'intltool' 'mingw-w64-gcc' 'mingw-w64-configure' 'mingw-w64-binutils')
optdepends=('mingw-w64-geany-plugins: various extra features'
            'mingw-w64-python2')
source=("http://download.geany.org/${_name}-$pkgver.tar.bz2")
sha256sums=('e38530e87c577e1e9806be3b40e08fb9ee321eb1abc6361ddacdad89c825f90d')
options=(!buildflags staticlibs !strip !emptydirs)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${_name}-$pkgver"

  # Python2 fix
  sed -i '0,/on/s//on2/' data/templates/files/main.py

  # Syntax highlighting for PKGBUILD files
  sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
}

build() {
  cd "${_name}-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}"
    pushd "build-${_arch}"
    ${_arch}-configure \
        --exec-prefix=/usr/${_arch} \
        --sysconfdir=/etc \
        --prefix=/usr/${_arch}
    make
    popd
  done
}

package() {
  cd "${_name}-$pkgver"
  for _arch in ${_architectures}; do
    pushd "build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/geany/"*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/lib/geany/"*.dll
    ${_arch}-strip --strip-all "${pkgdir}/usr/${_arch}/bin/"*.exe
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    rm "${pkgdir}/usr/${_arch}/"*.txt
    popd
  done
}

# getver: -u 7 geany.org/Documentation/ReleaseNotes
# vim:set ts=2 sw=2 et:
