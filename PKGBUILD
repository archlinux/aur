# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.6.0
_build=py39h91f5cce_0
_build_number=0
_libgfortran=libgfortran4-7.5.0-hae1eefd_17
pkgver="${_pkgver}.${_build_number}.${_build//_/.}"
pkgrel=4
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
sha256sums=('9dafd36188e52a1e5c93aa03fe18713f5c79220d42f394090ee7d5e2b29ad61a'
            '5a41efa62fbbcb21881693ab70ae979281d7e4c054c82d025d21678a10f46355')

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
