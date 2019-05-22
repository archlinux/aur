# Maintainer: jasch <jasch dot io at protonmail dot com>
pkgname=liquid-dsp-quiet-devel-git
pkgver=v1.2.0.r1586.g4951bbbf
pkgrel=7
pkgdesc="libliquid compatible with libquiet"
arch=('x86_64')
url="https://github.com/quiet/quiet-dsp"
license=('MIT')
depends=('fftw')
makedepends=('autoconf' 'automake' 'gcc' 'make')
optdepends=('libfec-git: forward error correction support')
provides=('liquid-dsp')
conflicts=('liquid-dsp')
options=('staticlibs')
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd quiet-dsp

    git checkout devel
}

pkgver() {
    cd quiet-dsp

    # git rev-parse --short HEAD
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd quiet-dsp
    rm -f config.cache aclocal.m4
    aclocal
    autoconf
    autoheader
    # ./bootstrap.sh
    ./configure --prefix /usr
    make
}

package() {
    cd quiet-dsp

    make DESTDIR="$pkgdir" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
