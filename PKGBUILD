# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="mpm"
pkgname="matlab-${_name}"
_commit="77fec96ac0eced0a65083eefe93482f11b4d12d7"
pkgver=2026.6+r156.g77fec96
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
sha256sums=('073d5f0163679bac1de0326f26bc1b890e8610f53d3511ac7c4ff6bc8f9a530b')
sha256sums_x86_64=('e8442d253046d154c4dcc5ead7338369a28fcaf4ee8f171992fc4eb63c65ca4d')

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
