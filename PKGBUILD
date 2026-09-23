# Maintainer: Zeus-Deus <github.commits at widow dot cc>
#
# Proton Authenticator built from Proton's official source for the release
# (ProtonMail/WebClients, branch release/proton-authenticator@<version>) with
# one reviewable patch, omarchy-helper.patch, that adds a private local socket
# so the Omarchy panel plugin can show and copy codes. Login, keys, encryption
# and sync are Proton's code, unchanged. See the patch header in the plugin repo
# README ("How it works") for exactly what it changes.

pkgname=proton-authenticator-omarchy-helper
_protonver=1.1.6
_patchrev=5
pkgver=${_protonver}.omarchy${_patchrev}
pkgrel=1
pkgdesc='Proton Authenticator (official source + local socket) as a background helper for the Omarchy panel plugin'
arch=(x86_64)
url='https://github.com/Zeus-Deus/proton-authenticator-omarchy-plugin'
license=(GPL-3.0-or-later)
depends=(cairo
         dbus
         gdk-pixbuf2
         glib2
         glibc
         gtk3
         libgcc
         libsoup3
         webkit2gtk-4.1
         wl-clipboard)
makedepends=(cargo)
install=$pkgname.install
# Same app identifier, data directory, keyring entry and single-instance D-Bus
# name as Proton's own Linux app: the two cannot run side by side.
conflicts=(proton-authenticator proton-authenticator-bin proton-authenticator-git)
options=(!lto !debug)

# Proton's release-branch head for 1.1.6 ("Bump Authenticator to 1.1.6").
_protoncommit=0deabe38e304f5d42d6a72783c64c1884c17fce3
# Commit of the patched tree in the reviewable fork; embedded in the binary and
# reported by the helper so anyone can check what is running.
_patchcommit=5a417199bc791bfdad27db290153c763da5182ab
# Proton's workspace requires Node ">= 22.14.0 <23.6.0". Arch's Node 22 package
# (nodejs-lts-jod) conflicts with the system nodejs, which would make a one-press
# install fail, so the build uses the official Node 22 release tarball instead.
_nodever=22.23.2

source=("WebClients-${_protoncommit}.tar.gz::https://github.com/ProtonMail/WebClients/archive/${_protoncommit}.tar.gz"
        "https://nodejs.org/dist/v${_nodever}/node-v${_nodever}-linux-x64.tar.xz"
        omarchy-helper.patch
        proton-authenticator-omarchy-helper.service
        proton-authenticator-omarchy-helper.lua)
sha256sums=('80848edca68c31d97fde946748a0b6c21ed851de80b57f26d8534b4b493ac323'
            'd60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307'
            '65c73c916943d1c56d5254d8fdfae7c2e56b73c2e35b0fb5412950a3849673d0'
            '99ab8010bd72b87dc3accda25b08ace2551578f6c16815f4ed61857fa5b07f41'
            '53e424d7bf68cc102dd8595e3dea92a1dd51f5a9a46d499ac7cf1df14ba89e92')

_srcroot() { printf '%s/WebClients-%s' "$srcdir" "$_protoncommit"; }

prepare() {
    cd "$(_srcroot)"
    patch -Np1 -i "$srcdir/omarchy-helper.patch"

    export PATH="$srcdir/node-v${_nodever}-linux-x64/bin:$PATH"
    # Install only the authenticator workspace and what it depends on.
    sed -i 's/"applications\/\*",/"applications\/authenticator",/' package.json
    # sharp is a transitive dependency the authenticator build never uses.
    sed -i '1a\    "dependenciesMeta": { "sharp": { "built": false } },' package.json

    export YARN_CACHE_FOLDER="$srcdir/.yarn-cache"
    export YARN_ENABLE_TELEMETRY=0
    export SENTRYCLI_SKIP_DOWNLOAD=1
    # Narrowing the workspace list prunes yarn.lock, so an --immutable install
    # would refuse. Instead, prove afterwards that the pruned lock resolves only
    # package versions and checksums already pinned in Proton's own yarn.lock.
    cp yarn.lock "$srcdir/yarn.lock.proton"
    node "$(sed -n 's/^yarnPath: *//p' .yarnrc.yml)" install
    node - "$srcdir/yarn.lock.proton" yarn.lock <<'EOF'
const fs = require('fs');
const read = (p) => {
  const out = new Map(); let cur = null;
  for (const line of fs.readFileSync(p, 'utf8').split('\n')) {
    let m = line.match(/^\s+resolution: "?(.*?)"?$/);
    if (m) { cur = m[1]; out.set(cur, null); continue; }
    m = line.match(/^\s+checksum: (.*)$/);
    if (m && cur) out.set(cur, m[1].trim());
  }
  return out;
};
const pinned = read(process.argv[2]);
const used = read(process.argv[3]);
const bad = [...used].filter(([r, sum]) => !pinned.has(r) || pinned.get(r) !== sum);
if (bad.length) {
  console.error('yarn resolved packages not pinned by Proton:', bad.map(([r]) => r).join(', '));
  process.exit(1);
}
console.log(`${used.size} yarn resolutions, all pinned by Proton's yarn.lock`);
EOF

    cd applications/authenticator/src-tauri
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$(_srcroot)/applications/authenticator"
    export PATH="$srcdir/node-v${_nodever}-linux-x64/bin:$PATH"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # ring's C objects need fat LTO objects when makepkg's CFLAGS enable LTO.
    export CFLAGS="${CFLAGS} -ffat-lto-objects"
    export CXXFLAGS="${CXXFLAGS} -ffat-lto-objects"
    export OMARCHY_HELPER_SOURCE_COMMIT="$_patchcommit"
    # QA_BUILD=false, no devtools, no source maps; verifies the artifact.
    CARGO_TARGET_DIR="$PWD/target" bash tools/build-omarchy-helper.sh
}

check() {
    cd "$(_srcroot)/applications/authenticator"
    export PATH="$srcdir/node-v${_nodever}-linux-x64/bin:$PATH"
    node --test tools/verify-omarchy-helper-build.spec.mjs
}

package() {
    cd "$(_srcroot)/applications/authenticator"
    install -Dm755 target/release/proton-authenticator \
        "$pkgdir/usr/bin/proton-authenticator-omarchy-helper"
    install -Dm644 "$srcdir/proton-authenticator-omarchy-helper.service" \
        -t "$pkgdir/usr/lib/systemd/user"
    # Omarchy loads every file in this directory as a window rule (floating,
    # centered, hidden from screen sharing), like its other password managers.
    install -Dm644 "$srcdir/proton-authenticator-omarchy-helper.lua" \
        -t "$pkgdir/usr/share/omarchy/default/hypr/apps"
    install -Dm644 ../../LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$srcdir/omarchy-helper.patch" -t "$pkgdir/usr/share/doc/$pkgname"
}
