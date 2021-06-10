# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.6.2
_build=py39had2a1c9_1
_libgfortran=libgfortran-ng-7.5.0-ha8ba4b0_17
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=2
pkgdesc="SciPy is open-source software for mathematics, science, and engineering - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="http://www.scipy.org/"
license=('custom')
provides=('python-scipy' 'python-scipy-mkl')
conflicts=('python-scipy')
depends=('python-numpy' 'python-mkl-service')
# Note: This package by default bundles libgfortran 7 from anaconda, because compiling
# gcc7-libs takes hours. If you already have gcc7-libs or prefer to compile it yourself
# then set USE_GCC7LIBS=1 before running makepkg.
if [ "$USE_GCC7LIBS" ]; then
    echo "Using gcc7-libs instead of bundling gfortran 7"
    depends+=('gcc7-libs')
else:
    echo "Bundling precompiled libgfortran from Anaconda"
    conflicts+=('gcc7-libs')
fi
optdepends=('python-pillow: for image saving module')
source=("https://repo.anaconda.com/pkgs/main/linux-64/${_pkgname}-${_pkgver}-${_build}.tar.bz2"
        "https://repo.anaconda.com/pkgs/main/linux-64/${_libgfortran}.tar.bz2"
        )
sha256sums=('2cf06019a66fbb0a9df571bac7f0460eb66f60d6b9c37f6a64a6dcddbe2c765f'
            'baf06cda3054e2a1eb67b2dfb28fb11b6245f6c1625f369a7629dfcee622e96f')

package() {
    mkdir -p "${pkgdir}/usr/"
    if [ "$USE_GCC7LIBS" ]; then
        # Just the Python modules:
        PYTHONMINOR=$(python -c 'import sys; print(sys.version_info.minor)')
        PYTHONXY="python3.${PYTHONMINOR}"
        mkdir -p "${pkgdir}/usr/lib"
        cp -drp --no-preserve=ownership "${srcdir}/lib/${PYTHONXY}" "${pkgdir}/usr/lib"
    else
        # The whole /lib tree, including python modules and libgfortran
        cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/lib"
        # Do not install as default libgfortran - delete link to libgfortran.so.4:
        rm "${pkgdir}/usr/lib/libgfortran.so"
        # libgfortran license
        GFORTRAN_LICENSE="/share/licenses/libgfortran/RUNTIME.LIBRARY.EXCEPTION"
        install -D -m 644 "${srcdir}/${GFORTRAN_LICENSE}" "${pkgdir}/usr/${GFORTRAN_LICENSE}"
    fi
    install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Prefix replacement:
    find "${pkgdir}" -type f -exec sed -i -e s:/opt/anaconda1anaconda2anaconda3:/usr:g {} +
}
