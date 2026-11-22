# Maintainer: HanHaocheng <hanhaocheng@archlinux>
#
# DevEco Device Tool is behind a logged-in download page and its URL is
# signature-bearing, so the source list is intentionally empty. Provide the
# *Linux* zip at build time: copy its download link and run
#   ./deveco-devicetool-url
# or
#   DEVECO_DEVICETOOL_URL='<signed url>' makepkg -si
# or drop devicetool-linux-tool-<version>.zip next to this PKGBUILD.
#
# The vendor installer refuses a non-empty target, so the payload lives in
# /usr/share/deveco-devicetool/installer and only the wrapper triggers it; the
# actual tool lands in /opt/Huawei/DevEco-Device-Tool at first run.
pkgname=deveco-devicetool
pkgver=4.0.0.400
pkgrel=6
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
_installer=usr/share/$pkgname/installer

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
  local f name shf
  f=$(compgen -G "$srcdir/$_zip_glob" | head -1)
  if [[ -z "$f" ]]; then
    if [[ -n "${DEVECO_DEVICETOOL_URL:-}" ]]; then
      name=$(basename "${DEVECO_DEVICETOOL_URL%%\?*}")
      if [[ "$name" != devicetool-linux-*.zip ]]; then
        error "That URL is not the Linux DevEco Device Tool package: $name"
        error "Pick the Linux download (devicetool-linux-tool-<version>.zip), not the Windows build."
        return 1
      fi
      f="$srcdir/$name"
      msg "fetching $name"
      curl -fL --retry 3 -o "$f" "$DEVECO_DEVICETOOL_URL" ||
        { error "download failed"; return 1; }
    else
      error "No DevEco Device Tool archive found."
      error ""
      error "  Download the Linux build from https://device.harmonyos.com/cn/develop/ide"
      error "  then either copy the link and run"
      error "    DEVECO_DEVICETOOL_URL='<signed url>' makepkg -si"
      error "  or place devicetool-linux-tool-<version>.zip next to this PKGBUILD."
      return 1
    fi
  fi
  rm -rf "$srcdir/payload" "$srcdir/extracted"
  mkdir -p "$srcdir/payload"
  unzip -q -o "$f" -d "$srcdir/payload"
  shf=$(compgen -G "$srcdir/payload/*.sh" | head -1)
  if [[ -z "$shf" ]]; then
    error "Archive $(basename "$f") contains no self-extracting .sh installer."
    error "This is not the Linux DevEco Device Tool package; Windows builds are not supported."
    return 1
  fi
  chmod +x "$shf"
  sh "$shf" --noexec --nox11 --target "$srcdir/extracted"
  chmod 755 "$srcdir/extracted/"*.sh 2>/dev/null || true
}

package() {
  install -d "$pkgdir/$_installer"
  cp -r --no-preserve=ownership "$srcdir/extracted/." "$pkgdir/$_installer/"
  chmod 755 "$pkgdir/$_installer/"*.sh

  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m644 "$srcdir/extracted"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 "$srcdir/extracted/privacy_statement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/deveco-devicetool" <<'EOF'
#!/bin/sh
# The vendor installer insists on creating its own target directory, so it is
# started from the payload directory and only writes /opt on first run.
cd /usr/share/deveco-devicetool/installer || exit 1
exec sudo -E bash ./run.sh --system "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/deveco-devicetool"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'The DevEco Device Tool payload lives in /usr/share/deveco-devicetool/installer.' \
    'Run deveco-devicetool once to install it into /opt/Huawei/DevEco-Device-Tool' \
    'and to install the bundled VS Code extensions for the invoking user.' \
    '' \
    'The vendor installer refuses a non-empty target: remove' \
    '  /opt/Huawei/DevEco-Device-Tool' \
    'if an earlier attempt left files there.' \
    > "$pkgdir/usr/share/doc/$pkgname/README"
}
