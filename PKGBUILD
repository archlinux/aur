# Maintainer: Francesco Zardi <frazar0 <at> hotmail (dot) com>
# OLD-Maintainer: not_anonymous <nmlibertarian@gmail.com>
# OLD-Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=lib32-sqlite2
pkgver=2.8.17
pkgrel=5
pkgdesc="A C library that implements an SQL database engine"
arch=('x86_64')
url="http://www.sqlite.org/"
depends=('lib32-readline>=6.0.00')
license=('custom')
replaces=("sqlite2")
source=("https://www.sqlite.org/sqlite-$pkgver.tar.gz"
        'LICENSE'
        'fix-error-format-security.patch'
        'fix-libtool-directiories.patch'
        'fix-implicit-fn-decl-Makefile.in.patch'
        'fix-implicit-fn-decl-tool-lemon.c.patch')
sha256sums=('3f35ebfb67867fb5b583a03e480f900206af637efe7179b32294a6a0cf806f37'
            'f5c6d91e17fd798af2ab9106a067ac80331eb96a182859630d211e94f9164d10'
            'fd6cbcd8459e8056ea246f6415d32f2b627a2e4f83e5a82104206412da81e1f4'
            'bcf3b6ab24788ff51786f4fc098dcf88100065495bf3a19bcd0c5b7c51866381'
            '6de9da38f155d17ebe114ad8d9409a245d3ebafca2011e25e1d293a0dfff9108'
            'c508b57a9bf69e157ca3e6209545512fc38f168fe081b3728fa726c31a9e7255')

prepare() {
    cd "${srcdir}/sqlite-${pkgver}" || exit 1

    patch -p0 < ../fix-error-format-security.patch
    patch -p0 < ../fix-libtool-directiories.patch
    patch -p0 < ../fix-implicit-fn-decl-Makefile.in.patch
    patch -p0 < ../fix-implicit-fn-decl-tool-lemon.c.patch
}

build() {
    cd "${srcdir}/sqlite-${pkgver}" || exit 1

    # Modify environment to generate 32-bit ELF, without replacing the flags
    # defined in makepkg.conf
    export CFLAGS="-m32 ${CFLAGS}"
    export CXXFLAGS="-m32 ${CXXFLAGS}"
    export LDFLAGS="-m32 ${LDFLAGS}"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

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
