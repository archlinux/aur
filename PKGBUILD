# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Maintainer: Yishen Miao <mys721tx@gmail.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_pkgname=openssl-1.0
pkgname=${_pkgname}-chacha20
_ver=1.0.2u
# use a pacman compatible version scheme
pkgver=${_ver/[a-z]/.${_ver//[0-9.]/}}
#pkgver=$_ver
pkgrel=1
pkgdesc='The Open Source toolkit for Secure Sockets Layer and Transport Layer Security with Chacha20 cipher'
arch=('x86_64')
url='https://www.openssl.org'
license=('custom:BSD')
depends=('perl')
optdepends=('ca-certificates')
options=('!makeflags')
backup=('etc/ssl/openssl.cnf')
conflicts=('openssl-1.0')
provides=("openssl-1.0=${pkgver}")
source=("https://www.openssl.org/source/openssl-${_ver}.tar.gz"
        "https://www.openssl.org/source/openssl-${_ver}.tar.gz.asc"
        'no-rpath.patch'
        'ssl3-test-failure.patch'
        'openssl-1.0-versioned-symbols.patch'
        'openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch')
sha256sums=('ecd0c6ffb493dd06707d38b14bb4d8c2288bb7033735606569d8f90f89669d16'
            'SKIP'
            '754d6107a306311e15a1db6a1cc031b81691c8b9865e8809ac60ca6f184c957c'
            'c54ae87c602eaa1530a336ab7c6e22e12898e1941012349c153e52553df64a13'
            '9826076af410ac72180f9efbbcc53d0a31915e8a7d659308e8a53407edfb0fcc'
            'd6f9427d5cb63c7299563c201cd8708c7166e0f8c98b57a1fee69767362bf0f7')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

prepare() {
    cd $srcdir/openssl-$_ver

    # Cloudflare patch
    # https://github.com/cloudflare/sslconfig/blob/master/patches/openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch
    patch -p1 -i $srcdir/openssl__chacha20_poly1305_draft_and_rfc_ossl102j.patch

    # remove rpath: http://bugs.archlinux.org/task/14367
    patch -p0 -i $srcdir/no-rpath.patch

    # disable a test that fails when ssl3 is disabled
    patch -p1 -i $srcdir/ssl3-test-failure.patch

    # add symbol versioning to prevent conflicts with openssl 1.1 symbols (Debian)
    patch -p1 -i "$srcdir"/openssl-1.0-versioned-symbols.patch
}

build() {
    cd "$srcdir/openssl-$_ver"

    export CC=gcc
    export CXX=g++
    if [ "${CARCH}" == 'x86_64' ]; then
        openssltarget='linux-x86_64'
        optflags='enable-ec_nistp_64_gcc_128'
    elif [ "${CARCH}" == 'i686' ]; then
        openssltarget='linux-elf'
        optflags=''
    fi

    # mark stack as non-executable: http://bugs.archlinux.org/task/12434
    ./Configure --prefix=/usr --openssldir=/etc/ssl --libdir=lib/openssl-1.0 \
        shared no-ssl3-method ${optflags} \
        "${openssltarget}" \
        "-Wa,--noexecstack ${CPPFLAGS} ${CFLAGS} ${LDFLAGS}"

    make depend
    make
}

check() {
    cd "$srcdir/openssl-$_ver"
    # the test fails due to missing write permissions in /etc/ssl
    # revert this patch for make test
    make test
}

package() {
    cd "$srcdir/openssl-$_ver"

    make INSTALL_PREFIX="$pkgdir" install_sw

    # Move some files around
    install -m755 -d "$pkgdir/usr/include/openssl-1.0"
    mv "$pkgdir/usr/include/openssl" "$pkgdir/usr/include/openssl-1.0/"
    mv "$pkgdir/usr/lib/openssl-1.0/libcrypto.so.1.0.0" "$pkgdir/usr/lib/"
    mv "$pkgdir/usr/lib/openssl-1.0/libssl.so.1.0.0" "$pkgdir/usr/lib/"
    ln -sf ../libssl.so.1.0.0 "$pkgdir/usr/lib/openssl-1.0/libssl.so"
        ln -sf ../libcrypto.so.1.0.0 "$pkgdir/usr/lib/openssl-1.0/libcrypto.so"
    mv "$pkgdir/usr/bin/openssl" "$pkgdir/usr/bin/openssl-1.0"

    # Update includedir in .pc files
    sed -e 's|/include$|/include/openssl-1.0|' -i "$pkgdir"/usr/lib/openssl-1.0/pkgconfig/*.pc

    rm -rf "$pkgdir"/{etc,usr/bin/c_rehash}

    install -D -m644 LICENSE $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
}
