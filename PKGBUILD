# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blob42
_pkgname=aichat-ng
pkgname=${_pkgname}-bin
pkgver=0.31.0
pkgrel=2
pkgdesc="OpenAI, ChatGPT, Gemini, Claude, Mistral, Ollama and more in your terminal. Fork with advanced features."
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i686' 'aarch64')
license=('AGPL-3.0-only')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        ${_urlraw}/scripts/completions/aichat.{bash,fish,zsh,nu,ps1}
        ${_urlraw}/scripts/shell-integration/integration.{bash,fish,zsh,nu,ps1})
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${_barch[0]}-unknown-linux-musl.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${_barch[1]}-unknown-linux-musl.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-${_barch[2]}-unknown-linux-musl.tar.gz")
sha256sums=('57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6'
            '0cc6d7d07d49c1ef03f2ed81ddf3c51d1c0735cb0db61281af7a98fcfdca65f4'
            'c67c49d96021acf610f51452cae6b926c00e0650f6e61a7670b0107b09eb2913'
            '205e6acb87cf92cdef2bf57471d955b867cadaeca31f93a44b35362ab5646425'
            '98ff3dc671f31e464c712b06572a7047d97ab88a1385221141a4419bc1fbb986'
            'b0f89c4cb47198b1447b1ec21778db65d26ff2d122e435149b70802ba6e87f86'
            '0a1f2d6a03c75f82de702459d5ff7b6ee2c57912a3347d00ec88fc2a2e152af3'
            'ea98b0ccad47f1177002e0ac38351dabb8a3430fc7fe1bbe39009182ad4087ec'
            '30c5b46ccec47a92d2fff154d2167620f13c06429d34d51f2f009b77df43202c'
            'fb6404c76434a7d6c220e0060fda89cdb0627ebcf55dc2d7db428f0ccf2a3f6f'
            '44f96ee416d97fcd670e879246f7a26af7e5003252ce5977f237ee22dd71608c'
            '6661e14c7fc7c543c911a44a884400634c1ce71218c7770b638334af468d58a9')
sha256sums_x86_64=('8e1f5a9cf09ae651168f2a425de20b2f6e8702072d47a7052c6229fa366aa57b')
sha256sums_i686=('148abe6b52b22b30072cac12d626c6c7f1d7bfb35086cdbd3d0a9a40b59fc140')
sha256sums_aarch64=('e883b904777ea42837e71a151025593c3e60e2628d21867f8813fb48e808d7d7')

prepare() {
  cd "${srcdir}/" || exit

  mkdir -p ./scripts/completions/
  mv aichat.{bash,fish,zsh,nu,ps1} ./scripts/completions/
  sed -i -e 's/aichat/aichat-ng/g' ./scripts/completions/aichat.{bash,fish,zsh,nu,ps1}

  mkdir -p ./scripts/shell-integration/
  mv integration.{bash,fish,zsh,nu,ps1} ./scripts/shell-integration/
  sed -i -e 's/aichat/aichat-ng/g' ./scripts/shell-integration/integration.{bash,fish,zsh,nu,ps1}
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -vDm644 scripts/completions/${_pkgname%-ng}.bash "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 scripts/completions/${_pkgname%-ng}.fish "$pkgdir/usr/share/fish/completions/${_pkgname}.fish"
  install -vDm644 scripts/completions/${_pkgname%-ng}.nu "$pkgdir/usr/share/nu/completions/${_pkgname}.nu"
  install -vDm644 scripts/completions/${_pkgname%-ng}.ps1 "$pkgdir/usr/share/powershell/completions/${_pkgname}.ps1"
  install -vDm644 scripts/completions/${_pkgname%-ng}.zsh "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"

  install -vDm644 -t "$pkgdir/usr/share/${_pkgname}" scripts/shell-integration/integration.bash
  install -vDm644 -t "$pkgdir/usr/share/${_pkgname}" scripts/shell-integration/integration.nu
  install -vDm644 -t "$pkgdir/usr/share/${_pkgname}" scripts/shell-integration/integration.zsh
  install -vDm644 -t "$pkgdir/usr/share/${_pkgname}" scripts/shell-integration/integration.fish
  install -vDm644 -t "$pkgdir/usr/share/${_pkgname}" scripts/shell-integration/integration.ps1
}
