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
# The package acts as the installer: it runs the vendored install.py under
# python3.9 into $pkgdir/opt (offline, --all-in-one 0), relocates the venv paths
# from the build directory to /opt, and unpacks the bundled VS Code extensions
# system-wide instead of shelling out to 'code'.
pkgname=deveco-devicetool
pkgver=4.0.0.400
pkgrel=10
pkgdesc='HUAWEI DevEco Device Tool for OpenHarmony device development (VS Code toolchain bundle)'
arch=('x86_64')
url='https://device.harmonyos.com/cn/develop/ide/'
license=('LicenseRef-Huawei-EULA')
depends=('python39' 'unzip')
makedepends=('python39')
optdepends=('code: IDE that loads the bundled DevEco Device Tool extensions')
options=('!strip')
source=()
sha256sums=()

_zip_glob=devicetool-linux-tool-*.zip
_root=opt/Huawei/DevEco-Device-Tool

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
      curl -fL --retry 3 -o "$f" "$DEVECO_DEVICETOOL_URL" || { error "download failed"; return 1; }
    else
      error "No DevEco Device Tool archive found."
      error "  Download the Linux build from https://device.harmonyos.com/cn/develop/ide"
      error "  then run: DEVECO_DEVICETOOL_URL='<signed url>' makepkg -si"
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
}

build() {
  cd "$srcdir/extracted"
  if [[ -d "$srcdir/stage" ]]; then
    chmod -R u+rwX "$srcdir/stage" 2>/dev/null || true
    rm -rf "$srcdir/stage"
  fi
  rm -rf "$srcdir/fakehome"
  mkdir -p "$srcdir/fakehome"
  python3.9 install.py \
    --install-path "$srcdir/stage" \
    --home-dir "$srcdir/fakehome" \
    --json-path "$srcdir/fakehome/settings.json" \
    --py-version 3.9 --all-in-one 0
}

package() {
  install -d "$pkgdir/$_root"
  cp -r --no-preserve=ownership "$srcdir/stage/." "$pkgdir/$_root/"

  # install.py applies umask 027 and its own 0750/0640 table, which leaves the
  # tree root-only and unusable for normal users. Flatten everything to 0755.
  find "$pkgdir/$_root" \( -type f -o -type d \) -exec chmod 755 {} +

  # The venv and helper scripts bake in the staging path; rewrite it to the
  # final location so the tree is relocatable.
  local staged="$srcdir/stage" final="/$_root"
  grep -rIl "$staged" "$pkgdir/$_root" 2>/dev/null | while read -r f; do
    sed -i "s|${staged}|${final}|g" "$f"
  done

  # VS Code extensions: unpack system-wide instead of running 'code'
  install -d "$pkgdir/usr/lib/code/extensions"
  local vsix name ver dir
  for vsix in "$srcdir/extracted/"*.vsix; do
    name=$(bsdtar -xOf "$vsix" extension/package.json 2>/dev/null |
      python3 -c 'import json,sys; d=json.load(sys.stdin); print(d.get("publisher","")+"."+d.get("name",""))')
    ver=$(bsdtar -xOf "$vsix" extension/package.json 2>/dev/null |
      python3 -c 'import json,sys; print(json.load(sys.stdin).get("version",""))')
    if [[ -z "$name" || -z "$ver" ]]; then
      warning "cannot read identity from $(basename "$vsix"), skipping"
      continue
    fi
    dir="$pkgdir/usr/lib/code/extensions/${name}-${ver}"
    tmpdir=$(mktemp -d)
    unzip -q "$vsix" -d "$tmpdir"
    install -d "$dir"
    cp -r --no-preserve=ownership "$tmpdir/extension/." "$dir/"
    rm -rf "$tmpdir"
  done

  find "$pkgdir/usr/lib/code/extensions" \( -type f -o -type d \) -exec chmod 755 {} + 2>/dev/null || true

  install -d "$pkgdir/usr/lib/udev/rules.d"
  install -m644 "$srcdir/extracted"/*.rules "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 "$srcdir/extracted/privacy_statement.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"

  install -d "$pkgdir/usr/share/doc/$pkgname"
  printf '%s\n' \
    'DevEco Device Tool is installed under /opt/Huawei/DevEco-Device-Tool.' \
    'VS Code extensions are unpacked into /usr/lib/code/extensions.' \
    'See /opt/Huawei/DevEco-Device-Tool/core/setenv.sh for the runtime env.' \
    > "$pkgdir/usr/share/doc/$pkgname/README"
}
