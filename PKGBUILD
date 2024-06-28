# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dstask"
_import="${_pkgname}-import"
pkgname="${_pkgname}-bin"
pkgver=0.26.0
pkgrel=1
pkgdesc="Single binary terminal-based TODO manager with git-based sync + markdown notes per task"
arch=('x86_64' 'armv5h')
url="https://github.com/naggie/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" "${_import}")
conflicts=("${_pkgname}" "${_import}")
_pkgsrc_a="${_pkgname}-${pkgver}"
_pkgsrc_b="${_import}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc_a}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64"
               "${_pkgsrc_b}::${url}/releases/download/v${pkgver}/${_import}-linux-amd64")
source_armv5h=("${_pkgsrc_a}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm5"
               "${_pkgsrc_b}::${url}/releases/download/v${pkgver}/${_import}-linux-arm5")
sha256sums=('be122b1ce86379d58aa7b9f6dc8e874e6038d093a6a93292422e759252651546'
            'f1630544f9da6d125967a9224cee919b686a7b2b3ea37d7ecbfa8216b2837534')
sha256sums_x86_64=('7cb00054a26884b3d828e532665a44b66a337e0f597601cb342656635bf3d6c0'
                   '40712eec79f0a1046303a825b36bdd95baf3b60fb40c2496e8791513a974b5d7')
sha256sums_armv5h=('f10e067d0a30c0adaa0a75557761b4e8c8f6119252e31ba20127ce8f8ff6a07a'
                   '4c6ef2e0cb93f758a558337938d3aa66f008a2a554dac58a4a0ebbe9107da2c3')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  [ -d "completions" ] || mkdir "completions"
  chmod +x "${_pkgsrc_a}"
  for _sh in bash zsh; do
    ./"${_pkgsrc_a}" "${_sh}-completion" > "completions/${_pkgname}.${_sh}"
  done
}

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc_a}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${_pkgsrc_b}" "${pkgdir}/usr/bin/${_import}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  # install -Dm644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
