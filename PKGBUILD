# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=placeholder
pkgver=2.8
pkgrel=1
_pybasever=2.8
pkgdesc='Fork of Python 2.7, with additional features from Python 3'
arch=('x86_64' 'i686')
license=('PSF')
url='https://github.com/naftaliharris/placeholder'
depends=('bzip2' 'gdbm' 'openssl' 'zlib' 'expat' 'sqlite' 'libffi')
makedepends=('tk' 'bluez-libs' 'hardening-wrapper' 'git')
conflicts=('python2')
provides=('python2')
checkdepends=('gdb' 'file')
optdepends=('tk: for IDLE'
            'python2-setuptools'
            'python2-pip')
source=("git://github.com/naftaliharris/placeholder#commit=415a41b"
        'descr_ref.patch')
sha256sums=('SKIP'
            '8f84c2efd9963541a55e2caccbb2651a132430c49f9e66e8e299a9e34e1c74b8')

prepare() {
  cd "$pkgname"

  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

  sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
    Lib/distutils/tests/test_install_scripts.py

  # TODO: Still not passed
  # Silent test_gdb failures on 'no symbol table loaded'.
  #sed -i '/ignore_patterns = (/a "No symbol table is loaded.  Use the \\"file\\" command.",' \
  #  Lib/test/test_gdb.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*

  # clean up #!s
  find . -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"

  # Workaround asdl_c.py/makeopcodetargets.py errors after we touched the shebangs
  touch Include/Python-ast.h Python/Python-ast.c Python/opcode_targets.h

  # FS#48761
  # http://bugs.python.org/issue25750
  patch -p1 -i ../descr_ref.patch
}

build() {
  cd "$pkgname"

  export OPT="$CFLAGS"
  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --enable-ipv6 \
              --enable-unicode=ucs4 \
              --with-system-expat \
              --with-system-ffi \
              --with-dbmliborder=gdbm:ndbm \
              --without-ensurepip
  make
}

check() {
  # test_gdb
  # Besides, test_thread disabled as it will stuck

  # $SHELL was set to avoid a test failure in test_gdb (it still fails due to other reasons, though)

  cd "$pkgname"
  SHELL=/bin/sh LD_LIBRARY_PATH="${srcdir}/Python-${pkgver}":${LD_LIBRARY_PATH} \
    "${srcdir}/Python-${pkgver}/python" -m test.regrtest -v -uall -x test_thread || warning "Tests failed"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" altinstall maninstall

  rm "${pkgdir}"/usr/share/man/man1/python.1

  ln -sf python${_pybasever}        "${pkgdir}"/usr/bin/python2
  ln -sf python${_pybasever}-config "${pkgdir}"/usr/bin/python2-config
  ln -sf python${_pybasever}.1      "${pkgdir}"/usr/share/man/man1/python2.1

  # FS#33954
  ln -sf python-${_pybasever}.pc    "${pkgdir}"/usr/lib/pkgconfig/python2.pc

  ln -sf ../../libpython${_pybasever}.so "${pkgdir}"/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so

  mv "${pkgdir}"/usr/bin/smtpd.py "${pkgdir}"/usr/lib/python${_pybasever}/

  # some useful "stuff"
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # fix conflicts with python
  mv "${pkgdir}"/usr/bin/idle{,2}
  mv "${pkgdir}"/usr/bin/pydoc{,2}
  mv "${pkgdir}"/usr/bin/2to3{,-2.8}

  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}"/usr/lib/python${_pybasever}/config/Makefile

  # license
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
