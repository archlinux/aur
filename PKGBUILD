# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-python
pkgver=3.11.3
pkgrel=1
_pybasever=3.11
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
sha512sums=('a3bba4b69322a47bfeefe42ba0fd7331b5b67fd2ab41441e2219d16ef8c6f307f1a48977afd073c18cfd24ec6cb1bfe0c4bb4b273031eb524dc7e9fb5fbcc3b6'
            'SKIP'
            'b7f06fef88b88463d0d4fb8dea00e1e1c3516bd71d521eb44fa65b2cb70d98d3c468bc12131d76cabbe95f86c96c60e21c0e1b889628de0639c766fd3e0c21b2'
            'aa6af1208e93aa412e9839721c851dbb463a7e7f40eb72b253eacde2e59569708e1820a6d2fdba1dfee1b475244f47cd40b49204da182e8738058125829a936d')
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
