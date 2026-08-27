# BUILD-LOG — plasticity-aur scaffold + first build attempt

Date: 2026-08-26 (Wed), ~17:33–17:45 local
Agent: Implementation Agent (scaffold + first build of `aur/`)
Workdir: `/home/madgoat/Documents/System Fix/Plasiticy Fix/aur/`

## Prerequisite check (read-only)

| tool | status |
|---|---|
| makepkg | PRESENT (`/usr/bin/makepkg`) |
| **patchelf** | **MISSING — blocking prerequisite: `sudo pacman -S patchelf`** |
| ar | PRESENT (`/usr/bin/ar`, binutils) |
| curl | PRESENT |
| sha512sum | PRESENT |
| strings | PRESENT |
| bash | PRESENT |
| jq | PRESENT (bonus; update.sh falls back to grep/sed if absent) |
| shellcheck | MISSING (V1 falls back to `bash -n` only) |

Per instructions: no sudo-install performed; makepkg build step skipped.

## Validation results

- **V1 — PASS.** `bash -n` clean on `update.sh` and `apply-loader-fix.sh` (re-checked after edits). shellcheck missing → skipped. Extra smoke tests: no-args → loud ERROR exit 1; empty tree → "libA3DLIBS.so not found … aborting" exit 1; `source` under `set -euo pipefail` → clean, function defined, no side effects.
- **V2 — PASS.** `bash -n PKGBUILD` clean; `makepkg --printsrcinfo` exit 0 (rendered PKGBUILD).
- **V3 — PASS.** `./update.sh --no-build --version 26.1.4` exit 0: fetched `plasticity_26.1.4_amd64.deb` (233.4 MiB) + `LICENSE` (7783 B), computed real sha512, canary passed, PKGBUILD rendered. See note N1 for a mid-run failure that was fixed and rerun.
- **V4 — SKIPPED (patchelf missing).** Build cannot run: loader fix needs patchelf at package() time. Guard path verified live: with `pkgver=0.0.0` injected to bypass the idempotence no-op, `./update.sh --version 26.1.4` re-canaried, re-rendered the PKGBUILD correctly, then hard-failed with exit 1 and the exact message: `ERROR: patchelf missing — the loader fix cannot be applied. Install first:  sudo pacman -S patchelf`.
- **V5 — SKIPPED.** Requires a built artifact (V4); not attempted.

## Canary patch-target list (v26.1.4, payload-relative)

lib location: `usr/lib/plasticity/resources/app/.webpack/renderer/libA3DLIBS.so`
Modules in that dir referencing `libA3DLIBS` (future `RPATH=$ORIGIN` targets):
- `pk.node`
- `libA3DLIBS.so` (self-reference; patching it is harmless)
- `libhepb.so`

## Rendered values (in PKGBUILD, real checksums)

- pkgver=26.1.4, pkgrel=1
- deb  sha512: `fa27fb296caaee755ef3ecce42f158533d7e7c28d1cceeff49240e7c2b9c4b8d143e178d01767caa415423bffa8ce584af99e12bbfc64329182a507ba950c8d0`
- lic  sha512: `1fbd6b24b4022331307ee3b8266fc6eee956238b5854633071848c145a044127f6d6eadc8c07c288c4dcd16c0de10e933ff21c5d8c715c273902cdeffded4bcd`

## Artifact proof

n/a — no build produced (V4 skipped).

## Errors verbatim (short)

1. First V3 canary attempt, exit 1:
   `xz: (stdin): File format not recognized` / `tar: Child returned status 1` /
   `ERROR: could not extract the .deb data payload (ar/tar failed) — inspect the .deb manually.`
   → see N1.
2. V4 guard (expected, by design):
   `ERROR: patchelf missing — the loader fix cannot be applied. Install first:  sudo pacman -S patchelf`

## Notes

- **N1 — local tar `-J` is broken; switched to auto-detecting `tar -xf`.** The .deb's `data.tar.zst` is valid zstd (magic `28 b5 2f fd`), but this box's GNU tar 1.35 routes `-J` to xz and fails ("File format not recognized"). `zstd -dc | tar` and plain `tar -xf` (magic auto-detect on the named file) both work. Fixed in `update.sh` (canary + artifact-proof extraction) and `PKGBUILD.template` (`tar -xf data.tar.zst -C "$pkgdir"`, same approach as the existing plasticity-bin). Semantics unchanged; portable to AUR build hosts.
- N2 — Parent docs `../BLUEPRINT.md` and `../HANDOVER.md` are referenced from the PKGBUILD header but do not exist yet (later phase).
- N3 — `aur/` state at log time: `PKGBUILD.template`, `PKGBUILD` (rendered, real checksums), `apply-loader-fix.sh` (exec), `update.sh` (exec), `README.md`, `.gitignore`, plus gitignored inputs `plasticity_26.1.4_amd64.deb` and `LICENSE` (so the next run's makepkg/canary skip re-download).
- N4 — The existing AUR package `plasticity-bin 26.1.4-1` (M0N7Y5) is verbatim-extract with no loader work → the documented SIGABRT/lock symptoms. Our package adds the `RPATH=$ORIGIN` fix in `package()` via `apply-loader-fix.sh`.
- N5 — `update.sh --test --install` is documented but inert here: no passwordless-sudo/user-session path exercised (and no artifact to install anyway).

## Next steps (exact, for the next window)

1. `sudo pacman -S patchelf` (only missing prereq).
2. Build + prove (inputs already on disk, so no re-download needed — note `--force` WOULD re-fetch 233 MB, avoid it):
   `cd "/home/madgoat/Documents/System Fix/Plasiticy Fix/aur" && rm -f PKGBUILD && ./update.sh --version 26.1.4`
   (no PKGBUILD → idempotence bypassed; .deb/LICENSE present → downloads skipped; canary → render → makepkg → artifact proof).
3. Confirm the `[proof] OK` lines show `RPATH=$ORIGIN` on pk.node / libA3DLIBS.so / libhepb.so, then `sudo pacman -U plasticity-aur-26.1.4-1-x86_64.pkg.tar.zst` and `cd .. && ./plasticity-fix.sh --verify`.

---

## V4 — BUILD + ARTIFACT PROOF (complete)

Date: 2026-08-26 (Wed), ~18:24–18:28 local
Agent: Implementation Agent (Phase 2.2 — build + artifact proof)

- **V4 — PASS.** `rm -f PKGBUILD && ./update.sh --version 26.1.4` (no `--force`; `.deb`/`LICENSE` on disk → downloads skipped) exit 0: canary → render (real sha512, identical to V3) → `makepkg -fC --skippgpcheck` → artifact proof.
- Prereqs verified: patchelf 0.19.1 (`/usr/bin/patchelf`); project volume 3.4T free.
- **Canary: exactly the expected 3 patch targets** — `pk.node`, `libA3DLIBS.so`, `libhepb.so` in `usr/lib/plasticity/resources/app/.webpack/renderer` (payload-relative).
- **Artifact:** `plasticity-aur-26.1.4-1-x86_64.pkg.tar.zst` — **284,504,367 bytes** (~271 MiB) in `aur/`; `.PKGINFO` well-formed (pkgver 26.1.4-1, arch x86_64, full dep list, `makedepend = patchelf`).
- **Script artifact proof:** `[proof] OK` with `RPATH=$ORIGIN` printed for all 3 targets. The `MISS` lines for `HEPBMP.so`, `libPolyhedralSplinesLib.so`, `libpsbodyshop.so`, `libpskernel.so` are expected — they do not string-reference `libA3DLIBS` and are deliberately left unpatched (not failures).
- **Independent re-check** (fresh temp dir `/tmp/kilo/phase22-proof`, pkg extracted via `tar -xf`, `patchelf --print-rpath` per file) — all 3 print exactly `$ORIGIN`:
  - `usr/lib/plasticity/resources/app/.webpack/renderer/pk.node` → `$ORIGIN`
  - `usr/lib/plasticity/resources/app/.webpack/renderer/libhepb.so` → `$ORIGIN`
  - `usr/lib/plasticity/resources/app/.webpack/renderer/libA3DLIBS.so` → `$ORIGIN`
- **N6 — pkg format note (pacman 7.1.0):** the built pkg stores the payload tree **flat/unexpanded** at pkg top level (`.BUILDINFO`, `.MTREE`, `.PKGINFO`, `usr/`) — there is **no nested `data.tar.zst`** in this host's package format. Verified standard by extracting a pacman-installed cached pkg (`a52dec-0.8.0-3-x86_64.pkg.tar.zst` from `/var/cache/pacman/pkg/`): identical layout, so the pkg is installable via `pacman -U`. This is why the independent re-check used the extracted tree directly (the "extract data.tar.zst" step assumed the older nested format). `update.sh`'s proof step already targets the flat layout.

## Next (unlocked by V4)

1. User-gated switch-over: remove `plasticity-bin`, install this pkg: `sudo pacman -U "aur/plasticity-aur-26.1.4-1-x86_64.pkg.tar.zst"`.
2. `cd .. && ./plasticity-fix.sh --verify`.

---

## V5 — ACCEPTANCE (complete)

Date: 2026-08-26 (Wed), ~18:40–18:55 local
Agent: QA Auditor (Phase 2.5 — post switch-over acceptance)

- **Step 2 — `./plasticity-fix.sh --verify`: PASS** (exit 0; verdict `VERIFY: PASS — main window loaded, no fatal errors, clean stop`). Decisive lines: `[2026-08-26 18:41:02.943] [info]  MAIN: Main window loaded` (main.log) + journal `Aug 26 18:41:02 madgoat plasticity[50881]: ~== Initializing Plasticity Kernel ==~`. Caveat: the transient unit inherits the user-manager env, so this run still carried the workaround `LD_LIBRARY_PATH` — hence the env-free step 3. All user-tier components (environment.d, live manager env, wrapper, bashrc rule) reported OK; zero script changes applied.
- **Step 3 — independent env-free launch: PASS.** Exact command: `env -u LD_LIBRARY_PATH -u ELECTRON_RUN_AS_NODE -u ELECTRON_NO_ATTACH_CONSOLE -u VSCODE_ESM_ENTRYPOINT -u CHROME_DESKTOP -u NODE_USE_SYSTEM_CA DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus WAYLAND_DISPLAY=wayland-0 DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/1000 XDG_SESSION_ID=2 /usr/bin/plasticity` (session-var values match the live user-manager env; the `ELECTRON_*`/`VSCODE_*`/`CHROME_DESKTOP`/`NODE_USE_SYSTEM_CA` removals strip VS Code extension-host pollution, absent from the real icon-launch env). New main.log section: `[2026-08-26 18:51:05.203] MAIN: Process starting...` → `18:51:05.332 Application version 26.1.4` → `18:51:05.335 ...Process started` → `18:51:05.384 App ready` → `18:51:06.301 RENDER: Process starting...` → `18:51:06.310 RENDER: License validity: true` → `18:51:06.561 RENDER: ... Process started` → `[2026-08-26 18:51:06.652] [info]  MAIN: Main window loaded`; renderer stderr: `~== Initializing Plasticity Kernel ==~`. pk.log unchanged (234 B, mtime 2026-08-25) → **no new SIGABRT section**. Clean stop: SIGTERM to main pid 51859 → all 7 processes gone in ~2 s, no SIGKILL; app self-cleaned its Singleton files; final `MAIN: Main window closed` on exit.
- **Two test-harness bumps, both cleared (not app defects):** (1) first env-free attempt exited instantly/silently — the verify run's stop-time SIGKILL had left a stale `SingletonLock` (holder pid dead); removed via the script's own `--clear-stuck --yes`. (2) Second attempt died instantly — `ELECTRON_RUN_AS_NODE=1` inherited from the VS Code host env makes the Electron binary run as plain node; stripped, relaunched, passed.
- **Coredumps: delta 0.** 12 total / 5 plasticity both before and after; all plasticity entries pre-date 2026-08-26.
- **New log sections clean:** no `FATAL SIGNAL`, `cannot open shared object`, `RollBack`, or `Render process gone { reason: 'crashed', exitCode: 134 }` in any main.log section after the 18:41 verify run (the last such lines remain the stale 2026-08-25 23:18 broken-package-era ones).
- **Installed-tree facts (baseline):** `pacman -Qo /usr/bin/plasticity` → `/usr/bin/plasticity is owned by plasticity-aur 26.1.4-1`; `pacman -Qi plasticity-aur` → 26.1.4-1, "official .deb + working loader fix"; installed `patchelf --print-rpath`: `pk.node` → `$ORIGIN`, `libhepb.so` → `$ORIGIN`.
- **User tier untouched:** workaround stays in place (environment.d + live manager env + wrapper + bashrc PATH rule); `~/.config/Plasticity` (license, prefs, window state, logs) read-only and intact; `RENDER: License validity: true` in both runs.
- **End state:** 0 plasticity processes; no stale Singleton files (script diagnose: 0 instances, no windowless survivor, no stale locks).

- **N7 — the Phase 2.2 'printf --' deviation was confined to the agent's own DEV_LOG state-update command (a log line beginning with '-' collides with printf option parsing); no automation script was modified.**

---

## Phase 3 — T2 depends-trim audit

Date: 2026-08-26 (Wed), ~19:05–19:20 local
Agent: Implementation Agent (Phase 3, T2 — audit + documentation only; **no PKGBUILD / PKGBUILD.template / .deb modified**)

### depends array (rendered PKGBUILD — inherited VERBATIM from plasticity-bin 26.1.4-1, BLUEPRINT §2.4)

`alsa-lib at-spi2-atk at-spi2-core atk cairo dbus desktop-file-utils expat gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm libnotify libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils` (32 entries)
`makedepends=(patchelf)` (build-time only, correct); `optdepends=(discord, apparmor, pulseaudio)` — out of trim scope.

### ldd classification summary (raw data: `/tmp/kilo/t2-ldd.txt`, 229 lines — not dumped here)

Coverage: `/usr/bin/plasticity` (→ `/usr/lib/plasticity/Plasticity`, electron main binary) + all 11 renderer payload objects (`pk.node`, `HEPBMP.so`, `libA3DLIBS.so`, `libhepb.so`, `libPolyhedralSplinesLib.so`, `libpsbodyshop.so`, `libpskernel.so`, `libcrypto.so.1.1`, `libssl.so.1.1`, `libtbbmalloc.so.2`, `libtbb.so.12`).

- **(c) unresolved: 0.** No `not found` line anywhere — the payload fully resolves on this machine. Colocated libs (`libpskernel.so`, `libhepb.so`, `libtbb.so.12`, `libPolyhedralSplinesLib.so`, and the bundled `libssl.so.1.1`→`libcrypto.so.1.1` OpenSSL-1.1 pair) resolve via the installed `RPATH=$ORIGIN` fix / same dir.
- **(a) satisfied by our depends — 24/32 entries ldd-verified** via the electron binary: `alsa-lib at-spi2-atk at-spi2-core atk cairo dbus expat gdk-pixbuf2 glib2 gtk3 libcups libdrm libx11 libxcb libxcomposite libxdamage libxext libxfixes libxkbcommon libxrandr mesa (libgbm) nspr nss pango`.
- **Not ldd-visible (by design — tools / runtime dlopen / runtime backends): 8 entries** → see ruling below.
- **GAP (payload dep NOT declared in depends): `openssl`** — `pk.node` has a direct DT_NEEDED on `libcrypto.so.3` (owned by openssl 3.6.3-1). Resolves on this box only because openssl is a hard transitive dep of curl (and thus of any working Arch system); must be **added** to depends in the dedicated trim task — this is an addition, not a trim.
- Transitive libs pulled automatically by our declared deps (e.g. `libxi`/`wayland`/`libxcursor`/`libxinerama` via gtk3; harfbuzz/freetype/fontconfig/pixman/png via cairo; libthai/fribidi/datrie/graphite2/glycin via pango; avahi/gnutls/libsystemd via libcups; tinysparql/cloudproviders/json-glib/xml2/sqlite3 via gvfs; brotli/zstd/zlib/libstdc++/glibc as std base) — no direct declaration needed.

### Ruling (DOCUMENTED ONLY — nothing applied in this task)

- **KEEP (28/32):** the 24 ldd-verified entries above, plus 4 not-ldd-visible entries with explicit rationale:
  - `desktop-file-utils` — install-time tool; provides the pacman hook that refreshes the desktop database for the shipped `.desktop`.
  - `hicolor-icon-theme` — icon theme for `Icon=plasticity` in the `.desktop` (verified present, standard).
  - `gvfs` — GIO vfs backends used at chromium/electron runtime; never a direct DT_NEEDED, so ldd cannot see it.
  - `libnotify` — **dlopen'd at runtime, confirmed by strings** on the electron binary (`shell/browser/notifications/linux/libnotify_notification.cc` + `libnotify.so` name list) — absent from static ldd by design.
  - Chromium/electron runtime class kept intact (`nss nspr atk at-spi2-* cups dbus gtk3 libxkbcommon libX* glib2 mesa pango expat alsa-lib gdk-pixbuf2`): required at chromium runtime even where static ldd evidence is partial.
- **TRIM-CANDIDATES (4/32), deferred to a dedicated trim task:** `kde-cli-tools`, `libxtst`, `trash-cli`, `xdg-utils` — tooling/helper deps inherited from the bin package; zero evidence in ldd, `strings` (no `kbuilds5`/`kwriteconfig`/`Xtst`/`xdg-open`/`xdg-settings`/`trash-put` references), or the `.desktop` file. Each requires: rebuild + reinstall + `../plasticity-fix.sh --verify` re-run (plus a runtime dlopen trace for `libxtst`) before removal.
- **RISK NOTE:** a wrong trim breaks minimal installs — a clean Arch + base + this package (no extras) must still launch the app. That is why every trim candidate above is deferred to its own dedicated task with a full rebuild + reinstall + `--verify` re-run; no PKGBUILD changes were made in T2.

### T2b — user-level shellcheck (no sudo)

- `pipx`: MISSING on this box. Prescribed fallback run verbatim: `python -m pip install --user pipx` → `/usr/bin/python: No module named pip` (rc 1; python 3.14.7, no pip module installed; the `ensurepip` bundle ships pip 26.2.1 but was **not** run — outside the prescribed path). → **shellcheck-py: UNAVAILABLE**; no escalation to sudo.
- Fallback `bash -n` (syntax only): `update.sh` SYNTAX-OK; `apply-loader-fix.sh` SYNTAX-OK; `../plasticity-fix.sh` SYNTAX-OK (reference only, not a fix target).
- Full `shellcheck -x` runs per file are deferred to the dedicated shellcheck task once system shellcheck is installed via user `pacman`.

---

## Phase 3 — T1 failure-path suite (complete)

Date: 2026-08-26 (Wed), ~19:14–19:41 local
Agent: Implementation Agent (Phase 3, T1 — failure-path test orchestrator; **no automation file modified**)
Scope: API-failure, checksum-mismatch, mid-build kill + convergence. Guard invariants: sha512 of `update.sh` / `apply-loader-fix.sh` / `PKGBUILD.template` / `README.md` / `.deb` captured pre-suite and re-verified post-suite — all identical (concurrency note: T1-N2).

### TEST A — GitHub API failure (TLS/CA simulation, least-invasive option 1)

- Method: scratch `HOME=/tmp/kilo/t1-a-home` carrying `.curlrc` with `cacert=<self-signed bogus CA>` → the API `curl -fsSL` fails deterministically at the TLS layer. No network blackhole, no sudo, no API-url override needed (script has none).
- Exit: **1** (expected 1 — fetch failure per the §3.3 contract).
- Verbatim key lines:
  `curl: (60) SSL certificate OpenSSL verify result: unable to get local issuer certificate (20)`
  `ERROR: could not query the GitHub releases API (network blocked or rate-limited).`
  `       hint: re-run with an explicit pin, e.g.  ./update.sh --version 26.1.4` — the documented escape hatch prints, as designed.
- Side effects: none — PKGBUILD sha512 unchanged before/after; `ls -la` diff of `aur/` empty.

### TEST B — checksum mismatch (corrupted/re-rolled download)

- Method: scratch dir `/tmp/kilo/t1-b` (removed after the test): `.deb` copy with 64 random bytes flipped at offset 120 000 000 (`dd conv=notrunc`; same filename, sha512 `2286dad5…` vs pinned `fa27fb29…`); `LICENSE` + `apply-loader-fix.sh` copied verbatim; scratch PKGBUILD = the real render with **only** the two `source=` entries repointed at the local copies, original `sha512sums` retained; built with `makepkg -fC --skippgpcheck` — the exact invocation update.sh uses.
- Exit: **1** — loud sha512 failure at source validation, **before** `prepare()`/`package()`: no `ar x`, no extraction, no patchelf, no artifact.
- Verbatim key lines:
  `    plasticity_26.1.4_amd64.deb ... FAILED`
  `==> ERROR: One or more files did not pass the validity check!`
  (`LICENSE ... Passed` in the same run — the gate discriminates, not blanket-fails.)
- Note: `update.sh` itself can never trip a stale pin — it recomputes checksums from the on-disk file and renders them into the PKGBUILD. The gate exercised here is makepkg's own sha512 re-verification, i.e. the gate an AUR build host runs from the committed PKGBUILD.
- **Re-pin procedure (upstream re-rolls a release):** `./update.sh --force` → re-fetches `.deb` + `LICENSE` → recomputes both sha512s → canary re-checks the payload layout → re-renders `PKGBUILD` with the new pins → rebuilds → re-proves the artifact. Never hand-edit `sha512sums`.

### TEST C — mid-build kill + convergence (re-run safety, BLUEPRINT §3.4)

- **C1 — no-op baseline (serves as A2):** `./update.sh --version 26.1.4` → exit **0**, `already at v26.1.4 — use --force to rebuild`; PKGBUILD sha512, `.pkg` size/mtime, and `ls -la` diff all unchanged — nothing modified.
- **C2 — kill mid-build:** `rm -f PKGBUILD` (the documented idempotence-bypass pattern — the file is re-rendered byte-identical by the same run), then `./update.sh --version 26.1.4` (no `--force`). Two earlier kill attempts via the tracked background runner missed the window: on this box with a warm page cache the full pipeline takes ~30 s (makepkg active ≈ last 20 s), and both completed exit 0 with full artifact proof (valid clean re-runs, not failures). Attempt 3 (launch + 50 ms polling in the same shell) caught makepkg ~2 s after launch (ps tree: `update.sh 61755 → makepkg 62001`) and killed it.
  - Kill method: **SIGTERM to the explicit update.sh process tree** (`update.sh` + its `makepkg` child; the launch shell's PGID 61750 was shared, so a bare group-kill was unsafe and would have hit the launcher). Whole tree dead in ~20 ms — **no SIGKILL needed**.
  - Exit behavior: update.sh status **143** (128+SIGTERM); the killed makepkg's own log ends `==> ERROR: TERM signal caught. Exiting...`.
  - Partial state left behind: PKGBUILD re-rendered by the killed run (byte-identical to the baseline render); **no new `.pkg`** (pre-existing artifact size/mtime untouched); `aur/src/` + `aur/pkg/` hold stale leftovers from the prior build (makepkg was killed during "Retrieving sources", before `ar x`); zero surviving processes.
- **C3 — convergence:** pre-step `rm -f PKGBUILD` again (required: the killed run had already re-rendered it, and the no-op gate — §3.1 step 2 — would otherwise exit 0 without rebuilding/re-proving; same documented bypass, and **no `--force` used**) → `./update.sh --version 26.1.4` → exit **0**: downloads skipped → checksums identical → canary (3 targets) → render (byte-identical) → makepkg → artifact proof:
  `OK   usr/lib/plasticity/resources/app/.webpack/renderer/pk.node  RPATH=$ORIGIN`
  `OK   .../libA3DLIBS.so  RPATH=$ORIGIN` · `OK   .../libhepb.so  RPATH=$ORIGIN`
  (all 3 canary targets OK; the `MISS` lines for `HEPBMP.so` / `libPolyhedralSplinesLib.so` / `libpsbodyshop.so` / `libpskernel.so` are expected — they don't reference the lib and are deliberately unpatched.)
  - Final artifact: `plasticity-aur-26.1.4-1-x86_64.pkg.tar.zst` = **284,514,223 bytes**, fresh mtime 19:40:38.
- **C4 — convergence verification:** re-hash of all 5 baseline files → **PASS** (update.sh, apply-loader-fix.sh, PKGBUILD.template, README.md, .deb); PKGBUILD is the clean render — sha512-identical to the pre-suite render, zero `/tmp/kilo` references; installed `plasticity-aur 26.1.4-1` untouched (`pacman -Qo /usr/bin/plasticity` → still owned by plasticity-aur 26.1.4-1).

### T1 notes

- **T1-N1 — build timing (warm cache):** full `update.sh` pipeline ≈ 30 s on this box with the `.deb` fully page-cached; makepkg's active window is the last ≈20 s. A mid-build kill therefore needs sub-second detection: the launch and the poll/kill loop must run in the same shell (10–30 s of inter-step latency misses the window entirely — observed twice).
- **T1-N2 — concurrent T2 activity (not T1's):** during this suite the Phase 3 T2 (depends-trim audit) agent appended its BUILD-LOG section and rewrote `README.md` (3449 → 3571 B, mtime 19:14:13). T1's first `ls` (19:03) predates that rewrite; T1's sha512 baseline was captured after it, so the baseline already carries T2's README version. T1 wrote to neither file (BUILD-LOG: append-only, per convention).
- **T1-N3 — `.pkg` size drift across rebuilds:** identical pipeline, four builds → 284,504,367 / 284,503,131 / 284,512,624 / 284,514,223 B (non-deterministic `.MTREE` mtimes + zstd threading). The `.pkg` is a build artifact, not a tracked input — its validity is proven by the artifact proof, not byte size.
- **T1-N4 — makepkg `-C` residue:** after a successful `makepkg -fC` (makepkg 7.1.0), `aur/src/` and `aur/pkg/` are left in place on this box; re-runs overwrite them in place. No confusion observed across 4 consecutive builds.

---

## Phase 3 — T3 shellcheck pass

Date: 2026-08-26 (Wed), ~20:00–20:05 MDT
Agent: Implementation Agent (Phase 3, T3 — shellcheck pass; **no PKGBUILD / PKGBUILD.template / .deb / README.md / plasticity-fix.sh modified**; no `--force`, no sudo)
Tool: shellcheck 0.11.0 (`/usr/bin/shellcheck`), `shellcheck -x`, plus `bash -n`.

### Findings by severity (before → after)

| script | error | warning | info | total |
|---|---|---|---|---|
| `update.sh` | 0 | 0 | 2 | 2 → **0** |
| `apply-loader-fix.sh` | 0 | 0 | 5 | 5 → **0** |

After: `shellcheck -x` exit 0 and `bash -n` clean on both.

### Applied fixes (6, all behavior-preserving; equivalence verified empirically before applying)

1. `update.sh` L236 — SC2016: `*'$ORIGIN'*` → `*\$ORIGIN*` (artifact-proof RPATH match). Identical literal pattern (same hit/miss verified on 3 test strings); shellcheck's suggested double quotes would expand the empty var `$ORIGIN` and break the gate.
2. `update.sh` L245 — SC2016: same, pk.node proof check.
3. `apply-loader-fix.sh` L24 — SC2317: file directive extended to `disable=SC2034,SC2317`. Dual-mode tail guard (documented in-file): sourced → `return 0` stops the source; direct exec → script-scope `return` errors (masked by `2>/dev/null || true`) so the L116 standalone entry point runs. Restructuring to satisfy the checker would change exit/entry semantics; the directive is lint-only.
4. `apply-loader-fix.sh` L68 — SC2016: `patchelf --set-rpath '$ORIGIN'` → `\$ORIGIN`. Byte-identical argv element (verified); double quotes would set an empty RPATH.
5. `apply-loader-fix.sh` L78 — SC2016: same, pk.node fallback patch.
6. `apply-loader-fix.sh` L90 — SC2016: `*'$ORIGIN'*` → `*\$ORIGIN*` (verification pass). Identical literal pattern.

### Documented exceptions

None — all 7 findings resolved by behavior-preserving fixes.

### Reference: `../plasticity-fix.sh` (report-only, zero edits)

5 findings, all info: SC2012 ×1 (L207 `ls` inside a printf hint string), SC2016 ×4 (L511, L622–L624 — deliberate literal shell snippets emitted via printf). Out of T3 scope; untouched.

### Regression gate (post-fix)

- Same-version no-op: `cd aur && ./update.sh --version 26.1.4` → exit **0**, `already at v26.1.4 — use --force to rebuild`; nothing modified.
- PKGBUILD sha512: `637517ff…ed1be9c0a9876` identical before/after (byte-identical, no-op changed nothing).
- Render identity (extra check, documented idempotence-bypass): `rm -f PKGBUILD && ./update.sh --version 26.1.4 --no-build` → exit 0; downloads skipped; checksums recompute to the same pins (deb `fa27fb29…`, lic `1fbd6b24…`); canary found the expected 3 targets; re-rendered PKGBUILD **byte-identical** to the pre-T3 render (sha512 + `cmp`).
- Source contract: `source apply-loader-fix.sh` under `set -euo pipefail` → clean, `apply_loader_fix` defined, no side effects.
- Before-state preserved: `/tmp/kilo/update.sh.before`, `/tmp/kilo/apply-loader-fix.sh.before`, `/tmp/kilo/t3-before.sha512`, `/tmp/kilo/PKGBUILD.before`.

---

## Phase 3 — T4 depends change + rebuild (26.1.4-2)

Date: 2026-08-26 (Wed), ~20:08–20:10 MDT
Agent: Implementation Agent (Phase 3, T4 — depends change + rebuild; **only `PKGBUILD.template` modified**; no `update.sh` / `apply-loader-fix.sh` / `.deb` / `README.md`; no `--force`, no sudo, no install, no app launch)

### Template diff (pristine → final; changed lines only)

Pristine copy: `/tmp/kilo/t4-template-before`.

```diff
-pkgrel=1
+pkgrel=2
-  gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme kde-cli-tools libcups libdrm
+  gdk-pixbuf2 glib2 gtk3 gvfs hicolor-icon-theme libcups libdrm
-  libxkbcommon libxrandr libxtst mesa nspr nss pango trash-cli xdg-utils)
+  libxkbcommon libxrandr mesa nspr nss openssl pango)
```

- Trimmed (4, per T2 ruling): `kde-cli-tools`, `libxtst`, `trash-cli`, `xdg-utils` (keep 28 of 32).
- Added (1): `openssl`, inserted in alphabetical position (`nss` < `openssl` < `pango`) — pk.node links `libcrypto.so.3`; a minimal install would break without it.
- `pkgrel` 1 → 2 (metadata change → new release). Result: 32 − 4 + 1 = **29 depends**.

### Rebuild

`cd aur && rm -f PKGBUILD && ./update.sh --version 26.1.4` → exit **0**.
- fetch: `.deb` + `LICENSE` already present — skipped (no `--force`); checksums unchanged (deb `fa27fb29…`, lic `1fbd6b24…`).
- canary: all 3 targets found (`pk.node`, `libA3DLIBS.so`, `libhepb.so`).
- render: PKGBUILD `pkgver=26.1.4`, `pkgrel=2`.
- proof: `OK pk.node RPATH=$ORIGIN` · `OK libA3DLIBS.so RPATH=$ORIGIN` · `OK libhepb.so RPATH=$ORIGIN` → `[proof] OK` (the `MISS` lines for `HEPBMP.so` / `libPolyhedralSplinesLib.so` / `libpsbodyshop.so` / `libpskernel.so` are expected — non-targets, deliberately unpatched).

### Artifact + .PKGINFO

- `aur/plasticity-aur-26.1.4-2-x86_64.pkg.tar.zst` = **284,512,647 bytes** (T1-N3: size drifts per build; validity is the proof, not the byte count).
- `.PKGINFO` (fresh extract, `/tmp/kilo/t4-pkginfo`): `pkgver = 26.1.4-2` (pkgver 26.1.4, pkgrel 2) ✓; **29** `depend =` entries; `openssl` present; `kde-cli-tools` / `libxtst` / `trash-cli` / `xdg-utils` absent (grep count 0 each).
- Full 29: alsa-lib, at-spi2-atk, at-spi2-core, atk, cairo, dbus, desktop-file-utils, expat, gdk-pixbuf2, glib2, gtk3, gvfs, hicolor-icon-theme, libcups, libdrm, libnotify, libx11, libxcb, libxcomposite, libxdamage, libxext, libxfixes, libxkbcommon, libxrandr, mesa, nspr, nss, openssl, pango.

### Independent rpath re-check (payload extracted to `/tmp/kilo/t4-payload`)

- `pk.node`: `$ORIGIN` · `libhepb.so`: `$ORIGIN` · `libA3DLIBS.so`: `$ORIGIN` — all exactly `$ORIGIN`. ✓

### State

**Not installed** (user-gated). Next: `sudo pacman -U "…/aur/plasticity-aur-26.1.4-2-x86_64.pkg.tar.zst"`, then `./plasticity-fix.sh --verify`.

---

## Phase 3 — T5: -2 re-verify + phase close (complete)

Date: 2026-08-26 (Wed), ~20:21–20:31 MDT
Agent: QA Auditor (Phase 3, T5 — re-verify of 26.1.4-2 + phase close; no sudo; no automation-script/README edits; app left not running)

### Baseline (before launches)

- Coredumps on record: **5** plasticity (all 2026-08-25, pre-fix era: 3× SIGABRT + 2× SIGTRAP).
- `main.log` 9 668 B, last line `[2026-08-26 18:58:17.696] [info] MAIN: Window all closed; quitting app`; `pk.log` 234 B (3 old SIGABRT lines only).
- No plasticity processes running.

### -2 package facts (installed)

- `pacman -Qo /usr/bin/plasticity` → **plasticity-aur 26.1.4-2** (binary is a symlink → `../lib/plasticity/Plasticity`, ELF).
- `pacman -Qi plasticity-aur`: `Version 26.1.4-2`, build date **Wed 26 Aug 2026 08:08:24 PM MDT** (the T4 -2 build), installed 08:15:22 PM MDT.
- **29 depends** (counted from the `Depends On` line); `openssl` present (`grep -c openssl` = 1); the 4 trimmed names (`kde-cli-tools`, `libxtst`, `trash-cli`, `xdg-utils`) **absent** (grep count 0).
- Full 29: alsa-lib, at-spi2-atk, at-spi2-core, atk, cairo, dbus, desktop-file-utils, expat, gdk-pixbuf2, glib2, gtk3, gvfs, hicolor-icon-theme, libcups, libdrm, libnotify, libx11, libxcb, libxcomposite, libxdamage, libxext, libxfixes, libxkbcommon, libxrandr, mesa, nspr, nss, openssl, pango.

### Installed-tree rpath (in-place, post-install)

`patchelf --print-rpath` on all three loader-fix targets prints exactly **`$ORIGIN`**:
- `/usr/lib/plasticity/resources/app/.webpack/renderer/pk.node` → `$ORIGIN`
- `/usr/lib/plasticity/resources/app/.webpack/renderer/libhepb.so` → `$ORIGIN`
- `/usr/lib/plasticity/resources/app/.webpack/renderer/libA3DLIBS.so` → `$ORIGIN`

### `--verify` (documented acceptance, `./plasticity-fix.sh --verify` from project root)

- VERDICT: **PASS** — "VERIFY: PASS — main window loaded, no fatal errors, clean stop." (launched via `systemd-run --user --unit=plasticity-verify`; pre-launch diagnosis: `VERDICT: HEALTHY`).
- Kernel-init (unit journal): `Aug 26 20:22:11 madgoat plasticity[68507]: ~== Initializing Plasticity Kernel ==~`
- New main.log lines: `[2026-08-26 20:22:10.293] [info] MAIN: Process starting...` · `[2026-08-26 20:22:11.350] [info] RENDER: Process starting...` · `[2026-08-26 20:22:11.655] [info] MAIN: Main window loaded`
- No `FATAL SIGNAL` / `cannot open shared object` / `RollBack exhausted` / `Lock taken` in the new section; no new coredump during the run window.

### Env-free launch (the real proof — no `LD_LIBRARY_PATH`)

- Launching shell already carried the user session's `DISPLAY=:0`, `WAYLAND_DISPLAY=wayland-0`, `XDG_SESSION_ID=2`, `DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus`, `XDG_RUNTIME_DIR=/run/user/1000` — **no recovery from `/run/user/1000`/`loginctl` was needed**.
- Launch: `env -u LD_LIBRARY_PATH /usr/bin/plasticity` in the background (user-manager-independent).
  - QA note: the very first attempt with that literal command exited silently (0 output, 0 log bytes, 0 coredumps) because the Kilo background-process harness inherits the editor's `ELECTRON_RUN_AS_NODE=1`, which makes the Electron binary run as plain node. Re-ran the identical launch with `-u ELECTRON_RUN_AS_NODE -u ELECTRON_NO_ATTACH_CONSOLE` added — harness artifact, not package or session state (the `--verify` above ran minutes earlier via the user manager env, which has no such vars, and passed).
- Result: **PASS** in ~1.4 s. New main.log section (post-launch timestamps):
  - `[2026-08-26 20:29:03.459] [info]  MAIN: Process starting...`
  - `[2026-08-26 20:29:03.591] [info]  MAIN: Application version 26.1.4`
  - `[2026-08-26 20:29:03.594] [info]  MAIN: ...Process started`
  - `[2026-08-26 20:29:03.640] [info]  MAIN: App ready`
  - `[2026-08-26 20:29:04.502] [info]  RENDER: Process starting...`
  - `[2026-08-26 20:29:04.511] [info]  RENDER: License validity: true`
  - `[2026-08-26 20:29:04.767] [info]  RENDER: ... Process started`
  - `[2026-08-26 20:29:04.873] [info]  MAIN: Main window loaded`
  - Renderer stderr: `~== Initializing Plasticity Kernel ==~` (20:29:04). (Bare `qtpaths`-not-found/`xdg-mime` line + fontconfig warnings are pre-existing harmless noise.)
- `pk.log`: **no new section** (234 B before and after) → no `FATAL SIGNAL: SIGABRT`.
- Stop: `SIGTERM` to the app main process (PID 69100) → clean; all children (zygotes, gpu-process, network utility, renderer) and `chrome_crashpad_handler` exited; `ps` shows **no plasticity processes** (no windowless survivors). App left not running.

### Post: coredump delta + fatal-marker sweep

- Coredump count after both launches: **5** (baseline 5) → **delta 0** (not even the known harmless SIGTRAP-on-exit artifact appeared this time).
- New main.log sections (both launches): no `exitCode: 134`, no `Render process gone`, no `FATAL`.
- New pk.log section: absent (nothing written) → no SIGABRT.

### Phase close

Phase 3 exit criteria: all green (failed-download sim, same-version no-op, mid-build kill+convergence, shellcheck, depends audit+change).

---

## Phase 4 — D1 name availability check

Date: 2026-08-27 (Thu), ~02:37 UTC (~20:37 MDT)
Agent: Implementation Agent (Phase 4, D1 — **read-only AUR queries only; no clone, no claim, no file touched except this append**)

### Name check — `plasticity-aur`

- **RPC v5 unavailable in this environment (documented, not a network failure):** both prescribed RPC calls returned HTTP **404** `404 page not found` (nginx, TLS verified, real `aur.archlinux.org` host; `2604:cac0:a104:d::2`):
  - `curl -s 'https://aur.archlinux.org/rpc/v5/info/?type=source&arg=plasticity-aur'` → `404 page not found` (HTTP 404)
  - `curl -s 'https://aur.archlinux.org/rpc/v5/info/?type=package&arg=plasticity-aur'` → `404 page not found` (HTTP 404)
  - Entire RPC tree is gone: `/rpc/v5/` root → 404 even for known packages (`arg=base`). Retry after 10 s (per protocol): identical `404 page not found`. AUR web itself is reachable (homepage 200, search 200).
- **Web fallback (same read-only AUR, exact-name semantics):** `curl -sL 'https://aur.archlinux.org/packages/plasticity-aur'` → **HTTP 404** (unregistered package page); `plasticity-aur` also absent from the AUR search results for `plasticity`.
- **Result: `plasticity-aur` — AVAILABLE** (source + package name unregistered; no maintainer, nothing to capture).

### Landscape — AUR search `arg=plasticity` (type=multi equivalent via web search, 3 results)

- `plasticity-bin` — maintainer M0N7Y5 — popularity **0.33** (v26.1.4-1, 17 votes, updated 2026-08-15) ← the broken existing package
- `plasticity-bin-unstable` — maintainer orphan — popularity **0.00** (v24.2.5-1, 1 vote, updated 2024-10-16)
- `r-geneplast` — maintainer BioArchLinuxBot — popularity **0.00** (v1.38.0-1, 0 votes, updated 2026-05-21) — unrelated R bioinformatics package; matched via description text, not a name collision

### Conclusion

**PROCEED TO CLAIM** — `plasticity-aur` is free (web exact-page 404 + absent from search; RPC v5 404 documented above as the environmental caveat). No name conflict → no escalation to TD. No AUR state was created or modified by this check.

---

## Phase 4 — T6: name gate + rename + publication prep

Date: 2026-08-27 (Thu), ~02:55 UTC (~20:55 MDT)
Agent: Implementation Agent (Phase 4, T6 — rename + publication prep; **no AUR claim, no push, no git commit, no sudo**)

### D1 gate — `plasticity-4arch` availability (web fallback; RPC v5 still 404 on this box)

- `curl -s -o /dev/null -w '%{http_code}' 'https://aur.archlinux.org/packages/plasticity-4arch/'` → **HTTP 307** (https→http redirect) → followed with `-L` → final **HTTP 404** (unregistered package page).
- `curl -s 'https://aur.archlinux.org/packages/?K=plasticity-4arch'` → `grep -ic 'plasticity-4arch'` = **0** (no exact-name hit in the results HTML).
- D1 final: name closed as `plasticity-4arch` per user decision (2026-08-26); web fallback check: 404/no hit; prior `plasticity-aur` check remains history.

### Rename — functional references changed; BUILD-LOG history untouched

- `PKGBUILD.template`: `pkgname="plasticity-4arch"`; header comment block replaced with a self-contained provenance paragraph (≤6 lines, no `../` refs — AUR renders header comments); `pkgrel=1`.
- `update.sh`: `PKGNAME="plasticity-4arch"` (drives the expected-artifact path), header comment, `mktemp` build-log name, AUR-submit hint in the summary.
- `README.md`: title, quickstart `pacman -U` filename, submission note; new "Switching over from plasticity-bin (AUR users)" section (no coexistence — identical `/usr/lib/plasticity/*` paths; kill windowless survivor; clear `~/.config/Plasticity` Singleton locks; `-Rns plasticity-bin`; `-S plasticity-4arch`; `~/.plasticity` license survives).
- `apply-loader-fix.sh`: core fix **verified name-agnostic** (locates `libA3DLIBS.so` by path, patches modules by string reference, no pkgname dependency); changed 1 header comment + the off-by-default `--with-ld-fragment` filename (`plasticity-aur.conf` → `plasticity-4arch.conf`).

### PKGREL reset 2 → 1

Fresh public lineage under the new name: the local `plasticity-aur` 26.1.4-1/-2 lineage was **never published**, so `plasticity-4arch` starts its published lineage at 26.1.4-1.

### Rebuild — 26.1.4-1

- `rm -f PKGBUILD && ./update.sh --version 26.1.4` → **exit 0** (~21:02 MDT). Inputs reused from disk (no re-download); sha512s identical to the T4 -2 build (deb `fa27fb29…af99e12`, lic `1fbd6b24…f15c27`).
- **Canary: 3 targets** in `usr/lib/plasticity/resources/app/.webpack/renderer/` referencing libA3DLIBS: `pk.node`, `libA3DLIBS.so`, `libhepb.so`.
- Rendered PKGBUILD: `pkgname="plasticity-4arch"`, `pkgrel=1`, self-contained provenance header, **zero `../` references** (AUR-render-safe).
- **`[proof] OK RPATH=$ORIGIN` ×3** on `pk.node`, `libA3DLIBS.so`, `libhepb.so` (other colocated `.so`s without the dlopen reference correctly untouched).
- **Artifact:** `plasticity-4arch-26.1.4-1-x86_64.pkg.tar.zst` = **284,514,171 bytes** (~271 MiB) in `aur/`.
- **.PKGINFO** (makepkg 7.1.0 encodes the rel in the full version field, no separate `pkgrel` key): `pkgname = plasticity-4arch`, `pkgver = 26.1.4-1` (i.e. pkgrel 1), `arch = x86_64`, `makedepend = patchelf`.
- Not installed (user-gated). Prior local artifacts `plasticity-aur-26.1.4-1/-2` remain on disk as history (never published, lineage reset documented above).

### D5

D5: do NOT flag or request deprecation of plasticity-bin without direct maintainer contact first (default policy); MAINTAINER-REPORT.md v2 is the paste-ready comment thread for that conversation.

- **N8 — incident 2026-08-26:** entire `aur/` directory found in KDE trash (`/home/madgoat/Documents/.Trash-1000/files/aur`, trashed ~21:03 local) — external file-manager operation, not automation. Restored ~21:42 MDT; 26.1.4-1 pkg sha512 verified identical pre/post restore; git index intact (7 files staged). No other trashed project entries: **n** (trash held only `aur/` + its `.trashinfo`).
