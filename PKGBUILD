# Maintainer: William Gathoye <william + aur at gathoye dot be>
# Contributor: Sven Schwedas <sven dot schwedas at tao dot at>
# Contributor: Levente Polyak <anthraxx at archlinux dot org>

pkgname=dh-strip-nondeterminism
_gitcommit=0f98d4ba83c2e78cda2bf4b5f4d0ec40cc07538e
pkgver=0.042
pkgrel=2
pkgdesc='Tool for stripping bits of non-deterministic information from files, supports dh'
url='https://salsa.debian.org/reproducible-builds/strip-nondeterminism'
arch=('any')
license=('GPL3')
depends=("perl" 'perl-archive-zip' 'perl-archive-cpio')
makedepends=('git')
conflicts=('strip-nondeterminism')
provides=('strip-nondeterminism')
options=('!emptydirs')
source=(${pkgname}::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git#commit=${_gitcommit}")
sha512sums=('SKIP')
validpgpkeys=(
    'C2FE4BD271C139B86C533E461E953E27D4311E58' # Chris Lamb <lamby at debian dot org>
    'EF5D84C1838F2EB6D8968C0410378EFC2080080C' # Andrew Ayer <agwa at andrewayer dot name>
    '2F5DAF3FC1F793D94F3D900CA721DA055374AA4F' # Reiner Herrmann <reiner at reiner-h dot de>
    '66AE2B4AFCCF3F52DA184D184B043FCDB9444540' # Mattia Rizzolo <mattia at debian dot org>
)

pkgver() {
    cd ${pkgname}
    git describe --always | sed 's/^v//;s/-/./g'
}

build() {
    cd ${pkgname}
    PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
    make
}

check() {
    make -C ${pkgname} test
}

package() {
    cd ${pkgname}
    make DESTDIR="${pkgdir}" install
    install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
    rm "${pkgdir}/usr/bin/vendor_perl/strip-nondeterminism"
    mv "${pkgdir}/usr/bin/vendor_perl/dh_strip_nondeterminism" "${pkgdir}/usr/bin/"
    rm -r "${pkgdir}/usr/bin/vendor_perl"
}
