# Maintainer  : Chris Billington <chrisjbillington@gmail.com>
pkgname=python-scipy-mkl-bin
_pkgname=scipy
_pkgver=1.7.3
_build=py310h1794996_2
_libgfortran=libgfortran4-7.5.0-ha8ba4b0_17
pkgver="${_pkgver}.anaconda${_build##*_}"
pkgrel=2
pkgdesc="SciPy is open-source software for mathematics, science, and engineering - with Intel MKL - prebuilt binaries from Anaconda"
arch=('x86_64')
url="http://www.scipy.org/"
license=('custom')
provides=('python-scipy' 'python-scipy-mkl')
conflicts=('python-scipy')
depends=('python-numpy' 'python-mkl-service')
makedepends=('jq')
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
noextract=("${_libgfortran}.tar.bz2")
sha256sums=('da4da92ccb70f7a259771d419ec4dfd440b22033e965ba84cb03ab3398572e2b'
            'e9b16e87276a8e1707c1d858ef0318eef0ce2222b1fc16529bf8a1d40de06aeb')

prepare() {
  # Extract gfortran, this is done separately to a specified directory since both
  # archives contain an info/paths.json:
  tar -xf "${_libgfortran}.tar.bz2" --one-top-level
  # Scipy prefix replacement
  for row in $(jq -c '.paths[] | select(has("prefix_placeholder"))' "info/paths.json"); do
    path=$(echo $row | jq -r '._path')
    prefix=$(echo $row | jq -r '.prefix_placeholder')
    sed -i "s:${prefix}:/usr:g" "${path}"
  done
  # gfortran prefix replacement
  for row in $(jq -c '.paths[] | select(has("prefix_placeholder"))' "${_libgfortran}/info/paths.json"); do
    path=$(echo $row | jq -r '._path')
    prefix=$(echo $row | jq -r '.prefix_placeholder')
    sed -i "s:${prefix}:/usr:g" "${path}"
  done
}

package() {
    mkdir -p "${pkgdir}/usr/"
    cp -drp --no-preserve=ownership "${srcdir}/lib" "${pkgdir}/usr/"
    install -D -m 644 "${srcdir}/info/licenses/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    if [ ! "$USE_GCC7LIBS" ]; then
        # Install Anaconda's gfortran
        cp -drp --no-preserve=ownership "${srcdir}/${_libgfortran}/lib" "${pkgdir}/usr/"
        # Do not install as default libgfortran - delete link to libgfortran.so.4:
        rm "${pkgdir}/usr/lib/libgfortran.so"
        # libgfortran license
        GFORTRAN_LICENSE="/share/licenses/libgfortran/RUNTIME.LIBRARY.EXCEPTION"
        install -D -m 644 "${srcdir}/${_libgfortran}/${GFORTRAN_LICENSE}" "${pkgdir}/usr/${GFORTRAN_LICENSE}"
    fi
    
}
