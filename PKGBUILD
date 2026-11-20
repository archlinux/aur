# Maintainer: LIghtJUNction
# SPDX-License-Identifier: MIT
pkgname=zmcl-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='A small native Minecraft launcher built on Project Z (development preview)'
arch=('x86_64')
url='https://github.com/LIghtJUNction/zmcl'
license=('MIT')
depends=('glibc>=2.39' 'libgcc' 'libx11' 'freetype2' 'fontconfig>=2.17.0' 'hicolor-icon-theme' 'curl' 'python>=3.8')
optdepends=(
  'libsecret: Store Microsoft account tokens using a desktop Secret Service'
  'java-runtime: Use an existing Java runtime instead of downloading a managed runtime'
  'openssl: Verify official Horizon launcher signatures'
  'xorg-xwayland: Run the native X11 GUI in a Wayland session'
  'ttf-font: Render the native GUI text'
)
provides=("zmcl=$pkgver")
conflicts=('zmcl')
options=('!strip' '!debug')
source=(
  "zmcl-$pkgver-linux-$CARCH.tar.gz::$url/releases/download/v$pkgver/zmcl-$pkgver-linux-$CARCH.tar.gz"
  'zmcl.desktop'
)
sha256sums=(
  '8265e672ef7914362c1038b71ed382d18efafe49668d7791005713faa5f580f1'
  '62d26944cd3c4aaaf2dd68668332527883b02bca734c893b510996ba19589082'
)

package() {
  cd "zmcl-$pkgver-linux-$CARCH"
  install -Dm755 zmcl "$pkgdir/usr/bin/zmcl"
  install -Dm644 assets/zmcl.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/zmcl.svg"
  install -Dm644 "$srcdir/zmcl.desktop" "$pkgdir/usr/share/applications/zmcl.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zmcl/README.md"
  install -Dm644 release.json "$pkgdir/usr/share/doc/zmcl/release.json"
  install -Dm644 docs/FEATURES.md "$pkgdir/usr/share/doc/zmcl/FEATURES.md"
  # Keep the official portable release metadata unchanged. Only the installed
  # distribution hint changes to reflect ownership by the Arch package manager.
  python - "$pkgver" "$pkgdir/usr/share/zmcl/distribution.json" <<'PY'
import hashlib
import json
from pathlib import Path
import re
import sys

version, destination = sys.argv[1], Path(sys.argv[2])
source = Path("share/zmcl/distribution.json")
if not source.is_file() or source.is_symlink() or source.stat().st_size > 8192:
    raise SystemExit("Missing or invalid portable distribution marker")
body = source.read_bytes()
marker = json.loads(body)
release = json.loads(Path("release.json").read_text(encoding="utf-8"))
fields = {"schema", "application", "version", "format", "packager",
          "packager_version", "packager_commit", "release_url"}
if (not isinstance(marker, dict) or set(marker) != fields
        or type(marker["schema"]) is not int or marker["schema"] != 1
        or marker["application"] != "zmcl" or marker["format"] != "portable"
        or marker["packager"] != "zdistro"
        or marker["version"] != version or release.get("version") != version
        or marker["release_url"] != "https://github.com/LIghtJUNction/zmcl/releases/tag/v" + version
        or not isinstance(marker["packager_version"], str)
        or re.fullmatch(r"[0-9]+\.[0-9]+\.[0-9]+(?:[-+][A-Za-z0-9.-]+)?", marker["packager_version"]) is None
        or not isinstance(marker["packager_commit"], str)
        or re.fullmatch(r"[0-9a-f]{40}|[0-9a-f]{64}", marker["packager_commit"]) is None
        or release.get("distribution") != marker):
    raise SystemExit("Portable distribution metadata does not match this package")
record = [entry for entry in release.get("files", [])
          if entry.get("path") == "share/zmcl/distribution.json"]
if (len(record) != 1 or record[0].get("bytes") != len(body)
        or record[0].get("sha256") != hashlib.sha256(body).hexdigest()):
    raise SystemExit("Portable marker digest differs from release.json")
marker["format"] = "arch"
destination.parent.mkdir(parents=True, exist_ok=True)
destination.write_text(json.dumps(marker, ensure_ascii=False, indent=2, sort_keys=True) + "\n",
                       encoding="utf-8")
destination.chmod(0o644)
PY
}
