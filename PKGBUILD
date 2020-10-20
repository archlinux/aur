# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>
# Contributor: Dr-Shadow <kerdiles.robin@gmail.com>

pkgname=mingw-w64-python
pkgver=3.8.6
_pybasever=3.8
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (mingw-w64)"
arch=('any')
license=('PSF')
url="https://www.python.org/"
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
         'mingw-w64-mpdecimal'
         'mingw-w64-sqlite')

makedepends=('mingw-w64-configure' 'mingw-w64-wine' 'python')
optdepends=('mingw-w64-wine: runtime support')
options=('staticlibs' '!buildflags' '!strip')
source=("https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        "patches.tar.xz"
        "wine-python.sh")
sha1sums=('6ee446eaacf901a3305565bd6569e2de135168e3'
          'fd5dea1f6f0a887cfdea90c40de3ff327a6b12da'
          'a024e7fd7eea7984a0d050164a4a015dea762da7')
sha512sums=('22faec84f6e172e1ac7c6bd6fd37e9b6ae4afc91cf5136aa8cac8ebbed8d18793f9196e8749b8ccc43447cb6c41cb450f65ea72dd363c06dfaeb14e0455f5560'
            'e6dc81c167c733cba70c6a39530c002d3fd5c753b5b9c707973da27b66b4cb5c3a186bed9834de269eec6e763c7731c3b7aec2bb8736b26686bd89de76127073'
            'd0fb7f0e1a3d98a170ebea301226ad8caa7ffab9fc0bee224abc31c22875c892b43d3468dffbdd15eb71ca1b5260e039d0fceb21ecc92341b9bb6949d7e9be6a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

# Helper macros to help make tasks easier #
apply_patch_with_msg() {
  for _patch in "$@"
  do
    msg2 "Applying ${_patch}"
    patch -Nbp1 -i "${srcdir}/${pkgver}/${_patch}"
  done
}

del_file_exists() {
  for _fname in "$@"
  do
    if [ -f ${_fname} ]; then
      rm -rf ${_fname}
    fi
  done
}
# =========================================== #

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  plain "Apply Ray Donnelly's should-be-upstreamed patches"
  apply_patch_with_msg \
    0000-make-_sysconfigdata.py-relocatable.patch \
    0001-fix-_nt_quote_args-using-subprocess-list2cmdline.patch \
    0002-restore-setup-config.patch

  plain "Apply Roumen Petrov's core patches (10)"
  apply_patch_with_msg \
    0100-MINGW-BASE-use-NT-thread-model.patch \
    0110-MINGW-translate-gcc-internal-defines-to-python-platf.patch \
    0130-MINGW-configure-MACHDEP-and-platform-for-build.patch \
    0140-MINGW-preset-configure-defaults.patch \
    0150-MINGW-configure-largefile-support-for-windows-builds.patch \
    0170-MINGW-add-srcdir-PC-to-CPPFLAGS.patch \
    0180-MINGW-init-system-calls.patch \
    0200-MINGW-build-in-windows-modules-winreg.patch \
    0210-MINGW-determine-if-pwdmodule-should-be-used.patch

  plain "Apply Roumen Petrov's compiler patch (2)"
  apply_patch_with_msg \
    0250-MINGW-compiler-customize-mingw-cygwin-compilers.patch \
    0260-MINGW-compiler-enable-new-dtags.patch

  plain "Apply Roumen Petrov's extensions patches (21)"
  apply_patch_with_msg \
    0290-issue6672-v2-Add-Mingw-recognition-to-pyport.h-to-al.patch \
    0300-MINGW-configure-for-shared-build.patch \
    0310-MINGW-dynamic-loading-support.patch \
    0330-MINGW-ignore-main-program-for-frozen-scripts.patch \
    0350-MINGW-setup-_multiprocessing-module.patch \
    0360-MINGW-setup-select-module.patch \
    0370-MINGW-setup-_ctypes-module-with-system-libffi.patch \
    0380-MINGW-defect-winsock2-and-setup-_socket-module.patch \
    0390-MINGW-exclude-unix-only-modules.patch \
    0400-MINGW-setup-msvcrt-and-_winapi-modules.patch \
    0410-MINGW-build-extensions-with-GCC.patch \
    0420-MINGW-use-Mingw32CCompiler-as-default-compiler-for-m.patch \
    0430-MINGW-find-import-library.patch \
    0440-MINGW-setup-_ssl-module.patch \
    0460-MINGW-generalization-of-posix-build-in-sysconfig.py.patch \
    0462-MINGW-support-stdcall-without-underscore.patch \
    0464-use-replace-instead-rename-to-avoid-failure-on-windo.patch \
    0470-MINGW-avoid-circular-dependency-from-time-module-dur.patch \
    0480-MINGW-generalization-of-posix-build-in-distutils-sys.patch \
    0490-MINGW-customize-site.patch

  plain "Apply Ray Donnelly's general/cross patches (42)"
  apply_patch_with_msg \
    0500-add-python-config-sh.patch \
    0510-cross-darwin-feature.patch \
    0520-py3k-mingw-ntthreads-vs-pthreads.patch \
    0530-mingw-system-libffi.patch \
    0555-msys-mingw-prefer-unix-sep-if-MSYSTEM.patch \
    0560-mingw-use-posix-getpath.patch \
    0565-mingw-add-ModuleFileName-dir-to-PATH.patch \
    0570-mingw-add-BUILDIN_WIN32_MODULEs-time-msvcrt.patch

  apply_patch_with_msg \
    0610-msys-cygwin-semi-native-build-sysconfig.patch \
    0620-mingw-sysconfig-like-posix.patch \
    0630-mingw-_winapi_as_builtin_for_Popen_in_cygwinccompiler.patch \
    0640-mingw-x86_64-size_t-format-specifier-pid_t.patch \
    0650-cross-dont-add-multiarch-paths-if-cross-compiling.patch \
    0660-mingw-use-backslashes-in-compileall-py.patch \
    0670-msys-convert_path-fix-and-root-hack.patch \
    0690-allow-static-tcltk.patch

  apply_patch_with_msg \
    0720-mingw-pdcurses_ISPAD.patch \
    0740-grammar-fixes.patch \
    0750-builddir-fixes.patch \
    0770-msys-replace-slashes-used-in-io-redirection.patch \
    0800-mingw-install-layout-as-posix.patch \
    0810-remove_path_max.default.patch \
    0820-dont-link-with-gettext.patch \
    0830-ctypes-python-dll.patch \
    0840-gdbm-module-includes.patch \
    0850-use-gnu_printf-in-format.patch \
    0870-mingw-fix-ssl-dont-use-enum_certificates.patch \
    0890-mingw-build-optimized-ext.patch \
    0900-cygwinccompiler-dont-strip-modules-if-pydebug.patch \
    0910-fix-using-dllhandle-and-winver-mingw.patch \
    0920-mingw-add-LIBPL-to-library-dirs.patch \
    0970-Add-AMD64-to-sys-config-so-msvccompiler-get_build_version-works.patch \
    0990-MINGW-link-with-additional-library.patch \
    1010-install-msilib.patch \
    1060-dont-include-system-ncurses-path.patch

  plain "New patches added for the update from 3.5.3 to 3.6.1"
  apply_patch_with_msg \
    1620-fix-signal-module-build.patch \
    1630-build-winconsoleio.patch \
    1650-expose-sem_unlink.patch

  # Extend some isatty calls to check for mintty when checking for
  # a terminal output.
  # https://github.com/Alexpux/MINGW-packages/issues/2645
  # https://github.com/Alexpux/MINGW-packages/issues/2656
  apply_patch_with_msg \
    1700-cygpty-isatty.patch

  # gdbm is broken and as a result breaks dbm/shelve.
  # Don't include it so the dbm.dumb backend is used instead,
  # like with the official CPython build.
  apply_patch_with_msg \
    1701-disable-broken-gdbm-module.patch

  # https://github.com/Alexpux/MINGW-packages/issues/3139
  apply_patch_with_msg \
    1800-link-win-resource-files-and-build-pythonw.patch

  apply_patch_with_msg \
    1810-3.7-mpdec-mingw.patch \
    1850-disable-readline.patch \
    1860-fix-isselectable.patch \
    1870-use-_wcsnicmp-instead-wcsncasecmp.patch \
    1890-_xxsubinterpretersmodule.patch

  # https://github.com/msys2/MINGW-packages/issues/5184
  apply_patch_with_msg 2010-configure-have-inet-pton.patch

  # https://github.com/msys2/MINGW-packages/issues/5155
  apply_patch_with_msg 2030-fix-msvc9-import.patch

  # https://github.com/msys2/MINGW-packages/issues/5001
  apply_patch_with_msg 2050-undo-venv-redirector.patch
  apply_patch_with_msg 2051-set-venv-activate-path-unix.patch
  apply_patch_with_msg 2052-venv-remove-msys-from-env-and-add-exe-prefix.patch

  apply_patch_with_msg 2060-pass-gen-profile-ldflags.patch
  
  apply_patch_with_msg 2070-distutils-add-windmc-to-cygwinccompiler.patch
  apply_patch_with_msg 2080-pkg-config-windows-must-link-ext-with-python-lib.patch

  # https://github.com/msys2/MINGW-packages/issues/6035
  apply_patch_with_msg 3000-importlib-bootstrap-path-sep.patch
  apply_patch_with_msg 3001-pathlib-path-sep.patch

  apply_patch_with_msg 5000-warnings-fixes.patch

  apply_patch_with_msg extra_fixups.patch

  apply_patch_with_msg mingw_host_platform.patch

  # fix case
  sed -e "s|MSTcpIP.h|mstcpip.h|g" -i ${srcdir}/Python-${pkgver}/Modules/socketmodule.h
  sed -e "s|Windows.h|windows.h|g" -i ${srcdir}/Python-${pkgver}/Modules/_io/_iomodule.c
  sed -e "s|VersionHelpers.h|versionhelpers.h|g" -i ${srcdir}/Python-${pkgver}/Modules/socketmodule.c

  autoreconf -vfi
}

build() {
  cd "${srcdir}/Python-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    CFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 -D_WIN32_WINNT=0x0601"
    CXXFLAGS+=" -fwrapv -D__USE_MINGW_ANSI_STDIO=1 -D_WIN32_WINNT=0x0601"
    CPPFLAGS+=" -I/usr/${_arch}/include/ncursesw "

    declare -a _extra_config
    if check_option "strip" "y"; then
      LDFLAGS+=" -s "
    fi
    if check_option "debug" "n"; then
      CFLAGS+=" -DNDEBUG "
      CXXFLAGS+=" -DNDEBUG "
    else
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
      --with-nt-threads \
      --with-computed-gotos \
      --with-system-expat \
      --with-system-ffi \
      --with-system-libmpdec \
      --without-ensurepip \
      --without-c-locale-coercion \
      --enable-loadable-sqlite-extensions \
      "${_extra_config[@]}" \
      OPT=""

    # append ${_arch} to windres
    sed -e "s|windres|${_arch}-windres|g" -i ${srcdir}/Python-${pkgver}/build-${_arch}/Makefile
    
    make

    # wrappers
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python${_pybasever}
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python3
    sed "s|@TRIPLE@|${_arch}|g;s|@PYVER@|${_pybasever}|g" "${srcdir}"/wine-python.sh > ${_arch}-python
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    if check_option "debug" "n"; then
      VERABI=${_pybasever}
    else
      VERABI=${_pybasever}d
    fi
    
    [[ -d "${pkgdir}/usr/${_arch}"/share/gdb/python3/ ]] || mkdir -p "${pkgdir}/usr/${_arch}"/share/gdb/python3/
    install -D -m644 python.exe-gdb.py "${pkgdir}/usr/${_arch}/share/gdb/python3/python_gdb.py"
    
    chmod 755 "$pkgdir"/usr/${_arch}/bin/*.dll
    install -m 644 libpython${_pybasever}.a "$pkgdir"/usr/${_arch}/lib
    install -m 644 libpython${_pybasever}.dll.a "$pkgdir"/usr/${_arch}/lib
    
    # Need for building boost python3 module
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/libpython${VERABI}.dll.a "${pkgdir}/usr/${_arch}"/lib/libpython${_pybasever}.dll.a
    
    # some useful "stuff"
    install -dm755 "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/i18n/
    install -m755 "${srcdir}/Python-${pkgver}"/Tools/scripts/{README,*py} "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/Tools/scripts/
    
    # clean up #!s
    find "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/ -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python3|"
    
    # clean-up reference to build directory
    sed -i "s#${srcdir}/Python-${pkgver}:##" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/Makefile

    for fscripts in 2to3-${_pybasever} idle3 idle${_pybasever} pydoc3 pydoc${_pybasever}; do
      sed -e "s|/usr/bin/python${_pybasever}.exe|/usr/bin/env python${_pybasever}.exe|g" -i "${pkgdir}/usr/${_arch}"/bin/$fscripts
    done

    sed -i "s|#!${pkgdir}/usr/${_arch}/bin/python${VERABI}.exe|#!/usr/bin/env python${_pybasever}.exe|" "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/config-${VERABI}/python-config.py

    # fix permissions
    find ${pkgdir}/usr/${_arch} -type f \( -name "*.dll" -o -name "*.exe" \) | xargs chmod 0755
    
    # replace paths in sysconfig
    sed -i "s|${pkgdir}/usr/${_arch}|/usr/${_arch}|g" \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata*.py \
    "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/smtpd.py
    
    # Doing sysconfig relocatable as patch 0000 do it only partially
    sed -e "s/sys.prefix + //g" \
      -e "s/'\/bin'/sys.prefix + '\/bin'/g" \
      -e "s/'\/include\//sys.prefix + '\/include\//g" \
      -e "s/'\/include /sys.prefix + '\/include /g" \
      -e "s/'\/include'/sys.prefix + '\/include'/g" \
      -e "s/ \/include\// ' + sys.prefix + '\/include\//g" \
      -e "s/ \/include / ' + sys.prefix + '\/include /g" \
      -e "s/'\/lib\//sys.prefix + '\/lib\//g" \
      -e "s/'\/lib /sys.prefix + '\/lib /g" \
      -e "s/'\/lib'/sys.prefix + '\/lib'/g" \
      -e "s/ \/lib\// ' + sys.prefix + '\/lib\//g" \
      -e "s/ \/lib / ' + sys.prefix + '\/lib /g" \
      -e "s/'\/share\//sys.prefix + '\/share\//g" \
      -e "s/'\/share'/sys.prefix + '\/share'/g" \
      -i "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata*.py
    
    # Correct name of _sysconfigdata__win32_.py and copy both to lib-dynload
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata__win_.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata__win32_.py
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata__win_.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/lib-dynload/_sysconfigdata__win_.py
    cp -f "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/_sysconfigdata__win32_.py "${pkgdir}/usr/${_arch}"/lib/python${_pybasever}/lib-dynload/_sysconfigdata__win32_.py
    
    # strip executables and libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    
    # install wrappers
    mkdir -p ${pkgdir}/usr/bin
    install -m755 ${_arch}-python${_pybasever} "${pkgdir}"/usr/bin/${_arch}-python${_pybasever}
    install -m755 ${_arch}-python3 "${pkgdir}"/usr/bin/${_arch}-python3
    install -m755 ${_arch}-python "${pkgdir}"/usr/bin/${_arch}-python
    
    # create relative symlinks
    ln -s "python3.exe" "${pkgdir}/usr/${_arch}/bin/python.exe"
    ln -s "python3w.exe" "${pkgdir}/usr/${_arch}/bin/pythonw.exe"
    ln -s "python3-config" "${pkgdir}/usr/${_arch}/bin/python-config"
    ln -s "idle3" "${pkgdir}/usr/${_arch}/bin/idle"
    ln -s "pydoc3" "${pkgdir}/usr/${_arch}/bin/pydoc"
  done
}
