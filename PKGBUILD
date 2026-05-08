# Maintainer: Davi <davidev@snask.lang>
pkgname=snask
pkgver=0.4.1
pkgrel=1
pkgdesc="Snask Programming Language with Orchestrated Memory (OM) - Binary Release"
arch=('x86_64')
url="https://github.com/rancidavi-dotcom/TheSnask"
license=('MIT')
depends=('llvm18-libs' 'gtk3' 'zlib' 'sqlite' 'llvm18' 'clang18' 'lld18')
provides=('snask')
conflicts=('snask-git')
source_x86_64=(
  "${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/snask-linux-amd64"
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums_x86_64=('20a7dac42c7e8f47d53ac889a41c80398b4ae9b979015c2a9389526a9c3262de'
                   '6bafb82fed05c99a15c116c86d0d1028748c2d8b6facd3b93c547719cae175d2')

package() {
  # Instala o binário
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/snask"

  # Pasta do código fonte extraído
  local src_dir="TheSnask-${pkgver}"

  # Cria diretórios de biblioteca e src
  install -dm755 "${pkgdir}/usr/lib/snask/src"
  install -dm755 "${pkgdir}/usr/lib/snask/runtime"
  install -dm755 "${pkgdir}/usr/lib/snask/stdlib"

  # Copia stdlib e runtime do código fonte
  cp -r "${src_dir}/src/"* "${pkgdir}/usr/lib/snask/src/"
}

# Adiciona um hook para linkar a pasta esperada pelo snask setup na primeira execução
# Como não podemos rodar código no post_install facilmente via AUR, 
# vamos instruir o binário a procurar em /usr/lib/snask/src
# Mas como o binário está estático, vamos criar um symlink se não existir.
# Alternativamente, corrigimos o código do snask.
