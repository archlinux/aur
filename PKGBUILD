# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=samurai-static
_pkgname=samurai
pkgver=1.3
pkgrel=2
pkgdesc="ninja-compatible build tool written in C"
provides=(samurai)
conflicts=(samurai)
makedepends=('musl' 'gcc' 'make' 'gzip')
arch=(aarch64 'x86_64')
url="https://github.com/michaelforney/${_pkgname}"
license=('ISC' 'Apache' 'MIT')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('44ff119a27b343ec47a797fa8701c19b9e672230bc15f3c6a6cede9641ea6332')
b2sums=('0490240a908340a12acff44e3db6ec33695f9c9cecfb9ba222410a66e627c4a6eedacc31ed4cb100bb9ff179d81dfb87985bc97980df1eb0448a4ed7a1b330b4')

build() {
    export CC=musl-gcc CFLAGS="$CFLAGS -Os"
    export LDFLAGS="$LDFLAGS -static -fno-link-libatomic"
    make -C ${_pkgname}-${pkgver} -j $(nproc) samu
}

package() {
    cd ${_pkgname}-${pkgver}
    make install PREFIX=/usr DESTDIR="${pkgdir}"
    strip "${pkgdir}"/usr/bin/samu
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
