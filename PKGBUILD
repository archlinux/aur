# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.4.0
pkgrel=3
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'python2' 'icu')
provides=('nodejs' 'npm')
conflicts=('nodejs' 'npm')

build() {
    # Matching the arch format with Node's
    case $CARCH in
        "i686")     suffix="x86"
                    ;;
        "x86_64")   suffix="x64"
                    ;;
        "armv6h")   suffix="armv6l"
                    ;;
        "armv7h")   suffix="armv7l"
                    ;;
        "aarch64")  suffix="arm64"
                    ;;
        *)          echo "No supported architecture found"
                    exit 1
                    ;;
    esac

    msg "Downloading from https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-$suffix.tar.xz"

    # Downloading the right archive
    curl https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-$suffix.tar.xz > node.tar.xz

    tar -xf node.tar.xz
    mv node-v$pkgver-linux-$suffix node
    cd node

    msg 'Fixing for python2 name'
    find lib/ include/ -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;
}

package() {
    cd node
    install -d $pkgdir/usr/share/licenses/nodejs-lts-bin
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
    cp LICENSE $pkgdir/usr/share/licenses/nodejs-lts-bin
}

