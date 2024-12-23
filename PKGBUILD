# Maintainer: Raymond Li <aur@raymond.li>
# Previous Maintainer: Kevin Morris <kevr@0cost.org>
# Previous Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-dbg
_major=3
_minor=12
_patch=7
_pybasever=${_major}
_pyminorver=${_pybasever}.${_minor}
pkgver=${_pyminorver}.${_patch}
pkgrel=1
epoch=0
pkgdesc="Python 3 interpreter (debug)."
arch=('i686' 'x86_64')
url='http://www.python.org/'
license=('custom')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('gcc' 'make' 'm4' 'autoconf' 'valgrind')
options=(!debug !strip)

source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz")
sha256sums=('24887b92e2afd4a2ac602419ad4b596372f67ac9b077190f459aba390faf5550')

prepare() {
    cd Python-${pkgver}

    # FS#23997
    sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

    # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
    # rather than copies shipped in the tarball
#    rm -rf Modules/expat
#    rm -rf Modules/_ctypes/{darwin,libffi}*
#    rm -rf Modules/_decimal/libmpdec
}

build() {
    cd Python-${pkgver}

    # Disable bundled pip & setuptools
    export ax_cv_c_float_words_bigendian=no
    ./configure --prefix=/opt/${pkgname} \
                --enable-ipv6 \
                --enable-loadable-sqlite-extensions \
                --enable-optimizations \
                --enable-shared \
                --with-computed-gotos \
                --with-dbmliborder=gdbm:ndbm \
                --with-lto \
                --with-pydebug \
                --with-system-expat \
                --with-system-ffi \
                --with-threads \
                --with-valgrind \
                --with-ensurepip


    # Obtain next free server number for xvfb-run; this even works in a chroot environment.
    #export servernum=99
    #while ! xvfb-run -a -n "$servernum" /bin/true 2>/dev/null; do servernum=$((servernum+1)); done

    # To configure the number of cpu threads used for compilation,
    # replace `$(nproc)` with a specific number.
    LC_CTYPE=en_US.UTF-8 make EXTRA_CFLAGS="$CFLAGS" -j$(nproc)
}

package() {
    cd Python-${pkgver}

    # Hack to avoid building again
    sed -i 's/^all:.*$/all: build_all/' Makefile

    make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" install
    find . -iname '*.so' -exec objcopy --only-keep-debug '{}' '{}.debug' \;

    LIBPATH=/opt/${pkgname}/lib
    BINPATH=/opt/${pkgname}/bin
    MANPATH=/opt/${pkgname}/share/man/man1
    TOOLPATH=/opt/${pkgname}/lib/python${_pybasever}/Tools

    # Prepare package symlink directories.
    mkdir -p "${pkgdir}"/usr/{bin,lib}
    mkdir -p "${pkgdir}"/usr/share/man/man1
    mkdir -p "${pkgdir}"/usr/share/licenses/"${pkgname}"
    mkdir -p "${pkgdir}"/"${TOOLPATH}"/{i18n,scripts}

    # Link /usr/lib/libpythonX.Xd.so for python-dbg.
    ln -s ${LIBPATH}/libpython${_pyminorver}d.so.1.0 "${pkgdir}"/usr/lib/
    ln -s ${LIBPATH}/libpython${_pyminorver}d.so     "${pkgdir}"/usr/lib/

    # Link pip.
    ln -s ${BINPATH}/pip${_pybasever}            "${pkgdir}"/usr/bin/pip${_pybasever}-dbg
    ln -s ${BINPATH}/pip${_pyminorver}           "${pkgdir}"/usr/bin/pip${_pyminorver}-dbg

    # Link pythonX.Xd executable.
    ln -s ${BINPATH}/python${_pyminorver}d        "${pkgdir}"/usr/bin/python${_pyminorver}d
    ln -s ${BINPATH}/python${_pyminorver}d-config "${pkgdir}"/usr/bin/python${_pyminorver}d-config

    # Link python-dbg executables.
    ln -s ${BINPATH}/python${_pybasever}         "${pkgdir}"/usr/bin/python-dbg
    ln -s ${BINPATH}/python${_pybasever}-config  "${pkgdir}"/usr/bin/python-config-dbg
    ln -s ${BINPATH}/python${_pybasever}         "${pkgdir}"/usr/bin/python${_pybasever}-dbg
    ln -s ${BINPATH}/python${_pybasever}-config  "${pkgdir}"/usr/bin/python${_pybasever}-config-dbg
    ln -s ${BINPATH}/python${_pyminorver}        "${pkgdir}"/usr/bin/python${_pyminorver}-dbg
    ln -s ${BINPATH}/python${_pyminorver}-config "${pkgdir}"/usr/bin/python${_pyminorver}-config-dbg

    # Link idle.
    ln -s ${BINPATH}/idle${_pybasever}           "${pkgdir}"/usr/bin/idle${_pybasever}-dbg
    ln -s ${BINPATH}/idle${_pyminorver}          "${pkgdir}"/usr/bin/idle${_pyminorver}-dbg

    # Link pydoc.
    ln -s ${BINPATH}/pydoc${_pybasever}          "${pkgdir}"/usr/bin/pydoc${_pybasever}-dbg
    ln -s ${BINPATH}/pydoc${_pyminorver}         "${pkgdir}"/usr/bin/pydoc${_pyminorver}-dbg

    # Link manpages.
    ln -s ${MANPATH}/python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python-dbg.1
    ln -s ${MANPATH}/python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python${_pybasever}-dbg.1
    ln -s ${MANPATH}/python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python${_pyminorver}-dbg.1

    # some useful "stuff" FS#46146
    install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/"${TOOLPATH}"/i18n/
    install -m755 Tools/scripts/{README,*py} "${pkgdir}"/"${TOOLPATH}"/scripts/

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
