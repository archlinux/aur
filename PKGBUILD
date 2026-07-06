# Maintainer: Rodrigo Brito <rodrigo@w3ti.com.br>
pkgname=lyra-tour
pkgver=2.1.0
pkgrel=1
pkgdesc="Aplicativo de boas-vindas do Lyra OS"
arch=('x86_64')
url="https://github.com/britors/Lyra-Tour"
license=('GPL3')
depends=('electron')
makedepends=('npm')
source=("$pkgname-$pkgver.tar.gz::https://github.com/britors/Lyra-Tour/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4207a16f42baa2634e41790efac80c3523593b706fbcf4cc91bd05b7e8ece86b')

# O tarball do GitHub extrai para "Lyra-Tour-$pkgver" (nome do repositório,
# maiúsculas preservadas), não para "$pkgname-$pkgver" — os dois divergem
# porque pkgname é sempre minúsculo por convenção do Arch.
_srcdir="Lyra-Tour-$pkgver"

build() {
  cd "$_srcdir"
  # --omit=optional pula 'electron' e 'electron-builder': são necessários só
  # para rodar/empacotar em outros formatos durante o desenvolvimento, não
  # para gerar o app.asar (o Electron do runtime vem do pacote 'electron' do
  # sistema, já declarado em depends). Isso evita baixar o Electron inteiro
  # (~100 MB) só para descartá-lo em seguida.
  npm ci --omit=optional
  npm run build
  npm run package:asar
}

package() {
  cd "$_srcdir"

  install -Dm755 resources/bin/lyra-tour "$pkgdir/usr/bin/lyra-tour"
  install -Dm644 app.asar "$pkgdir/usr/lib/lyra-tour/app.asar"

  install -Dm644 resources/desktop/lyra-tour.desktop \
    "$pkgdir/usr/share/applications/lyra-tour.desktop"
  install -Dm644 resources/desktop/lyra-tour-autostart.desktop \
    "$pkgdir/etc/xdg/autostart/lyra-tour.desktop"

  for size in 16 22 24 32 48 64 128 256 512; do
    install -Dm644 "resources/icons/hicolor/${size}x${size}/apps/lyra-tour.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/lyra-tour.png"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
