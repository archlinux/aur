# Maintainer: Atte Lautanala <atte dot lautanala at gmail dot com>
# Based on python and python35 PKGBUILD files

pkgname=python37
pkgver=3.7.0b5
pkgrel=1
_pybasever=3.7
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="https://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib' 'libnsl')
makedepends=('tk' 'sqlite' 'valgrind' 'bluez-libs' 'mpdecimal' 'llvm' 'gdb' 'xorg-server-xvfb')
optdepends=('tk: for tkinter' 'sqlite' 'mpdecimal: for decimal' 'xz: for lzma')
options=('!makeflags')
source=("https://www.python.org/ftp/python/${pkgver%b*}/Python-${pkgver}.tar.xz"
        dont-make-libpython-readonly.patch)
sha512sums=('1623df6a250982b070788f47a5a6cc6c2fd6d8e6396cf6926b771abc35e4291bd4532f03e070f8010f17075d5bdb748ce8056ef9e1a2c54e518d58b75481b692'
            '500ea7f603f96f721d04ca64390f4bd9ddbab2c16b837b67f8a51ed9167a1d57c5b435be1ebe98b0c74eff728714033b3dcbb5ee978b9bf98086571399717f17')

prepare() {
    cd "${srcdir}/Python-${pkgver}"

    # FS#45809
    patch -p1 -i ../dont-make-libpython-readonly.patch

    # FS#23997
    sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

    rm -r Modules/expat
    rm -r Modules/_ctypes/{darwin,libffi}*
    rm -r Modules/_decimal/libmpdec
}

build() {
    cd "${srcdir}/Python-${pkgver}"

    ./configure --prefix=/usr \
                --enable-shared \
                --with-threads \
                --with-computed-gotos \
                --enable-optimizations \
                --with-lto \
                --enable-ipv6 \
                --with-valgrind \
                --with-system-expat \
                --with-dbmliborder=gdbm:ndbm \
                --with-system-ffi \
                --with-system-libmpdec \
                --enable-loadable-sqlite-extensions

    LC_CTYPE=en_US.UTF-8 xvfb-run make EXTRA_CFLAGS="$CFLAGS"
}

package() {
    cd "${srcdir}/Python-${pkgver}"

    make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" altinstall maninstall

    # Remove files that conflict with python package
    rm "${pkgdir}/usr/lib/libpython3.so"
    rm "${pkgdir}/usr/share/man/man1/python3.1"

    # Add useful scripts FS#46146
    install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
    install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
    install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

    # License
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
