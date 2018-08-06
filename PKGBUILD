# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-python
pkgver=3.7.0
pkgrel=1
_pybasever=3.7
pkgdesc="Next generation of the python high-level scripting language"
arch=('x86_64')
license=('custom')
url="http://www.python.org/"
depends=('lib32-expat' 'lib32-bzip2' 'lib32-gdbm' 'lib32-openssl' 'lib32-libffi' 'lib32-zlib' 'lib32-libtirpc' 'lib32-libnsl' 'python')
makedepends=('lib32-tk' 'lib32-xz' 'lib32-sqlite' 'valgrind' 'lib32-bluez-libs' 'lib32-llvm')
optdepends=('lib32-sqlite'
            'lib32-xz: for lzma'
            'lib32-tk: for tkinter')
provides=('lib32-python3')
source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz"{,.asc}
        "lib32-distutils-sysconfig.patch"
        "python-config-32.patch"
        "bpo34056-always-return-bytes-from-_HackedGetData.get_data.patch"
        "dont-make-libpython-readonly.patch")
sha512sums=('8bb11233fb67ee9ab8ed1b72f8fdc62f66e26a6beaaeb92448bce681cf065269833b1658d3ed2459127f25ba43adb0eab73cf27c59834a2a803fb529b4216739'
            'SKIP'
            '06e7d3985bba098459eed604eeaa77c4c19a52f175c47feeea15d1d680aeea519721ecab851fff6bc2b2315310a220a8e6fd1971140d233156e4412976264bf6'
            'f6119c9fb535e28d19c7500d8ce4859f9fa71738520357f4f7b418af25574380861381e911622b8cb85a21297083a3a96252d01595ba5803374b3f3f09d0e647'
            '0ec544fa95ba30be03e866d02848f9fa4921304055368609136ac39626df9835bad75506f6d81ef9fdc0ebcc29a9749f84b5b5f4dd75958c9699ade522d51b68'
            '2ef96708d5b13ae2a3d2cc62c87b4780e60ecfce914e190564492def3a11d5e56977659f41c7f9d12266e58050c766bce4e2b5d50b708eb792794fa8357920c4')
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D')  # Ned Deily (Python release signing key) <nad@python.org>

prepare() {
  cd "${srcdir}/Python-${pkgver}"
  
  patch -Np1 -i "${srcdir}/lib32-distutils-sysconfig.patch"
  
  # Give the configuration script an extention
  patch -Np1 -i "${srcdir}/python-config-32.patch"
  
  
  # Fix hard-coded paths
  sed -i "s|base}/lib|base}/lib32|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|/include|/lib32/python{py_version_short}/include|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|lib/|lib32/|g" "${srcdir}/Python-${pkgver}/Modules/getpath.c"
  sed -i "s|base/lib|base/lib32|g" "${srcdir}/Python-${pkgver}/Lib/distutils/command/install.py"
  sed -i "s|/include|/lib32/python{py_version_short}/include|g" "${srcdir}/Python-${pkgver}/Lib/distutils/command/install.py"
  sed -i "s|prefix)/lib|prefix)/lib32|g" "${srcdir}/Python-${pkgver}/Makefile.pre.in"
  
  # https://bugs.python.org/issue34056
  patch -Np1 -i ../bpo34056-always-return-bytes-from-_HackedGetData.get_data.patch
  
  # FS#45809
  patch -p1 -i "${srcdir}/dont-make-libpython-readonly.patch"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_ctypes/{darwin,libffi}*
  
  # Currently it is impossible to build multilib system mpdecimal module
  # without conflicting header config errors.
  # rm -r Modules/_decimal/libmpdec
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-optimizations \
              --with-lto \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --libexecdir=/usr/lib32 \
              --includedir=/usr/lib32/python${_pybasever}m/include \
              --exec_prefix=/usr/lib32/python${_pybasever}/ \
              --bindir=/usr/bin \
              --sbindir=/usr/sbin \
              --with-suffix='-32'

  make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd "${srcdir}/Python-${pkgver}"

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" install

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/scripts/
  
    # create symlinks
    ln -s python3.6-32         ${pkgdir}/usr/bin/python-32
    ln -s python3.6-32-config  ${pkgdir}/usr/bin/python-32-config

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Clean up
  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin/

  # Leave the python binary and configure script for depedants to find the headers
  cd "${pkgdir}"/usr/bin
  rm pydoc* idle* 2to3* pyvenv*
}
