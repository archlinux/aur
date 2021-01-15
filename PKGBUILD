# Maintainer: Francesco Zardi <frazar0 <at> hotmail (dot) com>
# OLD-Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=lib32-sqlite2
pkgver=2.8.17
pkgrel=2
pkgdesc="A C library that implements an SQL database engine"
arch=('x86_64')
url="http://www.sqlite.org/"
depends=('readline>=6.0.00')
license=('custom')
provides=("sqlite2=$pkgver")
replaces=("sqlite2")
source=("https://www.sqlite.org/sqlite-$pkgver.tar.gz"
        'LICENSE'
        'fix-libtool-directiories.patch')
sha256sums=('3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37'
            'f5c6d91e17fd798af2ab9106a067ac80331eb96a182859630d211e94f9164d10'
            'bcf3b6ab24788ff51786f4fc098dcf88100065495bf3a19bcd0c5b7c51866381')

build() {
    cd "${srcdir}/sqlite-${pkgver}" || exit 1

    # Modify environment to generate 32-bit ELF, without replacing the flags
    # defined in makepkg.conf
    export CFLAGS="-m32 ${CFLAGS}"
    export CXXFLAGS="-m32 ${CXXFLAGS}"
    export LDFLAGS="-m32 ${LDFLAGS}"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    patch -p0 -i ../fix-libtool-directiories.patch

    ./configure \
        --prefix=/usr \
        --includedir=/usr/include \
        --libdir=/usr/lib32 \
        --disable-tcl \
        --disable-static \
        --disable-debug

    make
}

package() {
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd "${srcdir}/sqlite-${pkgver}" || exit 1

    make DESTDIR=${pkgdir} install

    # install custom license
    install -Dm644 "${srcdir}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
