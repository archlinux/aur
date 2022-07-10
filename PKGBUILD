## Maintainer: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie
pkgname=lsyncd
pkgver=2.3.0
pkgrel=1
pkgdesc="Live Syncing (Mirror) Daemon"
arch=('i686' 'x86_64')
url="https://github.com/axkibe/lsyncd"
license=('GPL2')
depends=('lua' 'rsync')
makedepends=('asciidoc' 'lua' 'cmake')
source=("https://github.com/axkibe/lsyncd/archive/release-$pkgver.tar.gz"
        "lsyncd.service"
        "0001-cmake-remove-fixed-setting-of-LUA_COMPILER-to-luac5..patch"
        "0002-lsyncd.h-define-_BSD_SOURCE-1-define-LUA_COMPAT_5_3.patch"
        )

sha256sums=('08a1bcab041fa5d4c777ae272c72ad9917442b6e654b14ffd1a82ba0cd45e4ef'
            '538072a4505abbdf8c4d16c9200810d4a2253f892a71fc16b5cd7f35ebe1ae57'
            'e5e6731559c7a290323f5b4e1d74c7ebbfaae700509a760ed43080f7eda31c71'
            '2b383276d158337d2e81ea188e767888ffdc78c20e3fc6932621481075015524')

prepare() {
    cd "${pkgname}-release-${pkgver}"
    for patch in "$srcdir/"*.patch
    do
        patch -p1 -i "$patch"
    done
    cmake -DCMAKE_INSTALL_PREFIX=/usr -S . -B build

}

build() {
    cd ${srcdir}/${pkgname}-release-${pkgver}
    cd build
    make
}

package() {
    cd "${srcdir}/${pkgname}-release-${pkgver}/build"
    make DESTDIR="${pkgdir}" install
    # fix the path of the man page. Urgh.
    install -D "${pkgdir}/man1/lsyncd.1" "${pkgdir}/usr/share/man/man1/lsyncd.1"
    rm -rf "${pkgdir}/man1"
    install -m 644 -D "${srcdir}/lsyncd.service" "${pkgdir}/usr/lib/systemd/system/lsyncd.service"
}
