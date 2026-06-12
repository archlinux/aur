# Maintainer: Rodrigo Brito <rodrigo@w3ti.com.br>
pkgname=prosa
pkgver=1.0.10
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
  ln -sf /opt/Prosa/prosa "${pkgdir}/usr/bin/prosa"

  # O .deb já instala os ícones hicolor 16→1024; acrescentamos só o fallback
  # legado em /usr/share/pixmaps, que alguns ambientes ainda consultam.
  if [ -f "${pkgdir}/usr/share/icons/hicolor/256x256/apps/prosa.png" ]; then
    install -Dm644 \
      "${pkgdir}/usr/share/icons/hicolor/256x256/apps/prosa.png" \
      "${pkgdir}/usr/share/pixmaps/prosa.png"
  fi

  # O chrome-sandbox precisa de setuid root.
  if [ -f "${pkgdir}/opt/Prosa/chrome-sandbox" ]; then
    chmod 4755 "${pkgdir}/opt/Prosa/chrome-sandbox"
  fi
}
