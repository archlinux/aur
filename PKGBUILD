# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Devaux Fabien <fdev31@gmail.com>

pkgname=kvazaar-git
pkgver=2.2.0.r0.g37a0404b
pkgrel=1
pkgdesc='An open-source HEVC encoder (git version)'
arch=('x86_64')
url='https://github.com/ultravideo/kvazaar/'
license=('BSD')
depends=('crypto++')
makedepends=('git' 'yasm')
checkdepends=('ffmpeg' 'hm')
provides=('kvazaar')
conflicts=('kvazaar')
source=('git+https://github.com/ultravideo/kvazaar.git'
        'git+https://github.com/ultravideo/greatest.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    git -C kvazaar submodule init
    git -C kvazaar config --local submodule.greatest.url "${srcdir}/greatest"
    git -C kvazaar -c protocol.file.allow='always' submodule update
    autoreconf -fi kvazaar
}

pkgver() {
    git -C kvazaar describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd kvazaar
    ./configure --prefix='/usr' --with-cryptopp
    make
}

check() {
    make -C kvazaar check
}

package() {
    make -C kvazaar DESTDIR="$pkgdir" install
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/share/doc/kvazaar"/LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}"
}
