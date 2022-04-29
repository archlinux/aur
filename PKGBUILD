# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Contributor: Tobias Kunze <r@rixx.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

_srcname=nogil
_gitcommit=5c35dc0df4e2ea114dd1a692091ac04ed6b4de23
_pkgrevision=1
_pyversion=3.9.10
_pybasever=${_pyversion%.*}
_pymajver=${_pybasever%.*}

pkgname=nogil-python
pkgver="${_pyversion}+${_pkgrevision}+${_gitcommit:0:7}"
pkgrel=1
pkgdesc="Python Multithreading without GIL"
arch=('x86_64')
license=('custom')
url="https://github.com/colesbury/nogil"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'libnsl' 'libxcrypt' 'openssl' 'zlib')
makedepends=('bluez-libs' 'gdb' 'make' 'mpdecimal' 'llvm' 'sqlite' 'tk')
optdepends=(
  'mpdecimal: for decimal'
  'sqlite'
  'tk: for tkinter'
  'xz: for lzma'
)
provides=("python=${_pybasever}")
conflicts=("python=${_pybasever}" "python${_pybasever//.}")
source=(
  "${_srcname}-${_gitcommit}.zip::${url}/archive/${_gitcommit}.zip"
)
sha256sums=(
  'fd35961db7770d942ae0f5e890eb3847897e3b0c80064df254af2150b07569ce'
)

prepare() {
  cd "${_srcname}-${_gitcommit}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Speed up LTO
  sed -i -e "s|-flto |-flto=4 |g" configure configure.ac

  # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_ctypes/{darwin,libffi}*
  rm -r Modules/_decimal/libmpdec
}

build() {
  cd "${_srcname}-${_gitcommit}"

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3}"

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --enable-shared \
              --with-computed-gotos \
              --enable-optimizations \
              --with-lto \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --with-tzpath=/usr/share/zoneinfo

  make EXTRA_CFLAGS="$CFLAGS"
}

# check() {
#   cd "${_srcname}-${_gitcommit}"
# 
#   LD_LIBRARY_PATH="${srcdir}/${_srcname}-${_gitcommit}":${LD_LIBRARY_PATH} \
#     "${srcdir}/${_srcname}-${_gitcommit}/python" -m test.regrtest -v -uall
# }

package() {
  cd "${_srcname}-${_gitcommit}"

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3}"

  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" altinstall maninstall

  # Split tests
  rm -r "$pkgdir"/usr/lib/python*/{test,ctypes/test,distutils/tests,idlelib/idle_test,lib2to3/tests,sqlite3/test,tkinter/test,unittest/test}

  # Avoid conflicts with the main 'python' package.
  rm -f "${pkgdir}/usr/lib/libpython${_pymajver}.so"
  rm -f "${pkgdir}/usr/share/man/man1/python${_pymajver}.1"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/${_srcname}-${_gitcommit}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}-${CARCH}-linux-gnu/Makefile"

  # Add some useful scripts FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
