# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-python
pkgver=3.10.9
pkgrel=1
_pybasever=3.10
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
        "python-config-32.patch")
sha512sums=('d66ea8adeb6dc4951e612175f8838b3092967ff275b7a3470f2d86f470036aa2221e722c3144d90bcd230b88efd53dde204213f72f703e524e4b833e2ccc68e2'
            'SKIP'
            'e541d608b809ee04d9249a8b1a952c02a8d024efc87458bb96a999b8952cefc50be66e36e9f821b96691460b41792fea4b045c51a1aa064d66d0cf32eb3472c9'
            'cba0c7204239abbbc20754e6f66717d2b6ac9f10f4af03bc170c71dfc02310fd03005d9e771fb38d4d672ed01b79ef68e87d3111f9e1145047a650d18568e0d5')
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D'  # Ned Deily (Python release signing key) <nad@python.org>
              'E3FF2839C048B25C084DEBE9B26995E310250568'  # Łukasz Langa (GPG langa.pl) <lukasz@langa.pl>
              'A035C8C19219BA821ECEA86B64E628F8D684696D') # Pablo Galindo Salgado <pablogsal@gmail.com>

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
              --with-platlibdir=lib32 \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --libexecdir=/usr/lib32 \
              --includedir=/usr/lib32/python${_pybasever}/include \
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
  ln -s python${_pybasever}-32-config ${pkgdir}/usr/bin/python3-32-config
  ln -s python${_pybasever}-32 ${pkgdir}/usr/bin/python-32
  ln -s python${_pybasever}-32-config ${pkgdir}/usr/bin/python-32-config

  # remove python3-config, conflicts with regular python
  rm -rf ${pkgdir}/usr/bin/python3-config

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Clean up
  rm -rf "${pkgdir}"/{etc,usr/share} # needs bin/ and include/

  # Leave the python binary and configure script for dependants to find the headers
  cd "${pkgdir}"/usr/bin
  rm pydoc* idle* 2to3*
}
