# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsl-palm
pkgver=alpha119
pkgrel=1
pkgdesc="PALM is a set of GNU Octave/MATLAB scripts to perform Permutation Analysis for Linear Models"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/PALM"
license=('GPL')
depends=('octave')
optdepends=('octave-image: needed for spatial statistics (you will most likely want this)'
            'fsl: support for additional image formats, e.g. compressed NIfTI files'
            'freesurfer-bin: support to read/write FreeSurfer files directly')
source=("https://s3-us-west-2.amazonaws.com/andersonwinkler/palm/${pkgname##fsl-}-${pkgver}.tar.gz"
        "001-adjust_path_for_systemwide_install.patch"
        "002-add_stdint.patch")
sha256sums=('2ed5e45e0cf902388e53b4652718a4d9a3545276d5dafc01420a74608be6924b'
            '5722799901bc23ca1f391418d6e9d20e92ecce89612cd6e0185cffd51d06bff2'
            'b327cb047f09c415af817f44a7d324ca9767ad280c9afce7145dafb06bb64a7a')

prepare() {
  cd "${srcdir}"/${pkgname##fsl-}-${pkgver}
  patch -Np1 -i "${srcdir}"/001-adjust_path_for_systemwide_install.patch
  patch -Np1 -i "${srcdir}"/002-add_stdint.patch
}

build() {
  # We need to rebuild .mex files due to newer Octave version on Arch
  cd "${srcdir}"
  for sourcefile in $(find . -type f -name '*.c'); do
	  outfile=${sourcefile//.c/.mex}
	  /usr/bin/mkoctfile -v --mex "${sourcefile}" -o "${outfile}"
  done
}

package() {
  mkdir -p "${pkgdir}"/usr/lib
  mkdir "${pkgdir}"/usr/bin
  mv "${srcdir}"/${pkgname##fsl-}-${pkgver}/palm "${pkgdir}"/usr/bin/palm
  cp --recursive --preserve=mode "${srcdir}"/${pkgname##fsl-}-${pkgver} "${pkgdir}"/usr/lib/palm
}
