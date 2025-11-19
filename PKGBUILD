# Maintainer: Igor Aguiar Rodrigues <igor_aguiar@yahoo.com.br>
pkgname=goose-desktop-bin
pkgver=1.15.0
pkgrel=1
pkgdesc="Goose Desktop (prebuilt .deb repack) — an open source, extensible AI agent that goes beyond code suggestions - install, execute, edit, and test with any LLM"
arch=('x86_64')
url="https://github.com/block/goose"
license=('Apache-2.0')
provides=('goose-desktop')
conflicts=('goose-desktop')     # conflict only with the source-built variant, not with codename-goose-bin
depends=('glibc')
options=(!strip)
# tip: replace SKIP with the real SHA256 (use updpkgsums)
source=("goose_${pkgver}_amd64.deb::https://github.com/block/goose/releases/download/v${pkgver}/goose_${pkgver}_amd64.deb")
sha256sums=('46c27e675d2fae804d6b2b80d556d0b016f0fa8329671f9a1f2a691dec70ac2c')

build() { :; }

package() {
  # unpack the deb
  bsdtar -xf "${srcdir}/goose_${pkgver}_amd64.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  # The .deb drops files here:
  # - ${pkgdir}/usr/lib/goose/* (Electron bundle, main binary is "Goose")
  # - ${pkgdir}/usr/bin/goose   (wrapper we must NOT install)
  # - ${pkgdir}/usr/share/applications/goose.desktop
  # - ${pkgdir}/usr/share/pixmaps/goose.png
  #
  # 1) Remove upstream CLI wrapper to avoid conflict with codename-goose-bin:
  rm -f "${pkgdir}/usr/bin/goose"

  # 2) Relocate the Electron bundle to a desktop-specific dir to avoid name ambiguity
  #    (optional but cleaner). Keep it under /opt/goose-desktop.
  install -d "${pkgdir}/opt/goose-desktop"
  mv "${pkgdir}/usr/lib/goose/"* "${pkgdir}/opt/goose-desktop/"
  rmdir "${pkgdir}/usr/lib/goose" || true
  rmdir "${pkgdir}/usr/lib" 2>/dev/null || true

  # Optional: setuid sandbox (many Electron -bin packages do this; harmless if userns is enabled)
  if [[ -f "${pkgdir}/opt/goose-desktop/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/goose-desktop/chrome-sandbox" || true
  fi

  # 3) Provide a desktop-specific launcher on PATH
  install -d "${pkgdir}/usr/bin"
  # The real Electron binary in your tree is capital 'Goose'
  cat > "${pkgdir}/usr/bin/goose-desktop" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail
APPDIR="/opt/goose-desktop"
[[ -x "$APPDIR/Goose" ]] || APPDIR="/usr/lib/goose-desktop"
EXEC="$APPDIR/Goose"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
FLAGS_FILE="$XDG_CONFIG_HOME/goose-desktop-flags.conf"
if [[ -f "$FLAGS_FILE" ]]; then
  GOOSE_USER_FLAGS="$(sed 's/#.*//' "$FLAGS_FILE" | tr '\n' ' ')"
fi
exec "$EXEC" "$@" ${GOOSE_USER_FLAGS:-}
EOF
  chmod 755 "${pkgdir}/usr/bin/goose-desktop"

  # 4) Fix the desktop entry to call goose-desktop and give it a unique filename
  if [[ -f "${pkgdir}/usr/share/applications/goose.desktop" ]]; then
    mv "${pkgdir}/usr/share/applications/goose.desktop" \
       "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    sed -i \
      -e 's|^Exec=.*|Exec=/usr/bin/goose-desktop %U|' \
      -e 's|^Name=Goose$|Name=Goose Desktop|' \
      "${pkgdir}/usr/share/applications/goose-desktop.desktop"
    # Keep Icon=goose (it refers to /usr/share/pixmaps/goose.png already shipped)
  fi

  # 5) (Optional) standard Arch license path if upstream included copyright file
  if [[ -f "${pkgdir}/usr/share/doc/goose/copyright" ]]; then
    install -Dm644 "${pkgdir}/usr/share/doc/goose/copyright" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

# Smooth upgrade if you previously published a conflicting rev that installed /usr/bin/goose
# pkgrel bumped to 2; uncomment if needed:
# replaces=('goose-desktop-bin<1.8.0-2')
