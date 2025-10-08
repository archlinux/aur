# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dstask"
pkgname="${_pkgname}-bin"
pkgver=0.28
pkgrel=1
pkgdesc="A terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('armv7h' 'x86_64')
url="https://calbryant.uk/blog/dstask-a-taskwarrior-alternative"
_url="https://github.com/naggie/${_pkgname}"
license=('MIT')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-linux-arm5"
               "${_pkgname}-import-${pkgver}-armv7h::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-arm5")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-linux-amd64"
               "${_pkgname}-import-${pkgver}-x86_64::${_url}/releases/download/${pkgver}/${_pkgname}-import-linux-amd64")
sha256sums=('db4a716da2d5a5a234eb138980e33cf6a1fe411eae068e8db6f41e73a9a67103'
            'f1630544f9da6d125967a9224cee919b686a7b2b3ea37d7ecbfa8216b2837534')
sha256sums_armv7h=('6453441ee0821c19ed72d62aa4c2ca1f589dcde1bb3ae17880295229c8de15a7'
                   '534ec1eb621a9fa928b793e65bb751c8eded14b6faee2c8d448259063666d760')
sha256sums_x86_64=('eedf5f445fde57d4262554b61b9bb085b12df7968a29c6e78a0e8b1d73793f42'
                   '3fba8f27324a1617d2813d58840d32293d878b9bc69cf540343468173b68dbad')

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
