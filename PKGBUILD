# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.7.1
_build=py39h292c36d_2
_libgfortran=libgfortran4-7.5.0-ha8ba4b0_17
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=1
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
sha256sums=('ed5230359214b0645ab0debfded24e85be1ca01bd5da62a1a75c978da1c2173b'
            'e9b16e87276a8e1707c1d858ef0318eef0ce2222b1fc16529bf8a1d40de06aeb')

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
