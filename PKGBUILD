# Maintainer: Rodrigo Brito <rodrigo@w3ti.com.br>
pkgname=prosa
pkgver=4.0.0
pkgrel=1
pkgdesc="Editor de texto moderno, open source e em modo escuro — suíte Rodrigo Brito"
arch=('x86_64')
url="https://github.com/britors/Prosa"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'libnotify' 'libxtst' 'libxss' 'libsecret' 'at-spi2-core')
optdepends=('xdg-utils: abrir links externos')
options=('!strip' '!debug')
source=("prosa-${pkgver}.deb::https://github.com/britors/Prosa/releases/download/v${pkgver}/prosa_${pkgver}_amd64.deb")
noextract=("prosa-${pkgver}.deb")
sha256sums=('SKIP')

package() {
  cd "${srcdir}"
  # O .deb é um arquivo "ar" com data.tar.* — extraímos seu conteúdo.
  bsdtar -xf "prosa-${pkgver}.deb"
  bsdtar -xf data.tar.* -C "${pkgdir}"

  # Symlink em /usr/bin (o after-install do .deb não roda na AUR).
  install -dm755 "${pkgdir}/usr/bin"
  
  # Tenta encontrar o executável (geralmente 'prosa' ou 'Prosa')
  if [ -f "${pkgdir}/opt/Prosa/prosa" ]; then
    ln -sf /opt/Prosa/prosa "${pkgdir}/usr/bin/prosa"
  elif [ -f "${pkgdir}/opt/Prosa/Prosa" ]; then
    ln -sf /opt/Prosa/Prosa "${pkgdir}/usr/bin/prosa"
  fi

  # O .deb já instala os ícones hicolor; acrescentamos o fallback em /usr/share/pixmaps.
  # Procuramos por prosa.png ou Prosa.png em qualquer tamanho.
  local icon_src=$(find "${pkgdir}/usr/share/icons/hicolor" -name "prosa.png" -o -name "Prosa.png" | head -n 1)
  if [ -n "$icon_src" ]; then
    install -Dm644 "$icon_src" "${pkgdir}/usr/share/pixmaps/prosa.png"
  fi

  # Forçar o uso do caminho absoluto no desktop file para garantir compatibilidade.
  local desktop_file=$(find "${pkgdir}/usr/share/applications" -name "*.desktop" | head -n 1)
  if [ -n "$desktop_file" ]; then
    sed -i 's|^Icon=.*|Icon=/usr/share/pixmaps/prosa.png|' "$desktop_file"
  fi

  # O chrome-sandbox precisa de setuid root.
  if [ -f "${pkgdir}/opt/Prosa/chrome-sandbox" ]; then
    chmod 4755 "${pkgdir}/opt/Prosa/chrome-sandbox"
  fi
}
