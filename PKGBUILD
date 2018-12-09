# Maintainer: Uko Koknevics <perkontevs AT gmail DOT com>

pkgname=original-awk
# Split like this because of Debian source package naming, which I guess is
# influenced by something like their pkgrel
_pkgver=2012_12_20
pkgver=2012_12_20_6
pkgrel=1
pkgdesc="The original awk described in 'The AWK Programming Language'"
arch=("x86_64")
url="https://packages.debian.org/stretch/original-awk"
license=('custom')
source=(
    "http://deb.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${_pkgver//_/-}.orig.tar.gz"
    "http://deb.debian.org/debian/pool/main/o/${pkgname}/${pkgname}_${pkgver//_/-}.debian.tar.xz"
    "archlinux-makefile.patch"
)
depends=(glibc)
makedepends=()
sha256sums=(
    "8dc092165c5a4e1449f964286483d06d0dbfba4b0bd003cb5dab30de8f6d9b83"
    "e51ed5f2357f5bf74c46784893c57105e28e63f2aed41b36b2a87dc5691b9b43"
    "f5ae27bd179276093f31a0f24b57fffa0f2f9f8f4699b7ca86c1eb61f9f06506"
)

prepare() {
    cd "${srcdir}"
    patch -p1 < debian/patches/01-awk-is-called-original-awk-here.patch
    patch -p1 < debian/patches/02-remove-generated-files-in-clean-target.patch
    patch -p1 < debian/patches/03-cflags-and-cppflags-together.patch

    patch -p1 < archlinux-makefile.patch
}

build() {
    cd "${srcdir}"
    make a.out
}

package() {
    cd "${srcdir}"
    cat debian/original-awk.dirs | sed "s|^|${pkgdir}/|" | xargs install -dm755

    cat debian/original-awk.docs | xargs install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}"

    sed -n '/Copyright/,/^THIS SOFTWARE./p' README > LICENSE
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm755 a.out "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 awk.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

