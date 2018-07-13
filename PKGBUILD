# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=python-dbg
pkgver=3.6.6
pkgrel=1
epoch=0
pkgdesc="Python 3 debug symbols."
arch=('i686' 'x86_64')
url='http://www.python.org/'
license=('custom')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('gcc' 'make' 'm4' 'autoconf')
checkdepends=()
optdepends=()
provides=('python')
conflicts=()
replaces=()
backup=()
options=(!debug !strip)

source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz"
        dont-make-libpython-readonly.patch)
md5sums=('c3f30a0aff425dda77d19e02f420d6ba'
         '60c9f7d02384f22834df06de5eb9c46a')

prepare() {
    cd Python-${pkgver}

    # FS#45809
    patch -p1 -i ../dont-make-libpython-readonly.patch

    # FS#23997
    sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

    # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
    # rather than copies shipped in the tarball
    rm -r Modules/expat
    rm -r Modules/_ctypes/{darwin,libffi}*
    rm -r Modules/_decimal/libmpdec
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
                --with-system-expat \
                --with-system-ffi \
                --with-system-libmpdec \
                --with-threads \
                --with-pydebug \
                --without-ensurepip


    # Obtain next free server number for xvfb-run; this even works in a chroot environment.
    #export servernum=99
    #while ! xvfb-run -a -n "$servernum" /bin/true 2>/dev/null; do servernum=$((servernum+1)); done

    LC_CTYPE=en_US.UTF-8 make EXTRA_CFLAGS="$CFLAGS" -j4
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
