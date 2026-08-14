# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mpm"
pkgname="matlab-${_name}"
_commit="33346eb7e577e6405fd349faff6efd98ae98b1d4"
pkgver=2026.5.1+r154.g33346eb
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
sha256sums=('ce7101146ef13659dfaaf97d1c278a2c1bc3bdb40c587a906b4538546796ee91')
sha256sums_x86_64=('9e4844334d044468dc1f54ea8a0f7085d04086d3c2e58ba535d2c5dc5a5e78a4')

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
