# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.3.2
_build=py38h7c811a0_0
_build_number=0
_libgfortran=libgfortran-ng-7.3.0-hdf63c60_0
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=0
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
sha256sums=('5a01f95b60ba3a7b6babd589d08aed300692e5d46f6434e38e94019c1cd47f46'
            '83c6fdb30a240fbaa09f5d2e2ae8f092759cb710bc3fa628ccb18934fc237b7f')

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
}
