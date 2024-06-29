# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: N. I. - izmntuk

pkgname=dar
pkgver=2.7.14
pkgrel=2
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('libgcrypt' 'zlib' 'lzo' 'bzip2' 'xz' 'attr' 'argon2' 'libthreadar')
optdepends=('perl: for running some samples'
            'librsync: for delta binary')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/dar/dar/${pkgver}/dar-${pkgver}.tar.gz"
        "dar-libgcrypt-fix.patch::https://github.com/Edrusb/DAR/commit/687249a4f55a222e6590dee413262e6ff2a54ec4.patch")
sha512sums=('0436c67e0dbd8f5e96e01a0db48a469d80fb81a7c7f37aed98308bd55d60d699b21c755d95fa83891690231fd2510eaa6c6652fb99a1bad9c8210084031391d4'
            '90f3a6a34fa146bd153ac9b1e96ed14ad2df95da4176aa10a9b2ac2e4d36564a5533c19d263211dc411c15b5ef063ece0e67905cc60d3b2710f7c152564d2c00')
backup=('etc/darrc')
options=('!libtool')

prepare() {
    cd "${pkgname}-${pkgver}"
    patch -Np1 -i ../dar-libgcrypt-fix.patch
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ## --enable-threadar: EXPERIMENTAL multithread support
    if [[ "${CARCH}" == i686 ]]; then
        EXTRA_OPTIONS="--enable-mode=32"
    fi
    ./configure --prefix=/usr --sysconfdir=/etc \
                    --disable-dar-static \
                    --disable-static \
                    --disable-upx \
                    --disable-build-html \
                    ${EXTRA_OPTIONS}
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" pkgdatadir="/usr/share/doc/${pkgname}/html" install
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    install -pm644 AUTHORS ChangeLog NEWS README THANKS TODO \
            "${pkgdir}/usr/share/doc/${pkgname}"
    rm -rf "${pkgdir}/usr/share/doc/dar/html/man"
}
