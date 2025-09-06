# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_basename="stackless"
pkgver=2.7.18slp+p16
_pkgver="${pkgver%%+*}"
_api="${_pkgver%.*}"
pkgrel=1
pkgname="${_basename}${pkgver%%.*}"
pkgdesc="The Stackless Python programming language"
arch=('x86_64')
_url="https://github.com/stackless-dev/${_basename}"
url="${_url}/wiki"
license=('PSF-2.0')
depends=(
  'bzip2'
  'expat'
  'gdbm'
  'glibc'
  'libffi'
  'libnsl'
  'libxcrypt'
  'ncurses'
  'openssl-1.1'
  'readline'
  'sqlite'
  'zlib'
)
makedepends=(
  'tk'
  'bluez-libs'
)
checkdepends=(
  'gdb'
  'file'
  'xorg-server-xvfb'
  'xterm'
)
optdepends=(
  'tk: for IDLE'
)
provides=(
  "python${_api}"
  "python${_api%.*}"
)
conflicts=(
  "${provides[@]}"
  'python<3'
)
options=(
  # '!lto'
)
_pkgsrc="${_url##*/}-${_pkgver//slp/-slp}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${_pkgver//slp/-slp}.tar.gz"
        "https://dev.gentoo.org/~mgorny/dist/python/python-gentoo-patches-${_pkgver%%slp*}_${pkgver##*+}.tar.xz"
        "python2_mtime_workaround.patch"
        "${pkgname}_no_common.patch")
md5sums=('c818ced6fab6c5a04fb080268bc4989d'
         'b3016e44847e7106f5979d40fbccf8d7'
         'bc8dedb8d9eb85e40053822fbcaf4f55'
         'ad214569b2e7fe25a39c316e0cd60e90')
b2sums=('2209ca0a81dae6ca03ea89dddcefe48a8dd8e1e521b695f6011378e8889287031a1c11753e794a13f85b505b10f73455f26ece620bb422b812c8ac5c1fb27e6c'
        '0139c0944f62f9cdd236f6a8557e0ed19704c7d72869af1cb7d8bd3e646a746cd4a0201e1b44232a5e78ef49f254db20b0d0271bf744fbfd4fe0f1e99b8f3e6c'
        '55849d8960f0e5dc7b60a604f3264e12a80707db5bfb7d5c2fd6ceada894dc846a77a9fe2294bbdb6f87213a9b2051c7c6614ac6e0faf71bc947d3d96da5b2e4'
        '02096b756d284fcb9ee60c46796e630b0988a1a950e51b93f771335649fed11781c7d5cd8cf522b5f4ec4e5da1171806333c177b4c8a41a12e9743287d5a6bbe')

prepare() {
  local gentoo_patches=(
    # CVE-2019-20907
    0001-bpo-39017-Avoid-infinite-loop-in-the-tarfile-module-.patch
    # CVE-2020-8492
    0002-bpo-39503-CVE-2020-8492-Fix-AbstractBasicAuthHandler.patch
    # CVE-2020-26116
    0003-bpo-39603-Prevent-header-injection-in-http-methods-G.patch
    0004-bpo-42051-Reject-XML-entity-declarations-in-plist-fi.patch
    # CVE-2020-27619
    0005-bpo-41944-No-longer-call-eval-on-content-received-vi.patch
    0006-bpo-40791-Make-compare_digest-more-constant-time.-GH.patch
    # CVE-2021-3177
    0007-3.6-closes-bpo-42938-Replace-snprintf-with-Python-un.patch
    # CVE-2021-23336
    0008-3.6-bpo-42967-only-use-as-a-query-string-separator-G.patch
    0009-py2-ize-the-CJK-codec-test.patch
    0010-3.6-bpo-43285-Make-ftplib-not-trust-the-PASV-respons.patch
    0011-bpo-43075-Fix-ReDoS-in-urllib-AbstractBasicAuthHandl.patch
    0012-3.9-bpo-43882-urllib.parse-should-sanitize-urls-cont.patch
    0013-Backport-bpo-44022-Fix-http-client-infinite-line-rea.patch
    0014-bpo-43124-Fix-smtplib-multiple-CRLF-injection-GH-259.patch
    0015-bpo-42278-Use-tempfile.TemporaryDirectory-rather-tha.patch
    0016-Fix-accidentally-leaving-one-sub-test-commented-out.patch
    0017-bpo-46811-Make-test-suite-support-Expat-2.4.5-GH-314.patch
    0018-bpo-46756-Fix-authorization-check-in-urllib.request-.patch
    0019-Install-libpythonX.Y.a-in-usr-lib-instead-of-usr-lib.patch
    0020-Disable-modules-and-SSL.patch
    # Gentoo specific patch
    # 0021-Gentoo-libdir.patch
    # Don't need this
    # 0022-Non-zero-exit-status-on-failure.patch
    # causes error: IndentationError: expected an indented block
    # 0023-sqlite-loadable-extensions.patch
    0024-Regenerate-platform-specific-modules.patch
    # Causes failure on test_distutils
    # 0025-distutils-C.patch
    0026-Turkish-locale.patch
    0027-ARM-OABI.patch
    0028-use_pyxml.patch
    0029-Disable-nis.patch
    # Does not apply cleanly
    # 0030-Make-module-byte-compilation-non-fatal.patch
    0031-Use-ncurses-to-find-pkg-config.patch
    0032-Use-specific-Werror-for-cross-compile-tests.patch
    0033-Force-using-system-libffi.patch
    0034-test.support.unlink-ignore-EACCES.patch
    0035-ssl-Hard-disable-SSLv3-to-avoid-automagic-deps.patch
    0036-Fix-Wimplicit-int-Wimplicit-function-declaration.patch
  )

  cd "${srcdir}/${_pkgsrc}"
  # makepkg will touch all files to $SOURCE_DATE_EPOCH which will break pyc file's mtime check.
  # workaround this by touching them to $SOURCE_DATE_EPOCH before running compileall.
  patch -Np0 -i "${srcdir}/python2_mtime_workaround.patch"

  patch -Np1 -i "${srcdir}/${pkgname}_no_common.patch"

  for gentoo_patch in "${gentoo_patches[@]}"; do
    patch -Np1 -i "${srcdir}/python-gentoo-patches-${_pkgver%%slp*}_${pkgver##*+}/${gentoo_patch}" || true
  done

  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_api}/" Python/pythonrun.c

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

  sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
    Lib/distutils/tests/test_install_scripts.py

  # clean up #!s
  find . -name '*.py' | \
    xargs sed -i "s|#[ ]*![ ]*/usr/bin/env python$|#!/usr/bin/env python2|"

  # Workaround asdl_c.py/makeopcodetargets.py errors after we touched the shebangs
  touch Include/Python-ast.h Python/Python-ast.c Python/opcode_targets.h

  cd "Modules"
  rm -rf "_ctypes"/{darwin,libffi}* "expat" "zlib"
}

build() {
  export CFLAGS+=" -std=gnu17 -Wno-error=incompatible-pointer-types" # -fcommon
  export CPPFLAGS+=" -I/usr/include/openssl-1.1"
  export LDFLAGS+=" -L/usr/lib/openssl-1.1"
  export OPT="${CFLAGS}"
  local configure_options=(
    --prefix='/usr'
    --enable-shared
    --with-threads
    --enable-optimizations
    --with-lto
    --enable-ipv6
    --enable-unicode=ucs4
    --with-system-expat
    --with-system-ffi
    --with-dbmliborder=gdbm:ndbm
    --without-ensurepip
  )

  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

check() {
  export TERM=xterm
  export LD_LIBRARY_PATH="${srcdir}/${_pkgsrc}:${LD_LIBRARY_PATH}"
  local -x TZ=UTC
  local excluded_tests=(
    # Since 2.7.14 with latest xvfb
    test_idle # segfaults
    test_tk # segfaults
    test_ttk_guionly # segfaults
    # Since 2.7.15
    test_ctypes # test_ctypes
    test_ssl

    test_ftplib # krb5 errors
    test_imaplib # krb5 errors
    test_urllib2_localnet # krb5 errors
    test_codecmaps_jp # TODO
    test_ossaudiodev

    test_curses
    test_doctest_main_issue4197
    test_ssl # requires internet
  )

  cd "${srcdir}/${_pkgsrc}"
  xvfb-run ./python -m test.regrtest -v -uall -x "${excluded_tests[@]}"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  make DESTDIR="${pkgdir}" altinstall maninstall

  install -vDm644 "README"  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # some useful "stuff"
  cd "Tools"
  install -dm755 "${pkgdir}/usr/lib/python${_api}/Tools/"{i18n,scripts}
  install -vm755 "i18n/"{msgfmt,pygettext}.py "${pkgdir}/usr/lib/python${_api}/Tools/i18n/"
  install -vm755 "scripts/"{README,*py} "${pkgdir}/usr/lib/python${_api}/Tools/scripts/"

  cd "${pkgdir}/usr"
  rm -f "share/man/man1/python.1"

  ln -vsf "python${_api}"        "bin/python2"
  ln -vsf "python${_api}-config" "bin/python2-config"
  ln -vsf "python${_api}.1"      "share/man/man1/python2.1"

  # FS#33954
  ln -sf "python-${_api}.pc"     "lib/pkgconfig/python2.pc"

  ln -sf "../../libpython${_api}.so" "lib/python${_api}/config/libpython${_api}.so"

  mv "bin/smtpd.py" "lib/python${_api}/"

  # fix conflicts with python
  mv "bin/idle"{,2}
  mv "bin/pydoc"{,2}
  mv "bin/2to3"{,-"${_api}"}

  # clean-up reference to build directory
  sed -i "s#${srcdir}/${_pkgsrc}:##" "lib/python${_api}/config/Makefile"
}
