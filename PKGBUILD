# maintainer: libele <libele@disroot.org>
# contributor: FadeMind <fademind@gmail.com>
# contributor: Que Quotion <quequotion@bugmenot.com>
# contributor: Jameson Pugh <imntreal@gmail.com>

_pkgbasename=python2
pkgname=lib32-$_pkgbasename
pkgver=2.7.18
pkgrel=2
_pybasever=2.7
pkgdesc="A high-level scripting language (32 bit)"
arch=('x86_64')
license=('PSF')
url="https://www.python.org/"
depends=(lib32-{bzip2,db,expat,gdbm,libffi,openssl,sqlite,zlib} python2)
makedepends=('lib32-tk')
optdepends=('lib32-tk: for IDLE')
conflicts=('lib32-python<3')
_gentoo_patches="python-gentoo-patches-${pkgver}_p7"
noextract=("${_gentoo_patches}.tar.xz")
options=('!makeflags')

source=("https://www.python.org/ftp/python/${pkgver%rc?}/Python-${pkgver}.tar.xz"
	"https://dev.gentoo.org/~mgorny/dist/python/${_gentoo_patches}.tar.xz"
	'mtime-workaround.patch'
	'py2-ize-the-CJK-codec-test.patch'
	'python-config-32.patch'
	'lib32-distutils-sysconfig.patch')

md5sums=('fd6cc8ec0a78c44036f825e739f36e5a'
	 'e27f91738befff4af760b4f795d3143f'
	 'bc8dedb8d9eb85e40053822fbcaf4f55'
	 '92b8bd2b443d542bdb917a1e6fc6af7c'
	 '77d113945dd9203a4a780b8af14917bf'
	 '18bc594dc3d01a71d8b2dbf121ea2a81')

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
  patch -p1 -i ../0024-3.6-bpo-42967-only-use-as-a-query-string-separator-G.patch #CVE-2021-23336
  patch -p1 -i ../py2-ize-the-CJK-codec-test.patch
  
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

