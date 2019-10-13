# Maintainer: m8D2 <omui (at) proton mail (dot) com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: jiangxq <jiangxueqian at gmail dot com>
# Contributor: zh99998 <zh99998@gmail.com>
# Contributor: 4679kun <admin at 4679 dot us>


pkgname=shadowsocks-libev-git
pkgver=3.3.2.r1.g29936626
pkgrel=1
pkgdesc='A lightweight secured socks5 proxy for embedded devices and low end boxes'
arch=(x86_64)
url='https://github.com/shadowsocks/shadowsocks-libev'
license=(GPL3)
depends=(c-ares libbloom libcap libcorkipset libev libsodium mbedtls pcre)
makedepends=(asciidoc git xmlto)
provides=(shadowsocks-libev)
conflicts=(shadowsocks-libev)
install=${pkgname}.install
source=("$pkgname::git+https://github.com/shadowsocks/shadowsocks-libev.git"
        'shadowsocks-libev@.service'
        'shadowsocks-libev-server@.service'
        'shadowsocks-libev-redir@.service'
        'shadowsocks-libev-tunnel@.service')
sha512sums=('SKIP'
            '7b52bbed0aa06935e80fc0c143acc6cefecab796cf3f76843fc3848e71128d8d544d55445330b74abe1782443630f0aa3c051f8583e213320939c719f9923dec'
            'cffaa8ebc20dc7e632d0501158b3efa3567add02602960ae9a401b64fecc815d4caf9223d79adc69ef4ddd77bff140b94a1fa0de13f85b5054477d7c8d868207'
            'f2782245478951b35676370c53d6e6d03021bca4327950087f0906ea4ab6606432df9e3dc8036f482f44da186d70b01b575542722c797b3adc14658fda276ea4'
            '42043ac083e9425ce48ba02e6e7cbedd8f4c81c9e9f79b375937635362a461dd09ddba76c520eacbecdc1993e9b1bd203e55d3b331db9b22d98b5ba4196f8886')

pkgver() {
    cd "$pkgname"

    # cutting off 'v' prefix that presents in the git tag
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir"/$pkgname

    sed -i 's|AC_CONFIG_FILES(\[libbloom/Makefile libcork/Makefile libipset/Makefile\])||' configure.ac
}

build() {
    cd "$srcdir"/$pkgname

    ./autogen.sh
    ./configure --prefix=/usr --enable-shared --enable-system-shared-lib
    make
}

package() {
    cd "$srcdir"/$pkgname

    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/shadowsocks-libev@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev@.service"
    install -Dm644 "$srcdir/shadowsocks-libev-server@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-server@.service"
    install -Dm644 "$srcdir/shadowsocks-libev-redir@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-redir@.service"
    install -Dm644 "$srcdir/shadowsocks-libev-tunnel@.service" "$pkgdir/usr/lib/systemd/system/shadowsocks-libev-tunnel@.service"
}
