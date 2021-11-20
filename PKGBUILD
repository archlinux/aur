# Maintainer: Kevin Morris <kevr@0cost.org>
# Previous Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-dbg
pkgver=3.9.7
pkgrel=1
epoch=0
pkgdesc="Python 3 debug symbols."
arch=('i686' 'x86_64')
url='http://www.python.org/'
license=('custom')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('gcc' 'make' 'm4' 'autoconf' 'valgrind')
checkdepends=()
optdepends=()
provides=('python')
conflicts=()
replaces=()
backup=()
options=(!debug !strip)

source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz")
sha256sums=('f8145616e68c00041d1a6399b76387390388f8359581abc24432bb969b5e3c57')

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
    ./configure --prefix=/usr \
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
                --without-ensurepip


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

    # Why are these not done by default...
    ln -s python3               "${pkgdir}"/usr/bin/python
    ln -s python3-config        "${pkgdir}"/usr/bin/python-config
    ln -s idle3                 "${pkgdir}"/usr/bin/idle
    ln -s pydoc3                "${pkgdir}"/usr/bin/pydoc
    ln -s python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python.1

    # some useful "stuff" FS#46146
    install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
    install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
