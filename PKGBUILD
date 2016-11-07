# Maintainer: Asyrique Thevendran <asyrique@gmail.com>

pkgname=nodejs-lts-boron-bin
pkgver=6.9.1
pkgrel=1
pkgdesc='Evented I/O for V8 javascript'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://nodejs.org/'
license=('MIT')
depends=('openssl' 'zlib' 'python2' 'icu')
optdepends=('npm: nodejs package manager')
provides=('nodejs')
conflicts=('nodejs')

source_i686=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x86.tar.xz")
source_x86_64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-x64.tar.xz")
source_armv6h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv6l.tar.xz")
source_armv7h=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-armv7l.tar.xz")
source_aarch64=("https://nodejs.org/dist/v$pkgver/node-v$pkgver-linux-arm64.tar.xz")

sha256sums_i686=("f9b2ca03016e45bc35d2441a63a73db94d3e7b92350f15577d796467b9f7efb0")
sha256sums_x86_64=("d4eb161e4715e11bbef816a6c577974271e2bddae9cf008744627676ff00036a")
sha256sums_armv6h=("57ff5c069fbfbad87d7155eb47023d6132190a4d9a77b91ba776e5935c634f4c")
sha256sums_armv7h=("9a5542ef94fb9d96f1e9ce280b869396728a17461faa52593599bfe27faf9069")
sha256sums_aarch64=("7aa69b6c8cff578d0d97d5bd4f76941b2fade5476f0408d53828666ee427dd4e")

build() {
    cd node-*

    msg 'Fixing for python2 name'
    find lib/ include/ -type f -exec sed \
        -e 's_^#!/usr/bin/env python$_&2_' \
        -e 's_^\(#!/usr/bin/python2\).[45]$_\1_' \
        -e 's_^#!/usr/bin/python$_&2_' \
        -e 's_^\( *exec \+\)python\( \+.*\)$_\1python2\2_'\
        -e 's_^\(.*\)python\( \+-c \+.*\)$_\1python2\2_'\
        -e "s_'python'_'python2'_" -i {} \;

    msg 'Removing npm from install dirs'
    rm -rf lib/node_modules/npm
    rm -rf bin/npm
}

package() {
    cd node-*
    install -d $pkgdir/usr/share/licenses/nodejs-lts-boron-bin
    cp -R bin/ include/ lib/ share/ $pkgdir/usr/
    cp LICENSE $pkgdir/usr/share/licenses/nodejs-lts-boron-bin
}
