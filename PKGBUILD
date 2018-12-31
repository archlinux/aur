# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-python
pkgver=3.7.1
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
        "dont-make-libpython-readonly.patch")
sha512sums=('3eb62a0127609b14420a47442727702f396519c649625aca59883d04f4c02e5f37ba1d58ac8e93c49d14a63f17ae7909315c33fc813293dbcdb6127f39a148b0'
            'SKIP'
            'c6aeb74260740155b3ccee350230613b91567ae945026ce2a7f1f568cd0092d6fc7c49ad8d217dab3ad2e8b2ebe40b95c45b7e6feda2eb8849217ba6c31d7796'
            'f6119c9fb535e28d19c7500d8ce4859f9fa71738520357f4f7b418af25574380861381e911622b8cb85a21297083a3a96252d01595ba5803374b3f3f09d0e647'
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
  ln -s python${_pybasever}m-32-config ${pkgdir}/usr/bin/python3-32-config
  ln -s python${_pybasever}m-32 ${pkgdir}/usr/bin/python-32
  ln -s python${_pybasever}m-32-config ${pkgdir}/usr/bin/python-32-config

  # remove python3-config, conflicts with regular python
  rm -rf ${pkgdir}/usr/bin/python3-config

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Clean up
  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin/

  # Leave the python binary and configure script for dependants to find the headers
  cd "${pkgdir}"/usr/bin
  rm pydoc* idle* 2to3* pyvenv*
}
