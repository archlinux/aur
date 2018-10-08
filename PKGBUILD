# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=slatec
pkgver=4.1
pkgrel=4
pkgdesc="Common Mathematical Library"
arch=(i686 x86_64)
url=http://netlib.org/slatec
license=(PD)
depends=(lapack)
makedepends=(gcc-fortran)
source=(slatec_${pkgver}_src.tgz::http://netlib.org/slatec/slatec_src.tgz
        slatec4linux_${pkgver}.tgz::http://www.netlib.org/slatec/slatec4linux.tgz
        LICENSE)
sha256sums=('df009d9ef9c18aae06ce68711b1ae108d3533b4f174582c3cbea0915c4fdfe01'
            'eef9234f8fcb49e7f4905a11eda8f453ec2ca314029a9ce303fdbc99cff42bf3'
            'd83a2ee63ee4bbd56d59072a0778e06685fa001047f153a3f0293d30849c8046')

prepare() {
    cd "$srcdir"
    mv *.f src
    mv src/*.f .
}

build() {
    cd "$srcdir"
    make FC=${FC-gfortran} all
}

package() {
    cd "$srcdir"
    install -Dm644 static/libslatec.a "$pkgdir/usr/lib/libslatec.a"
    install -Dm755 dynamic/libslatec.so "$pkgdir/usr/lib/libslatec.so.$pkgver"
    ln -fs "libslatec.so.$pkgver" "$pkgdir/usr/lib/libslatec.so.${pkgver%%.*}"
    ln -fs "libslatec.so.${pkgver%%.*}" "$pkgdir/usr/lib/libslatec.so"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m755 -d "$pkgdir/usr/share/slatec/src"
    install -m755 -t "$pkgdir/usr/share/slatec/src" *.f
}
