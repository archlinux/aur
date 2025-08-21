# Maintainer: Your Name <you@example.com>
pkgname=eveusb
pkgver=1.0.0
pkgrel=1
pkgdesc="USB Network Gate  (packaged from the Debian .deb)"
arch=('x86_64')
url="https://example.com/"
license=('custom')
depends=('systemd' 'udev')
source=()
sha256sums=()

build() {
  # Nothing to build: we package the files extracted from the .deb
  return 0
}

package() {
  cd "$srcdir"

  # Install application under /opt to preserve upstream layout
  install -d "$pkgdir/opt/ElectronicTeam/eveusb"
  cp -a opt/ElectronicTeam/eveusb/* "$pkgdir/opt/ElectronicTeam/eveusb/"

  # Install configuration files if present
  if [ -d "etc/ElectronicTeam" ]; then
    install -d "$pkgdir/etc/ElectronicTeam"
    cp -a etc/ElectronicTeam/* "$pkgdir/etc/ElectronicTeam/"
  fi

  # Ensure binaries are executable
  if [ -d "$pkgdir/opt/ElectronicTeam/eveusb/bin" ]; then
    chmod -R 755 "$pkgdir/opt/ElectronicTeam/eveusb/bin"
  fi

  # Explicit wrapper scripts into /usr/bin to set LD_LIBRARY_PATH
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/eveusb" <<'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/ElectronicTeam/eveusb/lib:${LD_LIBRARY_PATH}"
exec "/opt/ElectronicTeam/eveusb/bin/eveusb" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/eveusb"

  cat > "$pkgdir/usr/bin/eveusbc" <<'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/ElectronicTeam/eveusb/lib:${LD_LIBRARY_PATH}"
exec "/opt/ElectronicTeam/eveusb/bin/eveusbc" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/eveusbc"

  cat > "$pkgdir/usr/bin/eveusbd" <<'EOF'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/ElectronicTeam/eveusb/lib:${LD_LIBRARY_PATH}"
exec "/opt/ElectronicTeam/eveusb/bin/eveusbd" "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/eveusbd"

  # Install systemd unit if present in deb under lib/systemd/system
  if [ -f "lib/systemd/system/eveusb.service" ]; then
    install -Dm644 lib/systemd/system/eveusb.service "$pkgdir/usr/lib/systemd/system/eveusb.service"
  fi

  # Install udev rules if present in deb under lib/udev/rules.d
  if [ -d "lib/udev/rules.d" ]; then
    install -d "$pkgdir/usr/lib/udev/rules.d"
    for r in lib/udev/rules.d/*; do
      [ -f "$r" ] || continue
      install -Dm644 "$r" "$pkgdir/usr/lib/udev/rules.d/$(basename "$r")"
    done
  fi

  # Desktop file
  if [ -f "opt/ElectronicTeam/eveusb/desktop/electronic-eveusb.desktop" ]; then
    install -Dm644 opt/ElectronicTeam/eveusb/desktop/electronic-eveusb.desktop "$pkgdir/usr/share/applications/electronic-eveusb.desktop"
  fi

  # Icons -> pixmaps (simple approach)
  install -d "$pkgdir/usr/share/pixmaps"
  for img in opt/ElectronicTeam/eveusb/desktop/*.png; do
    [ -f "$img" ] || continue
    install -Dm644 "$img" "$pkgdir/usr/share/pixmaps/$(basename "$img")"
  done

  # Ensure bundled libs have correct permissions
  if [ -d "$pkgdir/opt/ElectronicTeam/eveusb/lib" ]; then
    find "$pkgdir/opt/ElectronicTeam/eveusb/lib" -type f -exec chmod 644 {} +
  fi

  # Install DKMS module sources for kernel module build
  if [ -d "opt/ElectronicTeam/eveusb/module" ]; then
    install -d "$pkgdir/usr/src/eveusb-1.0.0"
    cp -a opt/ElectronicTeam/eveusb/module/* "$pkgdir/usr/src/eveusb-1.0.0/"
    # Ensure permissions are sane
    find "$pkgdir/usr/src/eveusb-1.0.0" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/src/eveusb-1.0.0" -type f -name '*.sh' -exec chmod 755 {} + || true
    find "$pkgdir/usr/src/eveusb-1.0.0" -type f -name 'Makefile' -exec chmod 644 {} + || true
  fi
}
