# Maintainer: Grunden AI <support@grunden.ai>
# This is a template — packaging/aur/render.sh writes PKGBUILD from it with a
# release's version and tarball hash. The workflow (.github/workflows/
# aur-publish.yml) does that on every release; see packaging/aur/README.md to
# render it by hand.
pkgname=grunden-work-bin
pkgver=0.17.90
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
sha256sums=('d0dde90c84366cb8b178402fd5d2ed0917fe1fc718320fbf8998e490476f80a3'
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
  # A launcher rather than a symlink, so a member adds flags (on i3 or sway,
  # --password-store=gnome-libsecret) in a file instead of a user-level
  # grunden-work.desktop, which hides this package's entry from the menu.
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/grunden-work" <<'LAUNCHER'
#!/bin/sh
# Flags from ~/.config/grunden-work-flags.conf: whitespace-separated, # starts a comment.
set -f
conf="${XDG_CONFIG_HOME:-$HOME/.config}/grunden-work-flags.conf"
flags=
[ -r "$conf" ] && flags=$(sed 's/#.*//' "$conf")
exec /opt/grunden-work/grunden-work $flags "$@"
LAUNCHER
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
