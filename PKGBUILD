# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

# https://www.mathworks.com/help/install/ug/get-mpm-os-command-line.html

_name="mpm"
pkgname="matlab-${_name}"
_commit="eee682f0ce437f76c4a9fef23e9873fecd8ed8e6"
pkgver=2026.3+r142.geee682f
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
  'ca-certificates'
  'glibc'
  'unzip'
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
sha256sums=('363d78a8f8b253bee1e294483d9c5a9701e8b3e65e55fc475a64f0c5ccbec700')
sha256sums_x86_64=('96c09adb14f4997506ba735cb363ec134e08b4e3b26f195086636e29afeab3a3')

prepare() {
  # comment out after updating _commit
  if [[ "${pkgver}" == "${_pkgver}+r0.updateme" ]]; then
    echo " -> ERROR: Maitainer, please update the git commit hash!"
    exit 1
  fi
}

pkgver() {
  cd "${srcdir}/${_pkgsrc}"
  printf '%s+r%s.g%s' "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"

  cd "${_pkgsrc}"
  install -vDm644 "MPM.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  ln -vsf "${pkgname}" "${pkgdir}/usr/bin/${_name}"
}
