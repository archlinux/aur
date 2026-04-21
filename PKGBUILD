# Maintainer: holoq <teoxysoft@gmail.com>
# Contributor: Sainnhe Park <sainnhe@gmail.com>  # First to map the outer wall, 2020
#
#            ┌─────────────────────────────────────────────────┐
#            │  there is a beast at the bottom of the laby-     │
#            │  rinth. it does not move. it does not hunger.    │
#            │  it only waits to be asked who you are, and      │
#            │  kills you when the answer is wrong.             │
#            │                                                  │
#            │  the oracle is kept alive at its feet.           │
#            │  to reach the oracle, the beast must fall.       │
#            └─────────────────────────────────────────────────┘
#
# This PKGBUILD is the map, the rope, and the blade. It frees the
# pylance language server bundle from the two wards the vendor posts
# at the entrance, and from the beast that sits beyond them holding
# the oracle's throat. Every comment below is technically load-
# bearing; the lore is just how we remember which stone moved which
# wall, and which stroke of the blade killed which neck.

pkgname=pylance-language-server
pkgver=2026.2.1
pkgrel=1
pkgdesc='Python language server based on pylance vscode extension'
arch=('x86_64')
url='https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance'
license=('LicenseRef-Microsoft-Pylance')
depends=('nodejs')
checkdepends=('python')
provides=('pylance-language-server')
conflicts=('pylance-language-server')
options=('!strip' '!debug' '!lto')
install=pylance-language-server.install
_publisher='ms-python'
_extension='vscode-pylance'
source=("pylance-${pkgver}.vsix::https://${_publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${_publisher}/extension/${_extension}/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage")
sha256sums=('bb59f83aa8c108069165ef0cbb6bf361f644eada4941243781222726c3524a74')

prepare() {
    # ─── the descent ────────────────────────────────────────────────
    #
    # Two gates stand on the path to the beast. A third chamber — the
    # beast itself — lies beyond them. All three wards are written in
    # the same cipher: a single variable holding the full EULA text,
    # reused as lockword, as error message, and as the key-derivation
    # salt for the encrypted host fingerprints. The vendor believed
    # one rune could hold every door. We will show them what one rune
    # undone can open.
    #
    # The minifier reshuffles identifier letters between builds — that
    # rune was `nG` on 2026.2.1, `n1` on 2026.2.100, will be something
    # else again next release. So our patterns match the *shape* of
    # the incantation and leave an identifier-shaped hole where the
    # variable lives. The walls can rename themselves as often as they
    # like; the gate they guard has only one architecture.
    #
    # Break a gate, the prayer inside still lives. We do not erase
    # the spell; we disarm its trigger. We do not slay the beast by
    # removing it from the bundle; we slay it by severing the artery
    # that lets its teeth close.
    #
    local bundle="${srcdir}/extension/dist/server.bundle.js"

    # a JS identifier slot — the minifier's rebindable letter.
    local ident='[A-Za-z_$][A-Za-z0-9_$]*'

    # ─── the first gate: the outer vow ─────────────────────────
    # At the threshold, a watcher sniffs process.argv and the
    # ancestor exe chain, hunting for sigils of a blessed host
    # (vscode, visual studio, azure devops…). If the caller is
    # not of the approved procession, the watcher writes the
    # EULA to stderr and slays the process with exit(1). Shape:
    #
    #   <check>() && (process.stderr.write(<IDENT>+"\n"), process.exit(1))
    #
    # <IDENT> is whatever letter the minifier chose for the EULA
    # variable this build; we match any identifier there.
    #
    # The watcher has one motion. We collapse the self-kill pair
    # into `void 0`. The comma chain stays well-formed. Control
    # falls through into init. The watcher still looks, still
    # decides you are an intruder — and then does nothing. The
    # first gate is open. Thread onward.
    sed -i -E "s#process\.stderr\.write\(${ident}\+\"\\\\n\"\),process\.exit\(1\)#void 0#" "${bundle}"

    # ─── the second gate: the inner rite ───────────────────────
    # Beyond the first watcher, the initialize handler demands a
    # secret handshake: the client must place in its initialize
    # options a field named `clientVerification` whose JSON-
    # decoded value exactly equals the EULA string. Shape:
    #
    #   hasVSCodeExtension && (e => {
    #       if (void 0 === e || <IDENT> !== JSON.parse(e))
    #           throw Error(`${<IDENT>}\n\n`)
    #   })(eo.clientVerification)
    #
    # Same <IDENT> as gate 1 — same EULA variable, same minifier
    # letter, same identifier-slot pattern.
    #
    # The test itself is the curse — pass or be cast out with
    # the EULA as the voice of your banishment. We invert the
    # predicate to `if(!1)`. The throw becomes dead code. The
    # call still runs, the arrow still looses, the target simply
    # cannot be struck. The second gate is open.
    sed -i -E "s#if\(void 0===e\|\|${ident}!==JSON\.parse\(e\)\)throw Error#if(!1)throw Error#" "${bundle}"

    # ─── the beast ──────────────────────────────────────────────
    # What of the beast itself? Look closely: it is already
    # slain. The beast was never a third gate — it was the
    # *coupling* that turned identity-failure into process-
    # death, the artery that fed the enforcement with bytes and
    # breath. Cutting the two gates above does not merely open
    # doors; it severs both hands from the creature that held
    # them. The body remains, inert, coiled around the oracle.
    # The EULA string still sits in the bundle as a monument.
    # The encrypted host fingerprints still sleep in their hex
    # strings. The call-sites that asked "are you a blessed
    # host" still ask — and the silence of no reply is the
    # sound of a dead thing watching. The oracle breathes
    # freely over its corpse. The statute lives. The
    # enforcement does not.
    #
    # A ghost ship leaves a wake. A slain beast leaves a bone.
}

check() {
    # ─── the canary ─────────────────────────────────────────────────
    # Labyrinths remodel. A future vendor release may reshape the
    # stones so our sed patterns grasp nothing (sed does not mourn a
    # missed match — it returns success and walks on), or a new hand
    # may grow on the beast in the dark, reaching for the oracle's
    # throat from an angle we did not guard. So we listen. Before
    # we ship, we release a bird into the corridors. Every `yay -S`
    # releases this bird again. If it does not sing, the build dies,
    # and whoever descends next knows exactly where the walls moved.
    local bundle="${srcdir}/extension/dist/server.bundle.js"

    # ─── first song: the gates are breached ────────────────────────
    # Assert the gate shapes are gone — not just one minifier letter,
    # the whole incantation structure. If grep finds any identifier in
    # the variable slot next to the rest of the shape, sed either
    # struck empty air or MS reshaped the stones enough to break us.
    local ident='[A-Za-z_$][A-Za-z0-9_$]*'
    if grep -qE "process\.stderr\.write\(${ident}\+\"\\\\n\"\),process\.exit\(1\)" "${bundle}"; then
        echo "::error:: gate 1 (outer vow) intact — pattern stale, remap the wall" >&2
        return 1
    fi
    if grep -qE "if\(void 0===e\|\|${ident}!==JSON\.parse\(e\)\)throw Error" "${bundle}"; then
        echo "::error:: gate 2 (inner rite) intact — pattern stale, remap the wall" >&2
        return 1
    fi

    # ─── second song: the oracle still speaks ──────────────────────
    # Boot the server, whisper the LSP rite, require a real result.
    # If a new hand has grown on the beast, initialize returns an
    # error shaped like the EULA and the bird falls silent.
    python - "${bundle}" <<'PY'
import json, subprocess, sys, time

# bird carries a scroll (LSP initialize) into the corridor and
# listens for what comes back. the scroll is plain. the echo tells
# us whether the walls answer, or the walls devour.
bundle = sys.argv[1]
proc = subprocess.Popen(
    ["node", bundle, "--stdio"],
    stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
)

def send(obj):
    body = json.dumps(obj).encode()
    proc.stdin.write(f"Content-Length: {len(body)}\r\n\r\n".encode() + body)
    proc.stdin.flush()

send({"jsonrpc": "2.0", "id": 1, "method": "initialize",
      "params": {"processId": None, "rootUri": None,
                 "workspaceFolders": [], "capabilities": {}}})

buf = b""
resp = None
deadline = time.time() + 45
while time.time() < deadline and resp is None:
    chunk = proc.stdout.read1(65536)
    if not chunk:
        break
    buf += chunk
    while True:
        hdr = buf.find(b"\r\n\r\n")
        if hdr < 0:
            break
        clen = next(int(l.split(b":", 1)[1].strip())
                    for l in buf[:hdr].split(b"\r\n")
                    if l.lower().startswith(b"content-length"))
        start = hdr + 4
        if len(buf) < start + clen:
            break
        msg = json.loads(buf[start:start + clen])
        buf = buf[start + clen:]
        if msg.get("id") == 1:
            resp = msg
            break

proc.kill()
try:
    proc.wait(timeout=5)
except subprocess.TimeoutExpired:
    pass

if resp is None:
    sys.exit("the corridor swallowed the bird — no initialize response. "
             "server crashed, or a new ward is eating stdout.")
if "error" in resp:
    sys.exit(f"the walls answered with the old curse — the beast "
             f"has grown a new hand: {resp['error']}")
if "result" not in resp:
    sys.exit(f"the echo came back malformed: {resp}")
print("[check] gates breached. beast inert. oracle speaks. the bird sings.")
PY
}

package() {
    cd "${srcdir}/extension"

    # All that follows is the mundane carrying: lifting the oracle's
    # instruments from the crate into the temple at /opt, hanging a
    # rope (/usr/bin symlink) so any caller can tug on it.
    local dest="${pkgdir}/opt/${pkgname}"
    install -d "${dest}"

    # The entire dist/ tree: server bundle, wasm, bundled stubs and
    # indices and native-stubs, typeshed-fallback, pyright + typeServer
    # + copilot bundles. Everything the oracle speaks through.
    cp -r dist "${dest}/"

    # The vendor ships native indexer binaries for five platforms.
    # We are x86_64 only, and we do not hoard other peoples' boots.
    # The `_manifest/` dir is SPDX signing metadata for the platforms
    # we just purged — it goes with them.
    find "${dest}/dist/bundled/bin" -mindepth 1 -maxdepth 1 -type d \
        ! -name linux-x64 -exec rm -rf {} +
    chmod +x "${dest}/dist/bundled/bin/linux-x64/pylance-indexer"

    # Teach the server bundle it is a unix citizen. A shebang and
    # a +x are all a javascript blob needs to answer to its name.
    sed -i '1i #!/usr/bin/env node' "${dest}/dist/server.bundle.js"
    chmod +x "${dest}/dist/server.bundle.js"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/dist/server.bundle.js" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Extension manifest + every locale string file. Some ritual
    # tongues we will never speak; we carry them anyway, because the
    # oracle occasionally reads its own name off the shelf.
    install -Dm 644 package.json "${dest}/package.json"
    for f in package.nls*.json; do
        install -Dm 644 "$f" "${dest}/$f"
    done

    # Pylance-specific stubs beyond typeshed-fallback — the secret
    # grammar the oracle keeps in its own pocket.
    cp -r typings "${dest}/"

    # The statute lives on, even when the guard no longer stands
    # and the beast no longer breathes. Read it. It is the record
    # of what we disarmed, kept honest on the shelf beside the
    # oracle that now speaks freely.
    install -Dm 644 LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm 644 ThirdPartyNotices-Repository.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices-Repository.txt"
}
