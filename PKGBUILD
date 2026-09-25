# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['powerpc64le']='ppc64le'
  ['riscv64']='riscv64'
  ['x86_64']='x86_64'
)

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.32.0
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/torognes/${_pkgname}"
license=(
  'BSD-2-Clause OR GPL-3.0-only'
)
depends=(
  'glibc'
  # 'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${_arch[${_carch}]}.tar.gz'
)"
done
sha256sums_aarch64=('43296e39f29aa7fcd5e3aadcc1a3f0dee910840d8d0d84cf07a78c61b4a75a11')
sha256sums_riscv64=('0594d7bc3b069b42088f959312ec9df9016baf32439841470f70b7a70926be8d')
sha256sums_x86_64=('c9d7ad4e10e942286ad84004a913e0f2f82957f6156c97a7d6d2389750dd6e41')
sha256sums_powerpc64le=('c2e0be3be59961e404b4f3f7d064baec6d02e5d6c7ef29b8ad032393c38bac4a')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_arch[${CARCH}]}"
  install -vd "${pkgdir}/usr/share"
  cp -va --no-preserve=ownership "bin" -t "${pkgdir}/usr" 
  cp -va --no-preserve=ownership "man" -t "${pkgdir}/usr/share" 

  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.txt" "LICENSE_GNU_GPL3.txt" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
