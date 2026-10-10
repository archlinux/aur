# Maintainer: Bin Jin <bjin@protonmail.com>

pkgname=oh-my-pi-grammars-bin
_grammar_release=1
pkgver=${_grammar_release}
pkgrel=1
pkgdesc="Prebuilt WebAssembly tree-sitter grammars for oh-my-pi"
arch=('any')
url="https://github.com/stencil-hq/wasm-grammars"
license=('MIT' 'Apache-2.0')
# compression.zstd joined the Python standard library in 3.14.
makedepends=('python>=3.14')
options=('!strip')
source=(
    "manifest-v${_grammar_release}.json::${url}/releases/download/v${_grammar_release}/manifest.json"
    "THIRD-PARTY-NOTICES-v${_grammar_release}.txt::${url}/releases/download/v${_grammar_release}/THIRD-PARTY-NOTICES.txt"
)
sha256sums=('3a2539de2f48b28569aa02e4023398a97ad3806e6a7e1891fba3be76a0288a1d'
            '104b20b8919282e7b559cbe68c55b50bffd18ec0ffeb2f51b9881065ad584c8d')

prepare() {
    # The checksum-pinned manifest is the sole registry. Fetch here so
    # package() is offline; discard old outputs if the manifest changes.
    rm -rf "${srcdir}/grammars"
    python - "${srcdir}/manifest-v${_grammar_release}.json" "${_grammar_release}" "${srcdir}/grammars" <<'PY'
from compression import zstd
import hashlib
import json
from pathlib import Path
import sys
from urllib.request import urlopen

manifest_path, release, destination = sys.argv[1:]
with open(manifest_path) as source:
    manifest = json.load(source)
if manifest["release"] != f"v{release}":
    sys.exit(f"Grammar manifest release mismatch: expected v{release}, got {manifest['release']}")

base = f"https://github.com/stencil-hq/wasm-grammars/releases/download/{manifest['release']}"
destination = Path(destination)
destination.mkdir()
for grammar in manifest["grammars"]:
    filename = grammar["file"]
    print(f"Fetching {manifest['release']}/{filename}.zst", flush=True)
    with urlopen(f"{base}/{filename}.zst") as response:
        data = zstd.decompress(response.read())
    if len(data) != grammar["size"] or hashlib.sha256(data).hexdigest() != grammar["sha256"]:
        sys.exit(f"Grammar size or SHA-256 mismatch: {filename}")
    (destination / filename).write_bytes(data)
print(f"Verified {len(manifest['grammars'])} grammars from {manifest['release']}")
PY
}

package() {
    install -dm755 "${pkgdir}/usr/share/oh-my-pi/grammars"
    install -m644 "${srcdir}/grammars/"*.wasm \
        "${pkgdir}/usr/share/oh-my-pi/grammars/"
    install -Dm644 "${srcdir}/THIRD-PARTY-NOTICES-v${_grammar_release}.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.txt"
}
