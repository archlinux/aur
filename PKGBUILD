# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dstask"
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="A terminal-based TODO manager with git-based sync + markdown notes per task"
arch=(
  'armv7h'
  'x86_64'
)
url="https://calbryant.uk/blog/dstask-a-taskwarrior-alternative"
_url="https://github.com/naggie/${_pkgname}"
license=(
  'MIT'
)
depends=(
  'git'
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
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_armv7h=(
  "${_pkgname}-${pkgver}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-arm5"
  "${_pkgname}-import-${pkgver}-armv7h::${_url}/releases/download/v${pkgver}/${_pkgname}-import-linux-arm5"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
  "${_pkgname}-import-${pkgver}-x86_64::${_url}/releases/download/v${pkgver}/${_pkgname}-import-linux-amd64"
)
sha256sums=('dfce65ce07db21b0cfe5a03cbb10896cf6c1385b341c7867c4db219fc5c4f5f4'
            'f1630544f9da6d125967a9224cee919b686a7b2b3ea37d7ecbfa8216b2837534')
sha256sums_armv7h=('d66f1ed71463fbc07224235c3d2b32abaeac72f358162539a0a08ad2946f3eec'
                   '16098faa49f55022d270cea39c3cc02ef399a46f175f184b09d2ab261dbd8939')
sha256sums_x86_64=('c9db215310657dc1a40cec9ba6588de17350dfe4a1a74823cbb45b00519751ff'
                   'afc82a02728165720ebccfb41576c7efa84f5e1edd5d3b64d71395666fd00fe5')

prepare() {
  cd "${srcdir}"
  mkdir -p "completions"
  chmod +x ./"${_pkgname}-${pkgver}-${CARCH}"
}

build() {
  cd "${srcdir}"
  for _sh in bash fish zsh; do
    ./"${_pkgname}-${pkgver}-${CARCH}" "${_sh}-completion" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}-${pkgver}-${CARCH}"        "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "${_pkgname}-import-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}-import"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -vDm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "${_pkgname}.zsh"  "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
