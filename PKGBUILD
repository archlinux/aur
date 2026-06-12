# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
# shellcheck disable=all
pkgname=full-upgrade
pkgver=3.2.0
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
sha256sums=('c3680b1fe01bdbc401f6e78ef3f60218481b775a434a36e3e24f33fe43b37c76')

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
