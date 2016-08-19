# Contributor: Filip Brcic <brcha@gna.org>
# Updated by ant32 <antreimer@gmail.com>

pkgname=mingw-w64-termcap
pkgver=1.3.1
pkgrel=8
arch=(any)
pkgdesc="Terminal feature database (mingw-w64)"
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(!strip !buildflags staticlibs)
license=(GPL LGPL)
groups=('mingw-w64')
url="ftp://ftp.gnu.org/gnu/termcap/"
source=("http://ftp.gnu.org/gnu/termcap/termcap-${pkgver}.tar.gz")
md5sums=('ffe6f86e63a3a29fa53ac645faaabdfa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "$srcdir/termcap-$pkgver"
  autoconf
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    # Build a shared library.  No need for -fPIC on Windows.
    ${_arch}-gcc -shared \
      -Wl,--out-implib,libtermcap.dll.a \
      -o libtermcap-0.dll \
      termcap.o tparam.o version.o
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/termcap-$pkgver/build-${_arch}"
    # make install has no support for destdir
    make install prefix="${pkgdir}/usr/${_arch}" exec_prefix="${pkgdir}/usr/${_arch}" oldincludedir=
    #rm -r "$pkgdir"/usr/${_arch}/info/
    mkdir -p "${pkgdir}"/usr/${_arch}/{bin,lib}
    install -m 0755 libtermcap-0.dll "${pkgdir}/usr/${_arch}/bin"
    install -m 0644 libtermcap.dll.a "${pkgdir}/usr/${_arch}/lib"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
