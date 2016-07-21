# Maintainer: Lukas Böger <dev___AT___lboeger___DOT___de>

pkgbase=dune-core
pkgname=('dune-common' 'dune-geometry' 'dune-localfunctions' 'dune-grid' 'dune-istl')

pkgver=2.4.1
pkgrel=1

pkgdesc='Core modules of the DUNE framework'
groups=('dune')
url='http://www.dune-project.org'

arch=('i686' 'x86_64')
license=('custom')

makedepends=('cmake')

for _module in "${pkgname[@]}"; do
    source+=("http://www.dune-project.org/download/${pkgver}/${_module}-${pkgver}.tar.gz")
done

md5sums=(
    '4dd80f7b1a4fc9c447f83625961ea64b'
    'd8fba0d67a22f7d17642adf9e2820b2c'
    'f71510efa886369f21868f3f49451026'
    '4281815782bc01f532c11f678f81cb78'
    '601a7111369c6f0f269022f12ab5eb89'
)

_dunecontrol="./dune-common-${pkgver}/bin/dunecontrol --use-cmake"

package() {
    $_dunecontrol --only=${pkgname} make install DESTDIR="${pkgdir}"

    install -m644 -D ${pkgname}-${pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find "${pkgdir}" -type d -empty -delete
}

build() {
    CMAKE_FLAGS='-DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib' \
        $_dunecontrol configure

    $_dunecontrol make
}

package_dune-common() {
    pkgdesc='Basic classes used by all DUNE modules'
    depends=('bash' 'python')

    package
}

package_dune-geometry() {
    pkgdesc='Reference elements with corresponding mappings and quadratures'

    package
}

package_dune-localfunctions() {
    pkgdesc='Shape functions, interpolation operators on DUNE reference elemements'
    arch=('any')

    package
}

package_dune-grid() {
    pkgdesc='Nonconforming, hierarchically nested, multi-element-type, parallel grids'
    optdepends=(
        'blas: linear algebra implementation'
        'lapack: more linear algebra implementation'
        'ug=3.11.0: for unstructured mesh handling'
        'alberta=3.0.1: for the alberta grid implementation' 
        'psurface: piecewise linear bijections between triangulated surfaces'
    )

    package
}

package_dune-istl() {
    pkgdesc='Iterative solver template library'
    arch=('any')

    package
}
