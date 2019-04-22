# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=porto
pkgver=4.20.8
pkgrel=1
pkgdesc='Yet another Linux container management system'
arch=('i686' 'x86_64')
url='https://github.com/yandex/porto'
license=('Custom')
depends=('protobuf' 'ncurses' 'libnl' 'python')
makedepends=('cmake' 'pandoc')

source=("git+https://github.com/yandex/porto#tag=v$pkgver"
        "$pkgname.install"
        "$pkgname.patch"
        "$pkgname.service"
        "$pkgname.sysusers")
md5sums=('SKIP'
         '988b5b4ef62873befdd1b9335faed81f'
         '83756072bf833537d0116099cdd27c22'
         'a5d14ceb8b79a641dcfd671448d141ec'
         'e394a893cf3b0ae5c718c069b65bffed')
install=porto.install

prepare() {
    mkdir -p porto/build/release

    cd porto
    patch < ../porto.patch
}

build() {
    cd porto/build/release
    cmake ../.. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=$pkgdir/usr
    make -j4
}

package() {
    cd porto/build/release
    make DESTDIR=$pkgdir install
    mv $pkgdir/usr/sbin $pkgdir/usr/bin

    # Add porto group
    install -Dm644 \
        "$srcdir/$pkgname.sysusers" \
        "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

    # Install bash completion
    install -Dm644 \
        "$srcdir/porto/debian/bash-completion.portoctl" \
        "$pkgdir/usr/share/bash-completion/completions/portoctl"

    install -Dm644 \
        "$srcdir/porto/debian/bash-completion.portod" \
        "$pkgdir/usr/share/bash-completion/completions/portod"

    # Install portod as systemd service.
    install -Dm644 \
        "$srcdir/$pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}
