# Maintainer: Brendan Abolivier <brendan@archlinux.info>

pkgname=nodejs-lts-bin
pkgver=4.3.1
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'python2' 'gnuplot')
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

    # Downloading the right archive
    curl https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-$suffix.tar.gz > node.tar.gz

    tar -xf node.tar.gz

    msg 'Fixing for python2 name'
    find -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;
}

package() {
    cd node-v$pkgver-linux-*
    install -d $pkgdir/usr/share/licenses/nodejs-lts-bin
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
    cp LICENSE $pkgdir/usr/share/licenses/nodejs-lts-bin
}

