# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>

pkgname=mingw-w64-gdbm
pkgver=1.10
pkgrel=2
pkgdesc="GNU database library (mingw-w64)"
url="http://www.gnu.org/software/gdbm/gdbm.html"
license=('GPL')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-gettext')
source=("http://ftp.gnu.org/gnu/gdbm/gdbm-${pkgver}.tar.gz"
        'gdbm-1.10-zeroheaders.patch'
        'gdbm-win32-support.patch')
options=('staticlibs' '!buildflags' '!strip')
md5sums=('88770493c2559dc80b561293e39d3570'
         'ac255b10452005237836cd2d3a470733'
         '47b9d81616ba58b0257248c6a5777412')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/gdbm-${pkgver}"

  # Prevent gdbm from storing uninitialized memory content
  # to database files. This patch improves security, as the
  # uninitialized memory might contain sensitive informations
  # from other applications.
  # https://bugzilla.redhat.com/show_bug.cgi?id=4457
  # http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=208927
  patch -Np1 -i ../gdbm-1.10-zeroheaders.patch

  # http://pkgs.fedoraproject.org/cgit/mingw-gdbm.git/tree/gdbm-win32-support.patch
  patch -Np0 -i ../gdbm-win32-support.patch

  autoreconf -vfi
}

build() {
  cd "${srcdir}/gdbm-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    ../configure \
              --prefix=/usr/${_arch} \
              --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gdbm-${pkgver}/build-$_arch"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe    
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

    # create symlinks for compatibility
    install -dm755 "${pkgdir}"/usr/${_arch}/include/gdbm
    ln -sf ../gdbm.h "${pkgdir}"/usr/${_arch}/include/gdbm/gdbm.h
  done
}
