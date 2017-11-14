# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>
# Contributor: Dr-Shadow <kerdiles.robin@gmail.com>

pkgname=mingw-w64-python
pkgver=3.6.3
_pybasever=3.6
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt'
         'mingw-w64-expat'
         'mingw-w64-bzip2'
         'mingw-w64-libffi'
         'mingw-w64-ncurses'
         'mingw-w64-openssl'
         'mingw-w64-readline'
         'mingw-w64-tcl'
         'mingw-w64-tk'
         'mingw-w64-zlib'
         'mingw-w64-xz'
         'mingw-w64-sqlite'
         'wine')

makedepends=('mingw-w64-configure' 'mingw-w64-gcc' 'mingw-w64-pkg-config')
options=('staticlibs' '!buildflags' '!strip')

source=("http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        'patches.tar.gz')
sha1sums=('6c71b14bdbc4d8aa0cfd59d4b6dc356d46abfdf5'
          'f058e3caa8c5b0b37b9adfa413846a051ae558c6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # these are created by patches
  rm -f Misc/config_mingw Misc/cross_mingw32 Python/fileblocks.c

  PATCHES=$(find "${srcdir}/${pkgver}" -maxdepth 1 -name "*.patch" | sort)
  for PATCH in $PATCHES; do
    patch -Np1 -i $PATCH
  done

  autoreconf -vfi

  touch Include/graminit.h
  touch Python/graminit.c
  touch Parser/Python.asdl
  touch Parser/asdl.py
  touch Parser/asdl_c.py
  touch Include/Python-ast.h
  touch Python/Python-ast.c
  echo \"\" > Parser/pgen.stamp

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
}

build() {
  cd "${srcdir}/Python-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    CFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 "
    CXXFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1"
    CPPFLAGS+=" -I/usr/${_arch}/include/ncursesw "

  declare -a _extra_config
  if check_option "strip" "y"; then
    LDFLAGS+=" -s "
  fi
  if check_option "debug" "n"; then
    CFLAGS+=" -DNDEBUG "
    CXXFLAGS+=" -DNDEBUG "
  else
    plain " -DDEBUG -DPy_DEBUG -D_DEBUG does not work unfortunately .."
    #    CFLAGS+=" -DDEBUG -DPy_DEBUG -D_DEBUG "
    #    CXXFLAGS+=" -DDEBUG -DPy_DEBUG -D_DEBUG "
    CFLAGS+=" -O0 -ggdb"
    CXXFLAGS+=" -O0 -ggdb"
    _extra_config+=("--with-pydebug")
  fi

  # Workaround for conftest error on 64-bit builds
export ac_cv_working_tzset=no

    # export LIBFFI_INCLUDEDIR=`${_arch}-pkg-config libffi --cflags-only-I | sed "s|\-I||g"`
    CFLAGS+="-I/usr/${_arch}/include" \
    CXXFLAGS+="-I/usr/${_arch}/include" \
    CPPFLAGS+="-I/usr/${_arch}/include" \
    LDFLAGS+="-L/usr/${_arch}/lib" \
    ${_arch}-configure \
      --with-threads=win32 \
      --with-computed-gotos \
      --with-system-expat \
      --with-system-ffi \
      --without-ensurepip \
      "${_extra_config[@]}" \
      OPT=""

    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    if check_option "debug" "n"; then
      VERABI=${_pybasever}m
    else
      VERABI=${_pybasever}dm
    fi
    
    [[ -d "${pkgdir}/usr/${_arch}"/share/gdb/python3/ ]] || mkdir -p "${pkgdir}/usr/${_arch}"/share/gdb/python3/
    install -D -m644 python.exe-gdb.py "${pkgdir}/usr/${_arch}/share/gdb/python3/python_gdb.py"
    
    chmod 755 "$pkgdir"/usr/${_arch}/bin/*.dll
    install -m 644 libpython${_pybasever}m.a "$pkgdir"/usr/${_arch}/lib
    install -m 644 libpython${_pybasever}m.dll.a "$pkgdir"/usr/${_arch}/lib
    
    # Need for building boost python3 module
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/libpython${VERABI}.dll.a "${pkgdir}/usr/${_arch}"/lib/libpython${_pybasever}.dll.a
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/libpython${VERABI}.dll.a "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/libpython${_pybasever}.dll.a
    
    # some useful "stuff"
    install -dm755 "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/i18n/
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/scripts/{README,*py} "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/scripts/
    
    # clean up #!s
    find "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/ -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python3|"
    
    # clean-up reference to build directory
    sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/Makefile

    for fscripts in 2to3-${_pybasever} idle3 idle${_pybasever} pydoc3 pydoc${_pybasever} pyvenv pyvenv-${_pybasever}; do
      sed -e "s|/usr/${_arch}/bin/python${_pybasever}.exe|/usr/bin/env python${_pybasever}.exe|g" -i "${pkgdir}/usr/${_arch}"/bin/$fscripts
    done

    sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${VERABI}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/python-config.py

    # fix permissions
    find ${pkgdir}/usr/${_arch} -type f \( -name "*.dll" -o -name "*.exe" \) | xargs chmod 0755
    
    # replace paths in sysconfig
    sed -i "s|${pkgdir}/usr/${_arch}|/usr/${_arch}|g" \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata*.py \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/smtpd.py
    
    # Correct name of _sysconfigdata_m_win32_.py
    mv -f "${pkgdir}/usr/${_arch}"/lib/python3.6/_sysconfigdata_m_win_.py "${pkgdir}/usr/${_arch}"/lib/python3.6/_sysconfigdata_m_win32_.py
    
    # Create python executable with windows subsystem
    cp -f "${pkgdir}/usr/${_arch}"/bin/python3.exe "${pkgdir}/usr/${_arch}"/bin/python3w.exe
    /usr/${_arch}/bin/objcopy --subsystem windows "${pkgdir}/usr/${_arch}"/bin/python3w.exe
  done
}
