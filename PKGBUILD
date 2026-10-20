# Maintainer: Grunden AI <support@grunden.ai>
# This is a template — packaging/aur/render.sh writes PKGBUILD from it with a
# release's version and tarball hash. The workflow (.github/workflows/
# aur-publish.yml) does that on every release; see packaging/aur/README.md to
# render it by hand.
pkgname=grunden-work-bin
pkgver=0.17.83
pkgrel=1
pkgdesc="Grunden Cowork desktop - sovereign AI workbench (prebuilt release)"
arch=('x86_64')
url="https://grunden.ai"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libsecret' 'xdg-utils')
optdepends=('gnome-keyring: Secret Service backend for sign-in credential storage'
            'kwallet: KDE keyring backend for sign-in credential storage'
            'libayatana-appindicator: system tray support')
conflicts=('grunden-work')
provides=('grunden-work')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://work.grunden.ai/installers/grunden-work-linux-x64-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://work.grunden.ai/installers/grunden-work-linux-x64-$pkgver.tar.gz.asc")
sha256sums=('a6df2c974b77ba62457e31f55c626b2fe52a4be180d94485090cdd9e56b6d865'
            'SKIP')
# Grunden's Linux release key (ADR 0123 Amendment 2); makepkg refuses a tarball
# whose signature it cannot check against it. The key is also in this
# repository under keys/pgp/, and at https://work.grunden.ai/installers/grunden-linux-release-key.asc.
validpgpkeys=('F0278514447EB0CC73F11D02E2773FCE0DD16E0A')
package() {
  install -d "$pkgdir/opt/grunden-work"
  cp -a "$srcdir/grunden-work-linux-x64-$pkgver/." "$pkgdir/opt/grunden-work/"
  # Chromium's SUID sandbox; harmless where unprivileged user namespaces suffice
  chmod 4755 "$pkgdir/opt/grunden-work/chrome-sandbox"
  install -d "$pkgdir/usr/bin"
  ln -s /opt/grunden-work/grunden-work "$pkgdir/usr/bin/grunden-work"
  install -Dm644 "$srcdir/grunden-work-linux-x64-$pkgver/resources/legal/OPENWORK-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/grunden-work-linux-x64-$pkgver/resources/icons/icon.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/grunden-work.png"
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/grunden-work.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Grunden Cowork
Comment=Grunden Cowork desktop app
Exec=grunden-work %U
Icon=grunden-work
Terminal=false
Categories=Network;
MimeType=x-scheme-handler/grunden-work;
StartupNotify=true
StartupWMClass=grunden-work
DESKTOP
}
