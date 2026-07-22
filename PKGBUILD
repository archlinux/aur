# Maintainer: Gabbro <gabbro@tuta.com>
#
# gabbro-bin: repackages the prebuilt Gabbro Linux release tarball. Building the
# full Flutter + Rust stack from source in the AUR is heavy and needless when the
# release bundle is self-contained -- hence the -bin package (AUR guideline for
# prebuilt binaries).

pkgname=gabbro-bin
pkgver=0.1.0_alpha.16
pkgrel=1
_pkgver=${pkgver//_/-}   # tag/filename form: 0.1.0-alpha.16
pkgdesc="Quantum-resistant password manager"
arch=('x86_64')
url="https://github.com/gabbro-foss/gabbro"
license=('GPL-3.0-only')
depends=('gtk3' 'libfido2' 'libcbor' 'pcsclite')
optdepends=('xdg-desktop-portal-gtk: native file dialogs (open/save/pick folder)'
            'pcscd: NFC YubiKey support (running pcscd required)')
provides=('gabbro')
conflicts=('gabbro')
options=('!strip' '!debug')   # prebuilt bundle; don't strip or split debug symbols
source=("gabbro-${_pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${_pkgver}/gabbro-${_pkgver}-linux-x86_64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/gabbro-foss/gabbro/v${_pkgver}/LICENSE")
sha256sums=('5c0cd2c8d326bcd12b774ca07674c44f26cb9ac505218ecd2766f70cbbe32c78'
            '9eb52965f51761109c61c9f91ed4c2ab4017c1d8b14bbb02fb178dbaf1346545')

package() {
  # Self-contained Flutter bundle -> /usr/lib/gabbro (must stay together).
  install -dm755 "$pkgdir/usr/lib/gabbro"
  cp -r "$srcdir/bundle/." "$pkgdir/usr/lib/gabbro/"
  chmod 755 "$pkgdir/usr/lib/gabbro/gabbro"

  # PATH launcher: a wrapper that execs the bundle binary in place.
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/gabbro" <<'SH'
#!/bin/sh
exec /usr/lib/gabbro/gabbro "$@"
SH
  chmod 755 "$pkgdir/usr/bin/gabbro"

  # Icons: the size-agnostic hicolor tree shipped in the tarball.
  install -dm755 "$pkgdir/usr/share/icons"
  cp -r "$srcdir/icons/hicolor" "$pkgdir/usr/share/icons/"

  # Desktop entry (Exec via the PATH launcher).
  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/app.gabbro.gabbro.desktop" <<'DESK'
[Desktop Entry]
Type=Application
Name=Gabbro
GenericName=Password Manager
Comment=Quantum-resistant password manager
Exec=/usr/bin/gabbro
Icon=gabbro
Terminal=false
Categories=Utility;Security;
Keywords=password;vault;passphrase;security;
StartupWMClass=app.gabbro.gabbro
DESK

  # Maintainer copyright notice + GPL-3.0 terms, conveyed with the binary (GPL section 5).
  # The repo LICENSE carries a copyright holder line that Arch's shared common GPL3 file
  # does not -- so we ship it rather than rely on that shortcut.
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
