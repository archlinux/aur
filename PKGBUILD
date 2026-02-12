# Maintainer: Jerry Xiao <aur AT mail.jerryxiao.cc>

_srcname=shadowsocks-libev
pkgname=${_srcname}-static
pkgver=3.3.6
pkgrel=1
pkgdesc="Statically-compiled shadowsocks-libev, intended to replace community/shadowsocks-libev"
arch=('x86_64')
url='https://github.com/shadowsocks/shadowsocks-libev'
license=('GPL3')
# libcap: for .install only
depends=('libcap')
makedepends=('git' 'musl' 'kernel-headers-musl' 'asciidoc' 'xmlto' 'cmake')
provides=("$_srcname")
conflicts=("$_srcname")
options=('!lto')
install=${_srcname}.install

source=("${_srcname}::git+https://github.com/shadowsocks/${_srcname}.git#tag=v$pkgver"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service')

_mbedtls_ver=3.6.5
_libsodium_ver=1.0.21
_libev_ver=4.33
_cares_ver=1.34.6
_pcre2_ver=10.47

source+=("https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-${_mbedtls_ver}/mbedtls-${_mbedtls_ver}.tar.bz2")
source+=("https://download.libsodium.org/libsodium/releases/libsodium-${_libsodium_ver}.tar.gz")
source+=("http://dist.schmorp.de/libev/libev-${_libev_ver}.tar.gz")
source+=("https://github.com/c-ares/c-ares/releases/download/v${_cares_ver}/c-ares-${_cares_ver}.tar.gz")
source+=("https://github.com/PCRE2Project/pcre2/releases/download/pcre2-${_pcre2_ver}/pcre2-${_pcre2_ver}.tar.bz2")
source+=("0001-shadowsocks-libev-fix-horrible-cmake.patch")

sha256sums=('e889d5851e8febd385a7654af1f23b1292be8d012cef7eddd7e91209a20797d1'
            'c5148bfb453467258917012a029fb7e935c72e4066e06447357941c68f7282fb'
            '8fb077d92af2626cff904128ba410170baacf02cb92a6d58ec860be659ecde0b'
            'c51e9c0838b85d66467164c4ecff20e4180aa57a3c56ce9eae41353c4f5bfd78'
            '9dc81d58dde8a94f25a7475c626af7cb5507c795fcf3abc5b6367576e725d9a0'
            '4a11f1777bb95bf4ad96721cac945a26e04bf19f57d905f241fe77ebeddf46d8'
            '9e4285c7a419e82dedb0be63a72eea357d6943bc3e28e6735bf600dd4883feaf'
            '507eb7b8d1015fbec5b935f34ebed15bf346bed04a11ab82b8eee848c4205aea'
            '912dd7cc3b3e8a79c52fd7fb9c0f4ecf0aaa73e45efda880266a2d6e26b84ef5'
            '47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7'
            '80527e1db8909b75eb4143c37172912e2f2b1e96457ea050ae977ea94f3723d6')

export CC=musl-gcc
export CXX=true

prepare() {
    cd "$srcdir/${_srcname}"
    git submodule update --init --recursive
    patch -p1 -i "$srcdir/0001-shadowsocks-libev-fix-horrible-cmake.patch"
}

build() {
    export PKG_CONFIG_PATH="${srcdir}"/temp/usr/lib/pkgconfig
    export PATH="${srcdir}/temp/usr/bin:${PATH}"

    # mbedtls
    cd "${srcdir}/mbedtls-${_mbedtls_ver}"
    cmake -B build -DCMAKE_SYSTEM_PREFIX_PATH="${srcdir}/temp/usr" -DCMAKE_INSTALL_PREFIX="${srcdir}/temp/usr" -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTING=false -S .
    cmake --build build --target install

    # libsodium
    cd "${srcdir}/libsodium-${_libsodium_ver}" || cd "${srcdir}/libsodium-stable"
    LDFLAGS="$LDFLAGS -static" ./configure --prefix="${srcdir}/temp/usr" --disable-shared
    make install

    # libev
    cd "${srcdir}/libev-${_libev_ver}"
    LDFLAGS="$LDFLAGS -static" ./configure --prefix="${srcdir}/temp/usr" --disable-shared
    make install

    # c-ares
    cd "${srcdir}"/c-ares-${_cares_ver}
    cmake -B build -DCMAKE_SYSTEM_PREFIX_PATH="${srcdir}/temp/usr" -DCMAKE_INSTALL_PREFIX="${srcdir}/temp/usr" -DCMAKE_BUILD_TYPE=Release -DCARES_STATIC=true -DCARES_SHARED=false -S .
    cmake --build build --target install

    # pcre2
    cd "${srcdir}/pcre2-${_pcre2_ver}"
    LDFLAGS="$LDFLAGS -static" ./configure --prefix="${srcdir}/temp/usr" --disable-shared \
        --enable-pcre2-16 \
        --enable-pcre2-32 \
        --enable-jit
    make install

    # shadowsocks-libev
    cd "$srcdir/${_srcname}"
    LDFLAGS="$LDFLAGS -static" cmake -B build -DCMAKE_SYSTEM_PREFIX_PATH="${srcdir}/temp/usr" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=false -DWITH_STATIC=true -S . \
        -DMBEDTLS_INCLUDE_DIR="${srcdir}/temp/usr/include" -DMBEDTLS_CRYPTO_LIBRARY="${srcdir}/temp/usr/lib/libmbedcrypto.a" -DMBEDTLS_TLS_LIBRARY="${srcdir}/temp/usr/lib/libmbedtls.a" \
        -DCARES_INCLUDE_DIR="${srcdir}/temp/usr/include" -DCARES_LIBRARY="${srcdir}/temp/usr/lib/libcares.a" \
        -DSODIUM_INCLUDE_DIR="${srcdir}/temp/usr/include" -DSODIUM_LIBRARY="${srcdir}/temp/usr/lib/libsodium.a"
    cmake --build build
}

package() {
  cd "$srcdir/${_srcname}"
  DESTDIR="$pkgdir/" cmake --build build --target install
  install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
  install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
}
