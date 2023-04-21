# Maintainer: Jerry Xiao <aur AT mail.jerryxiao.cc>

_srcname=shadowsocks-libev
pkgname=${_srcname}-static
pkgver=3.3.5
pkgrel=1
pkgdesc="Statically-compiled shadowsocks-libev"
arch=('x86_64')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
# libcap: for .install only
depends=('libcap')
makedepends=('git' 'musl' 'kernel-headers-musl' 'asciidoc' 'xmlto')
provides=("$_srcname")
options=('!lto')
install=${_srcname}.install

source=("${_srcname}::git+https://github.com/shadowsocks/${_srcname}.git#tag=v$pkgver"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service')

_mbedtls_ver=2.28.2
_libsodium_ver=1.0.18
_libev_ver=4.33
_cares_ver=1.19.0
_pcre_ver=8.45

source+=("https://github.com/ARMmbed/mbedtls/archive/mbedtls-${_mbedtls_ver}.tar.gz")
source+=("https://download.libsodium.org/libsodium/releases/libsodium-${_libsodium_ver}.tar.gz")
source+=("http://dist.schmorp.de/libev/libev-${_libev_ver}.tar.gz")
source+=("https://github.com/c-ares/c-ares/releases/download/cares-${_cares_ver//./_}/c-ares-${_cares_ver}.tar.gz")
source+=("https://sourceforge.net/projects/pcre/files/pcre/${_pcre_ver}/pcre-${_pcre_ver}.tar.bz2")

sha256sums=('SKIP'
            'c5148bfb453467258917012a029fb7e935c72e4066e06447357941c68f7282fb'
            '8fb077d92af2626cff904128ba410170baacf02cb92a6d58ec860be659ecde0b'
            'c51e9c0838b85d66467164c4ecff20e4180aa57a3c56ce9eae41353c4f5bfd78'
            '9dc81d58dde8a94f25a7475c626af7cb5507c795fcf3abc5b6367576e725d9a0'
            '1db6d4196178fa9f8264bef5940611cd9febcd5d54ec05f52f1e8400f792b5a4'
            '6f504490b342a4f8a4c4a02fc9b866cbef8622d5df4e5452b46be121e46636c1'
            '507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea'
            'bfceba37e23fd531293829002cac0401ef49a6dc55923f7f92236585b7ad1dd3'
            '4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8')

export LDFLAGS="$LDFLAGS -static"
export CC=musl-gcc
export CXX=musl-gcc

prepare() {
    cd "$srcdir/${_srcname}"
    git submodule update --init --recursive
}

build() {
    export PKG_CONFIG_PATH="${srcdir}"/temp/usr/lib/pkgconfig
    export PATH="${srcdir}/temp/usr/bin:${PATH}"

    # mbedtls
    cd "${srcdir}/mbedtls-mbedtls-${_mbedtls_ver}"
    make DESTDIR="${srcdir}/temp/usr" install

    # libsodium
    cd "${srcdir}/libsodium-${_libsodium_ver}"
    ./configure --prefix="${srcdir}/temp/usr" --disable-shared
    make install

    # libev
    cd "${srcdir}/libev-${_libev_ver}"
    ./configure --prefix="${srcdir}/temp/usr" --disable-shared
    make install

    # c-ares
    cd "${srcdir}"/c-ares-${_cares_ver}
    ./configure --prefix="${srcdir}/temp/usr" --disable-shared
    make -C src/lib
    make install-pkgconfigDATA
    make -C src/lib install
    make -C include install

    # pcre
    cd "${srcdir}/pcre-${_pcre_ver}"
    ./configure --prefix="${srcdir}/temp/usr" --disable-shared --disable-cpp \
        --enable-unicode-properties \
        --enable-pcre16 \
        --enable-pcre32 \
        --enable-jit
    make install

    # shadowsocks-libev
    cd "$srcdir/${_srcname}"
    ./autogen.sh
    export CFLAGS="$CFLAGS -I${srcdir}/temp/usr/include" LDFLAGS="$LDFLAGS -L${srcdir}/temp/usr/lib"
    export LDFLAGS="$LDFLAGS --static" # what the fsck
    ./configure --prefix=/usr --disable-shared --disable-silent-rules
    make
}

package() {
  cd "$srcdir/${_srcname}"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
}
