# Maintainer : Dr-Shadow <xxdrshadowxx@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>

pkgname=mingw-w64-python2
pkgver=2.7.14
_pybasever=2.7
pkgrel=1
pkgdesc="A high-level scripting language (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt'
         'mingw-w64-expat'
	 'mingw-w64-bzip2'
	 'mingw-w64-ncurses'
	 'mingw-w64-openssl'
	 'mingw-w64-libffi'
   'mingw-w64-tcl'
   'mingw-w64-tk'
	 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-configure' "python2>=${pkgver}" 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        'patches.tar.gz')
sha1sums=('cf146474fc988b4b6b53fdd81b71c2815873b469'
          'fa7bedb476ef593e87f2613d3dc029a1174c350e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # these are created by patches
  rm -f Misc/config_mingw \
        Misc/cross_mingw32 \
        Misc/python-config.sh.in \
        Misc/cross_mingw32 \
        Misc/python-config-u.sh.in \
        Python/fileblocks.c \
        Lib/list2cmdline.py

  PATCHES=$(find "${srcdir}/${pkgver}" -maxdepth 1 -name "*.patch" | sort)
  for PATCH in $PATCHES; do
    patch -Np1 -i $PATCH
  done

  # run PGEN through wine
  sed -i "s|\\\$(PGEN) \\\$(GRAMMAR_INPUT)|wine \\\$(PGEN) \\\$(GRAMMAR_INPUT)|g" Makefile.pre.in

  autoreconf -vfi

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

  sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
     Lib/distutils/tests/test_install_scripts.py Tools/scripts/gprof2html.py
  
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
  
  declare -a extra_config

  CFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 "
  CXXFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 "
  CPPFLAGS+=" -I/usr/${_arch}/include/ncursesw "

  if check_option "strip" "y"; then
    LDFLAGS+=" -s "
  fi

    # Most of this is unnecessary, perhaps just
    # the extra_config bit?
  if check_option "debug" "n"; then
    CFLAGS+=" -DNDEBUG "
    CXXFLAGS+=" -DNDEBUG "
  else
    CFLAGS+=" -DDEBUG -DPy_DEBUG -D_DEBUG "
    CXXFLAGS+=" -DDEBUG -DPy_DEBUG -D_DEBUG "
    extra_config+=("--with-pydebug")
  fi

  # Workaround for conftest error on 64-bit builds
    export ac_cv_working_tzset=no
    
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    export LIBFFI_INCLUDEDIR=`${_arch}-pkg-config libffi --cflags-only-I | sed "s|\-I||g"` 
    
    CFLAGS+="-I/usr/${_arch}/include" \
    CXXFLAGS+="-I/usr/${_arch}/include" \
    CPPFLAGS+="-I/usr/${_arch}/include" \
    LDFLAGS+="-L/usr/${_arch}/lib" \
    ${_arch}-configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} \
      --build=$CHOST \
      --enable-shared \
      --with-threads=win32 \
      --with-system-expat \
      --with-system-ffi \
      "${extra_config[@]}" \
      OPT=""
      #--with-dbmliborder='gdbm:ndbm'
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
  mv "${pkgdir}/usr/${_arch}"/bin/smtpd.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/

  [[ -d "${pkgdir}/usr/${_arch}"/share/gdb/python2/ ]] || mkdir -p "${pkgdir}/usr/${_arch}"/share/gdb/python2/
  cp -f python.exe-gdb.py "${pkgdir}/usr/${_arch}"/share/gdb/python2/python_gdb.py
  
  rm "${pkgdir}/usr/${_arch}"/bin/2to3
  
  # Copy python import library to $prefix/lib because some programs can't find it in other locations
  cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config/libpython${_pybasever}.dll.a "${pkgdir}/usr/${_arch}"/lib/libpython${_pybasever}.dll.a

  # some useful "stuff"
  install -dm755 "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 "${srcdir}/Python-${pkgver}"/Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/i18n/
  install -m755 "${srcdir}/Python-${pkgver}"/Tools/scripts/{README,*py} "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/scripts/

  # clean up #!s
  find "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/ -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"

  # clean-up reference to build directory
  sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config/Makefile

  for fscripts in idle pydoc; do
    sed -e "s|/usr/${_arch}/bin/|/usr/bin/env |g" -i "${pkgdir}/usr/${_arch}"/bin/$fscripts
  done

  sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${_pybasever}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/bin/python${_pybasever}-config
  sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${_pybasever}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/bin/python2-config
  sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${_pybasever}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/bin/python-config

  # fix permissons
  find ${pkgdir}/usr/${_arch} -type f \( -name "*.dll" -o -name "*.exe" \) | xargs chmod 0755

  # replace paths in sysconfig
  sed -i "s|${pkgdir}/usr/${_arch}|/usr/${_arch}|g" \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata.py \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/smtpd.py

  # Create python executable with windows subsystem
  cp -f "${pkgdir}/usr/${_arch}"/bin/python2.exe "${pkgdir}/usr/${_arch}"/bin/python2w.exe
  /usr/${_arch}/bin/objcopy --subsystem windows "${pkgdir}/usr/${_arch}"/bin/python2w.exe
  done
}
