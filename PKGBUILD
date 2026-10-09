# Maintainer: Rhácius Castelo <rhacius@gmail.com>

pkgname=genex-desktop-bin
pkgver=0.1.4
pkgrel=2
pkgdesc='Desktop app for game development with AI'
arch=('x86_64')
url='https://github.com/genex-games/genex-desktop'
license=('MIT')
# bubblewrap, socat and ripgrep are commands the app refuses to start without.
# libsecret is dlopen'd for the cookie keyring, xdg-utils for xdg-open.
depends=(
  alsa-lib
  bubblewrap
  gtk3
  libsecret
  mesa
  nss
  ripgrep
  socat
  systemd-libs
  xdg-utils
)
provides=('genex-desktop')
conflicts=('genex-desktop')
options=('!strip' '!debug')
source=(
  "https://github.com/genex-games/genex-desktop/releases/download/v${pkgver}/Genex-linux-x64-${pkgver}.zip"
  "icon.png::https://raw.githubusercontent.com/genex-games/genex-desktop/v${pkgver}/build/icon.png"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/genex-games/genex-desktop/v${pkgver}/LICENSE"
  "THIRD-PARTY-NOTICES-${pkgver}.md::https://raw.githubusercontent.com/genex-games/genex-desktop/v${pkgver}/THIRD-PARTY-NOTICES.md"
  genex.desktop
)
noextract=("Genex-linux-x64-${pkgver}.zip")
sha256sums=(
  '456b6858d30592a901fc68f13a43feddfdef8ce1351cac0081d403211460da8f'
  '0376a357a2468c521c0cb3d31776f8d3956fd1a357185c432f9d54239b0798bb'
  '93e610b38d0e6b1f81989c13c1421f18461f943c1ca3ea8ca7eecf8327807c1e'
  '180f28fb97b6145eb7297adbbcdae35366427dbbd5d5f1a091cba4908ee2a514'
  '1f7c03a65c358dfc84ef994f39279b76702653d6545c051519c1aaab936d2d95'
)

package() {
  install -dm755 "$pkgdir/opt/genex"
  bsdtar --extract --file "$srcdir/Genex-linux-x64-${pkgver}.zip" \
    --directory "$pkgdir/opt/genex" --strip-components=1
  chown -R root:root "$pkgdir/opt/genex"

  # User namespaces cover the sandbox on Arch. The setuid bit is the fallback
  # Electron uses when unprivileged user namespaces are disabled.
  chmod 4755 "$pkgdir/opt/genex/chrome-sandbox"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /opt/genex/genex "$pkgdir/usr/bin/genex"

  install -Dm644 "$srcdir/genex.desktop" "$pkgdir/usr/share/applications/genex.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/genex.png"
  install -Dm644 "$srcdir/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES-${pkgver}.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"
  install -Dm644 "$pkgdir/opt/genex/LICENSES.chromium.html" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
