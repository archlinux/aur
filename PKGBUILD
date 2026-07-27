# Maintainer: Bernardo Pinto Gomes <bernardopgomes@hotmail.com>
# shellcheck disable=all
pkgname=full-upgrade
pkgver=3.31.0
pkgrel=1
pkgdesc="Orquestrador Bash modular para atualizar, manter e auditar máquinas Arch Linux"
arch=('any')
url="https://github.com/bernardopg/full-upgrade"
license=('MIT')
depends=('bash' 'pacman' 'hicolor-icon-theme')
optdepends=(
  'paru: atualização de pacotes AUR'
  'yay: alternativa ao paru para AUR'
  'reflector: atualização da mirrorlist'
  'pacman-contrib: paccache e pacdiff (.pacnew)'
  'python-gobject: backend AppIndicator do systray em Wayland'
  'libayatana-appindicator: backend AppIndicator do systray em Wayland'
  'yad: backend X11 do ícone de bandeja (--tray)'
  'libnotify: notificações desktop'
  'xdg-utils: abrir último log e integrar com desktop'
  'xdg-terminal-exec: escolher terminal para ações do systray'
  'flatpak: atualização de aplicações Flatpak'
  'fwupd: atualização de firmware'
  'btrfs-progs: snapshots e doctor de saúde btrfs'
  'snapper: snapshots pré-upgrade em btrfs'
  'smartmontools: doctor SMART de discos'
)
makedepends=('git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5d243e6600660f10b2b36f4d5cc94b7231f923da2cb5d5f70bdaa3093fdce749')

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

  # Ícones/desktop/service do systray opcional.
  install -Dm644 assets/icons/*.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 res/full-upgrade-tray.desktop "${pkgdir}/usr/share/applications/full-upgrade-tray.desktop"
  install -Dm644 res/full-upgrade-tray.service "${pkgdir}/usr/lib/systemd/user/full-upgrade-tray.service"
  sed -i 's|@FULL_UPGRADE_EXEC@|/usr/bin/full-upgrade|g' "${pkgdir}/usr/lib/systemd/user/full-upgrade-tray.service"

  # Documentação e licença.
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
