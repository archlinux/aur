# Maintainer: afontenot <adam.m.fontenot@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: N30N <archlinux@alunamation.com>

pkgname="mozjpeg"
pkgver=4.1.1
pkgrel=2
pkgdesc="JPEG image codec with accelerated baseline decoding and superior encoding"
url="https://github.com/mozilla/mozjpeg"
license=("BSD")
arch=("i686" "x86_64" "armv7h")
depends=("glibc" "libpng")
makedepends=("nasm" "cmake")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha1sums=('2e061f93021f290c171816c4decd5a032fdfc2c8')

provides=("libjpeg" "libjpeg.so=8-64" "turbojpeg" "libjpeg-turbo")
conflicts=("libjpeg" "mozjpeg-git" "turbojpeg" "libjpeg-turbo")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib -DENABLE_STATIC=FALSE -DPNG_SUPPORTED=TRUE -DWITH_JPEG8=TRUE .
    make
}

# There are a lot of tests: if you don't want to run them, you or
# your AUR helper should use `makepkg --nocheck`.
check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make \
        DESTDIR="${pkgdir}" \
        docdir="/usr/share/doc/${pkgname}" \
        exampledir="/usr/share/doc/${pkgname}" \
        install

    install -D LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m644 jpegint.h "${pkgdir}/usr/include"
}
