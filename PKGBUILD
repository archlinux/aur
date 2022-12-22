# Maintainer: libele <libele@disroot.org>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Que Quotion <quequotion@bugmenot.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

_pkgbasename=python2
pkgname=lib32-$_pkgbasename
pkgver=2.7.18
pkgrel=4
_pybasever=2.7
pkgdesc="A high-level scripting language (32 bit)"
arch=('x86_64')
license=('PSF')
url="https://www.python.org/"
depends=(lib32-{bzip2,db,expat,gdbm,libffi,openssl-1.1,sqlite,zlib} python2)
makedepends=('lib32-tk')
optdepends=('lib32-tk: for IDLE')
conflicts=('lib32-python<3')
_gentoo_patches="python-gentoo-patches-${pkgver}_p16"
noextract=("${_gentoo_patches}.tar.xz")
options=('!makeflags')

source=("https://www.python.org/ftp/python/${pkgver%rc?}/Python-${pkgver}.tar.xz"
	"https://dev.gentoo.org/~mgorny/dist/python/${_gentoo_patches}.tar.xz"
	'mtime-workaround.patch'
	'python-config-32.patch'
	'lib32-distutils-sysconfig.patch')

sha512sums=('a7bb62b51f48ff0b6df0b18f5b0312a523e3110f49c3237936bfe56ed0e26838c0274ff5401bda6fc21bf24337477ccac49e8026c5d651e4b4cafb5eb5086f6c'
            '810be590d0e06fab4b2165e6852ca49662f09dcd7e20b47a29f613ad7653252c8dfac3f0eb228d77c8a914efa7c08788b2fbd552a4b47504f5fd0ec17450c48f'
            '4e761cfd57791e8b72ecdf84c2e03875bf074311130eea5b8e97409fa304fa3468dbd359a511c4e9978e686e662c58054b4174d3e73f845fa9ded2e83a3a8076'
            '68643c7632bd5a8c17fd095589ae97b137313852f75904cc1065d424b731702c9ef5bed4ff711bbde9ce1fe869eac3a32de0743e56070faca66ab63e227d6469'
            '6a661446a022f3c2e7f0273310c90cd6325efa3aaa0cad833b8fc63f89afd3f70a07795fe46b160a227f5094af25e03e19d094996d49f76f4ecb867b92edff49')

prepare() {
  bsdtar -xf "${_gentoo_patches}.tar.xz" -s /"${_gentoo_patches}"//

  cd "${srcdir}/Python-${pkgver}"

  # makepkg will touch all files to $SOURCE_DATE_EPOCH which will break pyc file's mtime check.
  # workaround this by touching them to $SOURCE_DATE_EPOCH before running compileall.
  patch -p0 -i ../mtime-workaround.patch

  patch -p1 -i ../0001-bpo-39017-Avoid-infinite-loop-in-the-tarfile-module-.patch #CVE-2019-20907
  patch -p1 -i ../0002-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch #CVE-2020-8492
  patch -p1 -i ../0003-bpo-39603-Prevent-header-injection-in-http-methods-G.patch #CVE-2020-26116
  patch -p1 -i ../0004-bpo-42051-Reject-XML-entity-declarations-in-plist-fi.patch
  patch -p1 -i ../0005-bpo-41944-No-longer-call-eval-on-content-received-vi.patch #CVE-2020-27619
  patch -p1 -i ../0006-bpo-40791-Make-compare_digest-more-constant-time.-GH.patch
  patch -p1 -i ../0007-3.6-closes-bpo-42938-Replace-snprintf-with-Python-un.patch #CVE-2021-3177
  patch -p1 -i ../0008-3.6-bpo-42967-only-use-as-a-query-string-separator-G.patch #CVE-2021-23336
  patch -p1 -i ../0009-py2-ize-the-CJK-codec-test.patch
  patch -p1 -i ../0017-bpo-46811-Make-test-suite-support-Expat-2.4.5-GH-314.patch

  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c
  
  # Enable built-in SQLite3 module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py
 
  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
  
  # Here start the patches lib32 specific
  
  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}-32/" Python/pythonrun.c
  
  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2-32|" Lib/cgi.py
  
  # Just how many places does one have to patch Python?
  patch -Np2 < "${srcdir}/lib32-distutils-sysconfig.patch"

  # Give the configuration script an extention
  patch -Np2 < "${srcdir}/python-config-32.patch"

  # Fix hard-coded paths
  sed -i "s|base}/lib|base}/lib32|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|/include|/lib32/python{py_version_short}/include|g" "${srcdir}/Python-${pkgver}/Lib/sysconfig.py"
  sed -i "s|lib/|lib32/|g" "${srcdir}/Python-${pkgver}/Modules/getpath.c"
  sed -i "s|base/lib|base/lib32|g" "${srcdir}/Python-${pkgver}/Lib/distutils/command/install.py"
  sed -i "s|/include|/lib32/python{py_version_short}/include|g" "${srcdir}/Python-${pkgver}/Lib/distutils/command/install.py"
  sed -i "s|prefix)/lib|prefix)/lib32|g" "${srcdir}/Python-${pkgver}/Makefile.pre.in"
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  CPPFLAGS+=" -I/usr/include/openssl-1.1"
  LDFLAGS+=" -L/usr/lib32/openssl-1.1"
  export OPT="${CFLAGS}"
  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --enable-optimizations \
              --with-lto \
              --enable-ipv6 \
              --enable-unicode=ucs4 \
              --with-system-expat \
              --with-system-ffi \
              --with-dbmliborder=gdbm:ndbm \
              --without-ensurepip \
              --libdir=/usr/lib32 \
              --libexecdir=/usr/lib32 \
              --includedir=/usr/lib32/python${_pybasever}/include \
              --exec_prefix=/usr/lib32/python${_pybasever}/ \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --with-suffix='-32'
  make
}
 
package() {
  cd "${srcdir}/Python-${pkgver}"
 
  make DESTDIR="${pkgdir}" altinstall
 
  ln -sf ../../libpython${_pybasever}.so "${pkgdir}"/usr/lib32/python${_pybasever}/config/libpython${_pybasever}.so
 
  mv "${pkgdir}"/usr/bin/smtpd.py "${pkgdir}"/usr/lib32/python${_pybasever}/
 
  # some useful "stuff"
  install -dm755 "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py  "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py}    "${pkgdir}"/usr/lib32/python${_pybasever}/Tools/scripts/
  
  # create symlinks
  ln -s python2.7-32     "${pkgdir}"/usr/bin/python2-32
  ln -s python2.7-32-config  "${pkgdir}"/usr/bin/python2-32-config

  # clean up #!s
  find "${pkgdir}"/usr/lib32/python2.7/ -name '*.py' | xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2.7-32|"
 
  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}"/usr/lib32/python${_pybasever}/config/Makefile
 
  # Clean up
  rm -rf "${pkgdir}"/{etc,usr/{share,include}} # needs bin/

  # Leave the python binary and configure script for depedants to find the headers
  cd "${pkgdir}"/usr/bin
  rm pydoc idle 2to3
}

