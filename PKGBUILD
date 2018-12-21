# Maintainer: Sebastian Morr <sebastian@morr.cc>
# Modified by Pinczakko for Mingw-w64 cross compilation to 64-bit Windows

pkgname=mingw-w64-popt
_pkgname=popt
pkgver=1.16
pkgrel=1
arch=('any')
pkgdesc="A commandline option parser (mingw-w64)"
makedepends=('mingw-w64-configure')
license=('custom')
url="http://rpm5.org"
options=(!strip !buildflags staticlibs)
source=("http://rpm5.org/files/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "0001-nl_langinfo.mingw32.patch"
        "197416.all.patch"
        "217602.all.patch"
        "278402-manpage.all.patch"
        "318833.all.patch"
        "356669.all.patch"
        "367153-manpage.all.patch"
        "get-w32-console-maxcols.mingw32.patch"
        "no-uid-stuff-on.mingw32.patch"
        )
sha1sums=('cfe94a15a2404db85858a81ff8de27c8ff3e235e'
          '62640c0a0845cea5f3cd5646d26fd681ea36cadf'
          'bd7c8872f0bb80ec2a8b78596eb3ba5706795133'
          '977fbbe108cf817103f706dd314236e6bace7557'
          '18d169ff43b6ef4ee613272fdb2bbdc01df1f166'
          'a446c763439fe97459c6ea9bea22054a69ea9cc6'
          '2664b32cd6882e3c7da2d1ed3d40b14807a2c604'
          '63e5fdae8160445794458b03fc5a61e7354efada'
          '6599adf3797d7bfb4534bc910372c431fc0efced'
          '4c3b7b302044bd45decec78f7f7d4ece15d9f3f7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/${_pkgname}-$pkgver"
  patch -p1 -i ../0001-nl_langinfo.mingw32.patch
  patch -p1 -i ../197416.all.patch
  patch -p1 -i ../217602.all.patch
  patch -p1 -i ../278402-manpage.all.patch
  patch -p1 -i ../318833.all.patch
  patch -p1 -i ../356669.all.patch
  patch -p1 -i ../367153-manpage.all.patch
  patch -p1 -i ../get-w32-console-maxcols.mingw32.patch
  patch -p1 -i ../no-uid-stuff-on.mingw32.patch
}

build() {
  # We assume that libtool check on 64-bit Windows DLL is broken
  # in mingw-w64 Linux cross compiler. So, force it to pass all checks
  export lt_cv_deplibs_check_method='pass_all'

  cd "$srcdir/${_pkgname}-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
	${_arch}-configure --enable-shared --enable-static 
    make
	popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make install DESTDIR="${pkgdir}"
    rm -rf "${pkgdir}/usr/${_arch}/share/man"
    ${_arch}-strip -x -g "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done

  install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
