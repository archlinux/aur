# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pi-ext-lens
pkgver=4.5.3
pkgrel=1
pkgdesc='Real-time code feedback for the Pi coding agent: language servers, linters, formatters'
arch=('x86_64')
url='https://github.com/apmantza/pi-lens'
license=('MIT')
depends=('ast-grep')
makedepends=('npm')
install="${pkgname}.install"
# The extension carries @ast-grep/napi's prebuilt addon, which package() prunes to
# linux-x64, so the package is architecture-bound rather than arch-independent.
# Nothing here is compiled, and the addon ships already stripped, so a debug split
# could only hold a debuglink stub for somebody else's binary.
options=('!debug')

_pi_pkgroot=/usr/share/pi/extensions
_piname=pi-lens
_npmname=pi-lens

source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
sha256sums=('54891b2b387bceeaaa4a751d6ecab51c9742fd9f311053ec8f7f835329bcabbd')

latestver() {
  curl -fsSL "https://registry.npmjs.org/${_npmname}/latest" | jq -r '.version'
}

prepare() {
  cd "${srcdir}/package"
  # @ast-grep/napi ships its binary as a platform optionalDependency, so the
  # matching one is resolved here and the rest are pruned in package().
  npm install --omit=dev --omit=peer --ignore-scripts --no-audit --no-fund

  # The tarball bundles only a core subset of tree-sitter grammars and the runtime
  # fetches the rest at first use into a directory inside its own node_modules —
  # root-owned here, so every language outside that subset would fail with EACCES
  # and retry forever. Completing the set at build time removes the fetch: the
  # runtime reads <package>/grammars before it ever tries one.
  #
  # Which grammars and which bytes are decided by scripts/grammars.lock.json,
  # shipped in the tarball, so nothing about the set is restated here. The
  # downloader verifies every file against that manifest before writing it — but
  # it reports failures as warnings and exits 0 ("tree-sitter is optional"), so
  # the assertion in package() is what turns a blocked or truncated download into
  # a failed build.
  node scripts/download-grammars.js --dest grammars
}

package() {
  install -dm755 "${pkgdir}${_pi_pkgroot}"
  cp -a --no-preserve=ownership "${srcdir}/package" "${pkgdir}${_pi_pkgroot}/${_piname}"
  rm -f "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/.package-lock.json"
  # The CLI ships as per-platform packages of ~52 MiB each. pi-lens falls back to
  # an `ast-grep` on PATH, and depends=() supplies exactly the version it pins
  # (0.51.1), so the bundled copy is dropped. The in-process @ast-grep/napi addon
  # has no packaged equivalent and is kept, platform-pruned.
  rm -rf "${pkgdir}${_pi_pkgroot}/${_piname}"/node_modules/@ast-grep/cli-*
  find "${pkgdir}${_pi_pkgroot}/${_piname}/node_modules/@ast-grep" -maxdepth 1 \
    -name 'napi-*' ! -name "napi-linux-x64-*" -exec rm -rf {} + 2>/dev/null || true
  install -Dm644 "${srcdir}/package/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Prove the shipped grammar set is the pinned one, and that it covers what the
  # runtime can ask for. The runtime silently degrades on a missing grammar and
  # rejects a mismatched one as stale, so all three have to fail the build: every
  # grammar the manifest names must be present and hash to the manifest's value,
  # the two built-from-source grammars are checked against the hashes the manifest
  # records for them, and every grammar the shipped language map names must exist.
  node -e '
const fs = require("fs"), path = require("path"), crypto = require("crypto");
const root = process.argv[1];
const manifest = JSON.parse(fs.readFileSync(path.join(root, "scripts/grammars.lock.json"), "utf8"));
const bundled = path.join(root, "grammars");
const vendored = path.join(root, "vendor", "grammars");
const sha256 = (file) => "sha256:" + crypto.createHash("sha256").update(fs.readFileSync(file)).digest("hex");
const failures = [];
const verify = (grammar, pinned) => {
  const file = [path.join(bundled, grammar), path.join(vendored, grammar)].find((f) => fs.existsSync(f));
  if (!file) { failures.push(`${grammar}: absent from grammars/ and vendor/grammars`); return; }
  const actual = sha256(file);
  if (actual !== pinned) failures.push(`${file}: ${actual} but the manifest pins ${pinned}`);
};
for (const [grammar, pinned] of Object.entries(manifest.grammars)) {
  verify(grammar, pinned);
}
for (const [grammar, meta] of Object.entries(manifest.vendored)) {
  verify(grammar, meta.sha256);
}
// The manifest is not the whole story: it is only what the downloader fetches.
// The runtime asks for grammars by its own language map, so a release that adds a
// language there without adding it to the manifest would reintroduce the fetch on
// first use of that language. Read the map out of the shipped bundle and require
// every grammar it names.
const distDir = path.join(root, "dist");
let mapped;
const distFiles = fs.existsSync(distDir) ? fs.readdirSync(distDir).filter((f) => f.endsWith(".js")) : [];
for (const file of distFiles) {
  const block = fs.readFileSync(path.join(distDir, file), "utf8")
    .match(/LANGUAGE_TO_GRAMMAR\s*=\s*(\{[\s\S]*?\});/);
  if (block) { mapped = [...new Set([...block[1].matchAll(/"[^"]+\.wasm"/g)].map((m) => m[0].slice(1, -1)))]; break; }
}
if (!mapped) {
  failures.push("could not read LANGUAGE_TO_GRAMMAR out of dist/ — the runtime language map moved or dist/ is absent, so nothing here proves a session can find its grammars");
} else {
  for (const grammar of mapped) {
    if (!fs.existsSync(path.join(bundled, grammar)) && !fs.existsSync(path.join(vendored, grammar)))
      failures.push(`${grammar}: a language maps to it in dist/ but it is not installed — a session would fetch it at runtime and fail`);
  }
}
if (failures.length > 0) { console.error(failures.join("\n")); process.exit(1); }
const total = Object.keys(manifest.grammars).length + Object.keys(manifest.vendored).length;
console.log(`grammars: ${total} pinned by scripts/grammars.lock.json (tree-sitter-wasms ${manifest.version}), ${mapped.length} languages mapped by dist/, every hash matches and every mapped grammar is present`);
' "${pkgdir}${_pi_pkgroot}/${_piname}"
}
