# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: N. I. - izmntuk

pkgname=dar
pkgver=2.7.17
pkgrel=1
pkgdesc='A full featured command-line backup tool, short for Disk ARchive'
arch=('i686' 'x86_64')
url='http://dar.linux.free.fr/'
license=('GPL')
depends=('libgcrypt' 'zlib' 'lzo' 'bzip2' 'xz' 'attr' 'argon2' 'libthreadar')
optdepends=('perl: for running some samples'
            'librsync: for delta binary')
makedepends=('doxygen')
source=("http://downloads.sourceforge.net/project/dar/dar/${pkgver}/dar-${pkgver}.tar.gz")
sha512sums=('99501e31e1c438ef4406e6bccc190b39b4313e2074adfb02e3f205d225f2292a58aded631e5df3320a11f6313106cf8128f522f3975d8a53eb1a5a6971d946ff')
backup=('etc/darrc')
options=('!libtool')

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
