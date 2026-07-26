# Maintainer: kohii <kohii.tokyo@gmail.com>
pkgname=smoothcsv-bin
pkgver=3.23.2
pkgrel=1
pkgdesc="A powerful and intuitive CSV editor built for real work"
arch=('x86_64' 'aarch64')
url="https://smoothcsv.com"
license=('LicenseRef-SmoothCSV')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'hicolor-icon-theme' 'xdg-utils' 'libsoup3' 'cairo' 'gdk-pixbuf2')
provides=('smoothcsv')
conflicts=('smoothcsv')
source=("LICENSE-SmoothCSV.md")
source_x86_64=("SmoothCSV_${pkgver}_amd64.deb::https://github.com/kohii/smoothcsv3/releases/download/v${pkgver}/SmoothCSV_${pkgver}_amd64.deb")
source_aarch64=("SmoothCSV_${pkgver}_arm64.deb::https://github.com/kohii/smoothcsv3/releases/download/v${pkgver}/SmoothCSV_${pkgver}_arm64.deb")
sha256sums=('b6a5ef347dba58db0b247e5d0e51aa8996a9668fe70171cc8624177af5e297a9')
sha256sums_x86_64=('e6faa7ca30f1962f0c4babaf4a238f3c5145423e642383aa654cf725db636e39')
sha256sums_aarch64=('080405612e160db18bf68896b3c385b342a065657303726c92b940881f1f87e8')

package() {
  local deb_arch

  if [[ " ${arch[*]} " != *" ${CARCH} "* ]]; then
    echo "Unsupported arch: $CARCH" >&2
    return 1
  fi

  if [[ $CARCH == aarch64 ]]; then
    deb_arch="arm64"
  else
    deb_arch="amd64"
  fi

  local deb="SmoothCSV_${pkgver}_${deb_arch}.deb"

  # Extract data.tar.* stream from the .deb and unpack it into $pkgdir
  bsdtar -Oxf "$deb" data.tar.* | bsdtar -x -C "$pkgdir" -f -

  # Ensure the CLI launcher is exposed under /usr/bin/smoothcsv just like the
  # Debian/RPM packages (AUR does not run maintainer scripts).
  local cli_source=""
  if [ -f "$pkgdir/usr/bin/smoothcsv-cli" ]; then
    cli_source="/usr/bin/smoothcsv-cli"
    chmod 755 "$pkgdir$cli_source"
  elif [ -f "$pkgdir/usr/lib/com.smoothcsv.desktop/resources/smoothcsv-cli" ]; then
    # Fallback for potential layout change; keep in sync with postinst.sh
    cli_source="/usr/lib/com.smoothcsv.desktop/resources/smoothcsv-cli"
    chmod 755 "$pkgdir$cli_source"
  else
    echo "Error: smoothcsv-cli not found in expected locations." >&2
    return 1
  fi

  install -d "$pkgdir/usr/bin"
  if [ ! -e "$pkgdir/usr/bin/smoothcsv" ]; then
    ln -s "$cli_source" "$pkgdir/usr/bin/smoothcsv"
  fi

  # Inject distribution channel so the app can adjust behavior (e.g. auto-update)
  for bin in smoothcsv smoothcsv-app; do
    if [ -e "$pkgdir/usr/bin/$bin" ]; then
      mv "$pkgdir/usr/bin/$bin" "$pkgdir/usr/bin/$bin.bin"
      cat > "$pkgdir/usr/bin/$bin" <<'EOF'
#!/usr/bin/env bash
export SMOOTHCSV_DIST_CHANNEL="AUR"
exec /usr/bin/SMOOTHCSV_BIN "$@"
EOF
      sed -i "s|SMOOTHCSV_BIN|$bin.bin|" "$pkgdir/usr/bin/$bin"
      chmod 755 "$pkgdir/usr/bin/$bin"
    fi
  done

  for desktop_file in "$pkgdir"/usr/share/applications/*.desktop; do
    [ -f "$desktop_file" ] || continue
    sed -i 's|^Exec=|Exec=env SMOOTHCSV_DIST_CHANNEL=AUR |' "$desktop_file"
  done

  install -Dm644 "${srcdir}/LICENSE-SmoothCSV.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-SmoothCSV.md"
}
