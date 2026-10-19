# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mpm"
pkgname="matlab-${_name}"
_commit="e87662bce31d6242b696b6f5b559681fdaded02c"
pkgver=2026.8+r162.ge87662b
_pkgver="${pkgver%+*}"
pkgrel=1
epoch=1
pkgdesc="MATLAB Package Manager"
arch=(
  'x86_64' # glnxa64
)
url="https://www.mathworks.com/products/mpm.html"
_url="https://github.com/mathworks-ref-arch/matlab-dockerfile"
license=(
  'custom:MATLAB EULA'
)
depends=(
  'glibc'

  # https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html
  'ca-certificates'
  'unzip'

  # https://github.com/mathworks-ref-arch/container-images/commit/ea7154f8f2b3efa2bcbaded5ba151285a0281c2e
  # https://github.com/mathworks-ref-arch/matlab-dockerfile/issues/160
  'libatomic'
)
makedepends=(
  'git'
)
optdepends=(
  "${pkgname}-input: input files used with '--inputfile'"
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#commit=${_commit}"
)
source_x86_64=(
  "${pkgname}-${_pkgver}-x86_64::https://ssd.mathworks.com/supportfiles/downloads/${_name}/${_pkgver}/glnxa64/${_name}"
)
sha256sums=('3bfc2f4dc4151957607220fbff54e36973565f53ae1310c7f08d57f201378ab7')
sha256sums_x86_64=('75289bdea1736304978f8bb18c83030682c0e0c89412753f4bd67157533f584f')

prepare() {
  # comment out after updating _commit
  if [[ "${pkgver}" == "${_pkgver}+r0.updateme" ]]; then
    echo " -> ERROR: Maitainer, please update the git commit hash!"
    exit 1
  fi
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf '%s+r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "MPM.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  # https://kdeldycke.github.io/meta-package-manager/
  # ln -vsf "${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
