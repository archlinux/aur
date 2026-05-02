# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Alexander Eisele <alexander at eiselecloud dot de>
# Contributor: Asuka Minato

_pkgname="kubectl-dba"
pkgname="${_pkgname}-bin"
pkgver=0.64.0
pkgrel=1
pkgdesc="kubectl plugin for KubeDB"
declare -Ag _arch=(
  ['aarch64']='arm64'
  ['armv7h']='arm'
  ['x86_64']='amd64'
)
arch=(
  "${!_arch[@]}"
)
url="https://kubedb.com"
_url="https://github.com/kubedb/cli"
license=(
  'custom:AppsCode-Community-1.0.0'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgname}-LICENSE.md::https://github.com/appscode/licenses/raw/1.0.0/AppsCode-Community-1.0.0.md"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${_pkgname}-${pkgver}-linux-${_arch[${_carch}]}.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-${_arch[${_carch}]}.tar.gz'
)"
done
sha256sums=('2873e3f59f1ac43406251d74c32b4839b84efabcd65b8f3b1997bc4c47061d50'
            'SKIP')
sha256sums_aarch64=('8cb7cd35f641ed0ed7904e1f8d837f075915c8768b9af4615bcca1b4f686debd')
sha256sums_x86_64=('4e42cef786e57e67a5017f73b7921fb1cfb594a130ffb9e3914c87caca98de8a')
sha256sums_armv7h=('f837c23a8673661b2c5c0a30c5400b5e2dceb05156c3ba357a34108afb7c900e')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgname}-linux-${_arch[${CARCH}]}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish powershell zsh; do
    ./"${_pkgname}-linux-${_arch[${CARCH}]}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-linux-${_arch[${CARCH}]}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgname}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/${_pkgname}-LICENSE.md"

  cd "completions"
  install -vDm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
  install -vDm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
