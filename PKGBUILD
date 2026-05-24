# Maintainer: Emmanuel <emmanuel@akemsoft.com>
# Contributor: Arch Linux User <user@archlinux.org>

pkgname=opengui-bin
pkgver=0.5.12
pkgrel=1
pkgdesc="Desktop and web command center for coding agents (OpenCode, Claude Code, Codex, Pi) - prebuilt"
arch=('x86_64')
url='https://opengui.io'
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'libnotify' 'alsa-lib' 'libcups')
optdepends=('bun: web server mode')
provides=('opengui')
conflicts=('opengui')
source=("https://github.com/akemmanuel/OpenGUI/releases/download/v$pkgver/opengui_${pkgver}_amd64.deb"
        "https://raw.githubusercontent.com/akemmanuel/OpenGUI/v$pkgver/LICENSE")
sha256sums=('89e44977ef4df19a34ade9fa7261a996278a66b6206e8fef72e935dd1c04f675'
            'b84e4a4cae4cb52c0b558066609745490514725b0e05afaeee6a7d5ce3278046')

package() {
  cd "$srcdir"

  ar x opengui_${pkgver}_amd64.deb
  tar xf data.tar.xz

  install -dm755 "$pkgdir/opt/opengui"
  cp -a opt/OpenGUI/* "$pkgdir/opt/opengui/"

  install -Dm644 usr/share/icons/hicolor/512x512/apps/opengui.png \
    "$pkgdir/usr/share/pixmaps/opengui.png"

  install -Dm644 usr/share/applications/opengui.desktop \
    "$pkgdir/usr/share/applications/opengui.desktop"
  sed -i "s|Exec=/opt/OpenGUI/opengui|Exec=/usr/bin/opengui|" \
    "$pkgdir/usr/share/applications/opengui.desktop"

  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/opengui/opengui "$pkgdir/usr/bin/opengui"

  chmod 4755 "$pkgdir/opt/opengui/chrome-sandbox"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 opt/OpenGUI/LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  install -Dm644 usr/share/doc/opengui/changelog.gz \
    "$pkgdir/usr/share/licenses/$pkgname/changelog.gz"
}
