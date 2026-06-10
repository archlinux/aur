#
# Maintainer: Diego Ernani (CapivaraVai) <dernani@gmail.com>
#

pkgname=arch-update-vai
pkgver=0.7.1
pkgrel=1
pkgdesc="Script interativo para atualizar Arch Linux (pacman, AUR, Flatpak, Snap, fwupd) - git"
arch=('any')
url="https://codeberg.org/CapivaraVai/arch-update-vai"
license=('GPL-3.0-or-later')
depends=('bash' 'hicolor-icon-theme')
makedepends=('git')
optdepends=(
  'yay: suporte a AUR'
  'flatpak: suporte a Flatpak'
  'snapd: suporte a Snap'
  'fwupd: suporte a firmware (fwupdmgr)'
  'reflector: atualizar mirrorlist automaticamente'
  'python: checar pacotes pip'
  'python-pip: checar pacotes pip'
  'konsole: abrir pelo atalho KDE'
)

pkgver() {
    cd "$srcdir/arch-update-vai"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

source=("${pkgname}::git+https://codeberg.org/CapivaraVai/${pkgname}.git")
sha256sums=('SKIP')

package() {
  #cd "$srcdir/${pkgname}"
  cd "$srcdir/arch-update-vai"
  # programa
  install -Dm755 update-vai.sh "$pkgdir/usr/bin/update-vai"

  # docs/licença
  [[ -f README.md ]] && install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  [[ -f CHANGELOG.md ]] && install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  [[ -f LICENSE ]] && install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # bash completion
  install -Dm644 packaging/update-vai.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/update-vai"

  # manpage
  install -Dm644 packaging/update-vai.1 \
    "$pkgdir/usr/share/man/man1/update-vai.1"

  # systemd user units
  install -Dm644 packaging/update-vai.service \
    "$pkgdir/usr/lib/systemd/user/update-vai.service"
  install -Dm644 packaging/update-vai.timer \
    "$pkgdir/usr/lib/systemd/user/update-vai.timer"

  # desktop + ícone
  install -Dm644 packaging/update-vai.desktop \
    "$pkgdir/usr/share/applications/update-vai.desktop"
  install -Dm644 packaging/update-vai.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/update-vai.svg"
}

