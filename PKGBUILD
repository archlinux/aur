# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: Chris McDonald <xwraithanx@gmail.com>

pkgname=python26
pkgver=2.6.9
pkgrel=14
_pybasever=2.6
pkgdesc="Legacy version Python 2.6 of the high-level scripting language"
arch=('i686' 'x86_64' 'arm')
license=('PSF')
url="https://www.python.org/"
depends=('db>=4.8' 'bzip2' 'gdbm' 'openssl-1.0' 'zlib' 'expat' 'sqlite3' 'libffi')
makedepends=('gcc5' 'tk>=8.5.0')
optdepends=('tk: for IDLE, pynche and modulator'
            'net-tools: arp, ifconfig and netstat are used in the uuid module')
checkdepends=('net-tools')
changelog=ChangeLog
source=(https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz
        modulator-launcher
        pynche-launcher
        python-2.6-db-4.8.patch
        python-2.6-dbm.patch
        python-2.6-distutils.patch
        python-2.6-expat-2.2.patch
        python-2.6-internal-expat.patch
        python-2.6-mhlib-nlinks.patch
        python-2.6-pyexpat-segfault.patch
        python-2.6-readline-6.3.patch
        python-2.6-sqlite-test.patch
        python-2.6-ssl-nosslv3.patch
        python-2.6-tkinter-86.patch
        python-2.6-whichdb-gdbm-1.9.patch
        python-2.6-socket-test.patch)
sha256sums=('cae7bb995006ea5b703d9d28446f694894c441fe4bfb95d561c0ac908cd06e41'
            '9fb0914357b43d4d6d5ea58ef7827cd0f5784792060e776dfa62d6e372b08f8e'
            'e92e300ef7844478c53c37d7c05a27adc714d11106e79537da4b3b8ef039d6cb'
            '2a4b9d85c6b616e5df30d42d0890865f2c2103e8d7d5d7d77c092f1f7aff1458'
            '43fd72dda5d85d8aeda1de100073ee472463fd5c8af55162598f7acec1d65323'
            '68804810b351403e16c09e24053221dda123d3163f24f3feb4fb2dab595e774e'
            '1c1731c1a703844fad3de52b4378e2158c532442c67cfea3f8d6eecf7b7ce54f'
            'c99c8305180083e40aff789e3a3c74ed375037fdc7bd02876270b09274033069'
            'fd2a30acdd05e172ff3c0db2cce3371c184d67a1d9bd04a1582a5e6bc8fb80e6'
            '2aea683887955e59c6cff227a0d63aee3991571b7207a97d5985ba9ebd69e983'
            '5cc38033f7b7f7d6a25e63e14e9ae2de71bdf9106049e1cbad666bfe26d9cb7b'
            '9c01e3bb264eaf6444b76ba6f5265d79bda234b5542fe3d2b478628412186c1e'
            '15bcbd12b6b103db67d828dbf50e22965dc3037297a88616725188b6576d25bb'
            'dbbc72d9c71c065fe3700af4322a130d5c5c459b6ee512f66e7e5eb9e4971171'
            'e0dc2156ca821eaaada49cf5e1e301fc828215288aae648a6e7e4d4da1b38050'
            '8e9d212f8b37c16949fe8707c4300e5721f5b92a40b5f6d0e464929cb7483002')

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  patch -Np0 -i ${srcdir}/python-2.6-internal-expat.patch

  # https://bugs.python.org/issue6949
  patch -Np0 -i ${srcdir}/python-2.6-db-4.8.patch

  patch -Np0 -i ${srcdir}/python-2.6-dbm.patch

  # https://bugs.python.org/issue10126
  patch -Np1 -i ${srcdir}/python-2.6-distutils.patch

  # https://bugs.python.org/issue7759
  patch -Np1 -i ${srcdir}/python-2.6-mhlib-nlinks.patch

  # https://bugs.python.org/issue9054
  patch -Np1 -i ${srcdir}/python-2.6-pyexpat-segfault.patch

  # https://bugs.python.org/issue20374
  patch -Np1 -i ${srcdir}/python-2.6-readline-6.3.patch

  # https://bugs.python.org/issue20901
  patch -Np1 -i ${srcdir}/python-2.6-sqlite-test.patch

  patch -Np1 -i ${srcdir}/python-2.6-ssl-nosslv3.patch

  patch -Np1 -i ${srcdir}/python-2.6-tkinter-86.patch

  # https://bugs.python.org/issue13007
  patch -Np1 -i ${srcdir}/python-2.6-whichdb-gdbm-1.9.patch

  # https://bugs.python.org/issue27369
  patch -Np0 -i ${srcdir}/python-2.6-expat-2.2.patch

  # CPython SVN r86565
  patch -Np1 -i ${srcdir}/python-2.6-socket-test.patch

  # Ensure that we are using the system copy of various libraries
  # (expat, zlib and libffi), rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  # pacman 5.0.2-2 adds -fno-plt to default makepkg flags, which is unsupported by gcc5
  export CFLAGS="${CFLAGS/-fno-plt/}"
  export CXXFLAGS="${CXXFLAGS/-fno-plt/}"

  export OPT="${CFLAGS}"
  export CPPFLAGS="${CPPFLAGS} -DOPENSSL_NO_SSL3 -I/usr/include/openssl-1.0"
  export LDFLAGS="${LDFLAGS} -L/usr/lib/openssl-1.0"
  # A lot of tests fail under GCC >= 6.x
  export CPP="cpp-5"
  export CC="gcc-5"
  export CXX="g++-5"

  ./configure --prefix=/usr \
    --enable-shared \
    --enable-ipv6 \
    --enable-unicode=ucs4 \
    --with-system-ffi \
    --with-threads

  make clean
  make MACHDEP=linux2
}

check() {
  cd "${srcdir}/Python-${pkgver}"

  if [ $EUID -eq 0 ]; then
    echo "Effective user ID 0 detected!"
    echo "Several tests will FAIL if you run them as root."
    echo "If you must build this package as root,"
    echo "use the --nocheck option to makepkg."
    return 1
  fi

  export CPP="cpp-5"
  export CC="gcc-5"
  export CXX="g++-5"

  if [ "x$CARCH" = "xarm" ]; then
    # test_float fails on arm
    # issue with no fix: https://bugs.python.org/issue8265
    LD_LIBRARY_PATH="$(pwd)" ./python Lib/test/regrtest.py -x test_float -w
  else
    make test EXTRATESTOPTS="-w"
  fi
}

package() {
  cd "${srcdir}/Python-${pkgver}"

  export CPP="cpp-5"
  export CC="gcc-5"
  export CXX="g++-5"

  make DESTDIR="${pkgdir}" altinstall maninstall

  ln -sf ../../libpython${_pybasever}.so \
      "${pkgdir}/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so"

  mv "${pkgdir}/usr/bin/smtpd.py" "${pkgdir}/usr/lib/python${_pybasever}/"

  # Install the tools

  # modulator
  sed -i "s#%%PYBASEVER%%#${_pybasever}#g" "${srcdir}/modulator-launcher"
  install -m755 "${srcdir}/modulator-launcher" \
    "${pkgdir}/usr/bin/modulator${_pybasever}"
  cp -r Tools/modulator "${pkgdir}/usr/lib/python${_pybasever}/site-packages"

  # pynche
  sed -i "s#%%PYBASEVER%%#${_pybasever}#g" "${srcdir}/pynche-launcher"
  install -m755 "${srcdir}/pynche-launcher" \
    "${pkgdir}/usr/bin/pynche${_pybasever}"
  rm -f Tools/pynche/*.pyw
  cp -r Tools/pynche "${pkgdir}/usr/lib/python${_pybasever}/site-packages"

  # some useful "stuff"
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py \
    "${pkgdir}/usr/lib/python${_pybasever}/Tools/i18n/"
  install -m755 Tools/scripts/{README,*py} \
    "${pkgdir}/usr/lib/python${_pybasever}/Tools/scripts/"

  # fix conflicts with main python package
  mv "${pkgdir}"/usr/bin/idle{,${_pybasever}}
  mv "${pkgdir}"/usr/bin/pydoc{,${_pybasever}}
  mv "${pkgdir}"/usr/bin/2to3{,-${_pybasever}}
  mv "${pkgdir}"/usr/share/man/man1/python{,${_pybasever}}.1

  # clean up #!s
  find "${pkgdir}/usr/lib/python${_pybasever}/" -name '*.py' | xargs sed -i \
    "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python${_pybasever}|"

  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" \
    "${pkgdir}/usr/lib/python${_pybasever}/config/Makefile"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
