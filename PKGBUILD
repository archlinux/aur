# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
# shellcheck disable=all
pkgname=full-upgrade
pkgver=3.2.1
pkgrel=1
pkgdesc="Orquestrador Bash modular para atualizar, manter e auditar máquinas Arch Linux"
arch=('any')
url="https://github.com/bernardopg/full-upgrade"
license=('MIT')
depends=('bash' 'pacman')
optdepends=(
  'paru: atualização de pacotes AUR'
  'yay: alternativa ao paru para AUR'
  'reflector: atualização da mirrorlist'
  'pacman-contrib: paccache e pacdiff (.pacnew)'
  'flatpak: atualização de aplicações Flatpak'
  'fwupd: atualização de firmware'
  'btrfs-progs: snapshots e doctor de saúde btrfs'
  'snapper: snapshots pré-upgrade em btrfs'
  'smartmontools: doctor SMART de discos'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('26ded4bdc44d578ac2ca8d47ba2d02e58c3f2a935b48027d30ed94f28a0cebd1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Gera o distribuível single-file a partir das libs modulares.
  ./build.sh
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Sanidade: o standalone construído tem sintaxe válida e lista os steps.
  bash -n dist/full-upgrade-standalone.sh
  ./dist/full-upgrade-standalone.sh --list-steps >/dev/null
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Binário: o standalone auto-contido vai para /usr/bin.
  install -Dm755 dist/full-upgrade-standalone.sh "${pkgdir}/usr/bin/full-upgrade"

  # Config de exemplo (o usuário copia para ~/.config/full-upgrade/config).
  install -Dm644 config.example "${pkgdir}/usr/share/${pkgname}/config.example"

  # Documentação e licença.
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
