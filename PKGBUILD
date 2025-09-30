# Maintainer: Bernhard Walle <bernhard.walle@posteo.eu>

_pkgname=equivs
pkgname=${_pkgname}-git
pkgver=20250420.959389e
pkgrel=1
arch=('any')
pkgdesc='Circumvent Debian package dependencies'
url='https://salsa.debian.org/perl-team/modules/packages/equivs.git'
license=('GPL-2.0-only')
depends=('perl' 'make' 'bash')
makedepends=('git')
source=("${pkgname}::git+https://salsa.debian.org/perl-team/modules/packages/equivs.git"
    "equivs-build-no-deps.patch")
sha1sums=('SKIP'
          '4ef9f9a06a8389164ac98d38e2cc48daf790eda6')

provides=("${pkgname}")
conflicts=("${pkgname}" "${_pkgname}")

pkgver() {
	cd "${srcdir}/${pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${pkgname}"
	make

    patch -p1 -i "${srcdir}/equivs-build-no-deps.patch"
}

package() {
	cd "${srcdir}/${pkgname}"
	gzip -f *.1

    for n in equivs-control equivs-build ; do
        install -Dm755 usr/bin/$n "${pkgdir}/usr/bin/$n"
        install -Dm644 $n.1.gz "${pkgdir}/usr/share/man/man1/$n.1"
    done

    install -dm755 "${pkgdir}/usr/share/equivs"
    cp -r usr/share/equivs/* "${pkgdir}/usr/share/equivs"
    install -dm755 "${pkgdir}/usr/share/doc/equivs/examples"
    cp -r examples/* "${pkgdir}/usr/share/doc/equivs/examples"

    install -m644 debian/changelog "${pkgdir}/usr/share/doc/equivs"
    install -m644 debian/README.Debian "${pkgdir}/usr/share/doc/equivs"
}

