# Maintainer: Carlos A. Planchón <carlosandresplanchonprestes@gmail.com>

# This package is not affiliated with or endorsed by AGESIC.
# This package repackages proprietary middleware distributed by AGESIC for Arch Linux.

pkgname=cedula-uruguay-pkcs11
pkgver=7.5.0
pkgrel=2
pkgdesc="PKCS#11 middleware for the Uruguayan electronic ID card (cédula)"
arch=('x86_64')
url="https://www.gub.uy/agencia-gobierno-electronico-sociedad-informacion-conocimiento/firma-digital/drivers-para-usar-cedula-digital"
license=('custom')
depends=('pcsclite' 'ccid')
optdepends=('qt5-base: GUI for the secure PIN / bio dialogs (SecurePinDialog/SecureBioDialog)')
makedepends=('binutils' 'tar')
options=('!debug')
source=("libclassicclient.deb::https://archivos.agesic.gub.uy/nextcloud/index.php/s/8kqSb9z4xKABM8T/download")
sha256sums=('b6fd0150fcea2b952b0d82027324cf3250dea6f42eaac430d6d08ea22eb840ed')

prepare() {
  cd "$srcdir"
  ar x libclassicclient.deb
}

package() {
  cd "$srcdir"

  local extractdir="$srcdir/extract"
  rm -rf "$extractdir"
  mkdir -p "$extractdir"

  tar -xf data.tar.* -C "$extractdir"

  install -dm755 "$pkgdir/usr/lib/ClassicClient"
  cp -a "$extractdir/usr/lib/ClassicClient/." "$pkgdir/usr/lib/ClassicClient/"

  if [[ -d "$extractdir/etc/ClassicClient" ]]; then
    install -dm755 "$pkgdir/etc/ClassicClient"
    cp -a "$extractdir/etc/ClassicClient/." "$pkgdir/etc/ClassicClient/"
  fi

  install -dm755 "$pkgdir/usr/lib/pkcs11"
  ln -sf ../ClassicClient/libgclib.so "$pkgdir/usr/lib/pkcs11/libgclib.so"

  # Install the helper binaries the upstream .deb ships in /usr/bin (previously
  # omitted by this package). The middleware launches SecurePinDialog / SecureBioDialog
  # for PIN and biometric entry; PIN entry misbehaves if SecurePinDialog is absent.
  install -dm755 "$pkgdir/usr/bin"

  # standalone change-PIN tools (no Qt); referenced by the already-installed .desktop
  install -m755 "$extractdir/usr/bin/CCChangePinService" "$pkgdir/usr/bin/"
  install -m755 "$extractdir/usr/bin/CCChangePinTool"     "$pkgdir/usr/bin/"

  # Qt GUI dialogs: real binary next to Resources/, plus a small wrapper at the path
  # the middleware launches. The wrapper uses Qt's offscreen platform when there is no
  # display, so the dialogs also work on headless systems.
  install -m755 "$extractdir/usr/bin/SecurePinDialog" "$pkgdir/usr/lib/ClassicClient/"
  install -m755 "$extractdir/usr/bin/SecureBioDialog" "$pkgdir/usr/lib/ClassicClient/"

  local d
  for d in SecurePinDialog SecureBioDialog; do
    cat > "$pkgdir/usr/bin/$d" <<EOF
#!/bin/sh
# Wrapper for the Classic Client secure dialog, shipped by $pkgname. Falls back to
# Qt's offscreen platform when no display is available so it works on headless systems.
[ -z "\${DISPLAY:-}" ] && [ -z "\${WAYLAND_DISPLAY:-}" ] && export QT_QPA_PLATFORM=offscreen
exec /usr/lib/ClassicClient/$d "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$d"
  done

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
This package installs proprietary middleware obtained from AGESIC distribution channels.
The user is responsible for complying with the vendor's license and usage terms.
EOF
}
