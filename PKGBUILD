# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# DevEco Device Tool is behind a logged-in download page and its URL is
# signature-bearing, so the source list is intentionally empty. Provide the zip
# at build time: copy the download link and run
#   ./deveco-devicetool-url
# or
#   DEVECO_DEVICETOOL_URL='<signed url>' makepkg -si
# or drop devicetool-linux-tool-<version>.zip next to this PKGBUILD.
pkgname=deveco-devicetool
pkgver=4.0.0.400
pkgrel=2
pkgdesc='HUAWEI DevEco Device Tool for OpenHarmony device development (VS Code toolchain bundle)'
arch=('x86_64')
url='https://device.harmonyos.com/cn/develop/ide/'
license=('LicenseRef-Huawei-EULA')
depends=('python' 'unzip')
optdepends=('code: load the bundled DevEco Device Tool extensions')
options=('!strip')
source=()
sha256sums=()

_zip_glob=devicetool-linux-tool-*.zip

pkgver() {
  local f v
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -n "$f" ]]; then
    v=$(basename "$f" | sed -nE 's/^devicetool-linux-tool-([0-9][0-9.]*)\.zip$/\1/p')
    [[ -n "$v" ]] && { printf '%s' "$v"; return; }
  fi
  printf '%s' "${pkgver:-0}"
}

prepare() {
  local f
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -z "$f" ]]; then
    if [[ -n "${DEVECO_DEVICETOOL_URL:-}" ]]; then
      f="$srcdir/$(basename "${DEVECO_DEVICETOOL_URL%%\?*}")"
      [[ "$f" == *.zip ]] || f="$srcdir/devicetool-linux-tool.zip"
      msg "fetching $(basename "$f")"
      curl -fL --retry 3 -o "$f" "$DEVECO_DEVICETOOL_URL"
    else
      error "No DevEco Device Tool archive found."
      error ""
      error "  Download it from https://device.harmonyos.com/cn/develop/ide"
      error "  then either copy the link and run"
      error "    DEVECO_DEVICETOOL_URL='<signed url>' makepkg -si"
      error "  or place devicetool-linux-tool-<version>.zip next to this PKGBUILD."
      return 1
    fi
  fi
  rm -rf "$srcdir/payload" "$srcdir/extracted"
  mkdir -p "$srcdir/payload"
  unzip -q -o "$f" -d "$srcdir/payload"
  chmod +x "$srcdir/payload/"*.sh
  sh "$srcdir/payload/"*.sh --noexec --nox11 --target "$srcdir/extracted"
}

package() {
  install -d "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer"
  cp -r --no-preserve=ownership "$srcdir/extracted/." "$pkgdir/opt/Huawei/DevEco-Device-Tool/installer/"

  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m644 "$srcdir/extracted"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 "$srcdir/extracted/privacy_statement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/deveco-devicetool" <<'EOF'
#!/bin/sh
# vendor installer needs root and installs per-user VS Code plugins
exec sudo -E /opt/Huawei/DevEco-Device-Tool/installer/run.sh --system "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/deveco-devicetool"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'DevEco Device Tool is installed under /opt/Huawei/DevEco-Device-Tool.' \
    'Run deveco-devicetool once to install the VS Code extensions per user.' \
    > "$pkgdir/usr/share/doc/$pkgname/README"
}
