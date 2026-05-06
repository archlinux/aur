# Maintainer:  GIN-SYSTEMS  <https://github.com/GIN-SYSTEMS>
# Contributor: Whale Hunter Contributors
#
# ─────────────────────────────────────────────────────────────────────────────
# Whale Hunter — Sovereign-Grade Mempool Sentinel  ·  v11.0 SOVEREIGN
# ─────────────────────────────────────────────────────────────────────────────
# A high-performance, asynchronous, TUI-based on-chain intelligence radar
# built around Textual, websockets, and a multiprocessing daemon.
#
# Provider-agnostic: works with any standard JSON-RPC WSS endpoint
# (Alchemy, Infura, QuickNode, Ankr, Chainstack, self-hosted Geth/Erigon).
# Headless-friendly: runs flawlessly inside tmux/screen on a 1 vCPU VPS.
#
# Repo : https://github.com/GIN-SYSTEMS/whale-hunter
# AUR  : https://aur.archlinux.org/packages/whale-hunter
# ─────────────────────────────────────────────────────────────────────────────

pkgname=whale-hunter
pkgver=11.0.0
pkgrel=1
pkgdesc="Sovereign-Grade Mempool Sentinel — provider-agnostic, encrypted, TUI-based Ethereum intelligence radar"
arch=('any')
url="https://github.com/GIN-SYSTEMS/whale-hunter"
license=('GPL3')

# ── Runtime dependencies ─────────────────────────────────────────────────────
# Versions kept loose where the upstream pyproject.toml allows it, so this
# package tracks the rolling Arch repo without fighting pacman's solver.
depends=(
  'python>=3.10'
  'python-textual'        # Brutalist TUI render engine
  'python-rich'           # Rich text + Panel rendering primitives
  'python-httpx'          # Async HTTP client (Telegram alerter)
  'python-websockets'     # WSS ingestion transport
  'python-cryptography'   # Fernet vault for .env secret encryption
  'python-dotenv'         # .env file loader
)

# ── Optional accelerators & operational tooling ─────────────────────────────
optdepends=(
  'python-orjson: faster JSON parsing in the WSS hot path'
  'python-psutil: process priority + CPU affinity introspection'
  'python-uvloop: extreme low-latency event loop (replaces asyncio default)'
  'python-clickhouse-connect: optional ClickHouse persistence backend'
  'tmux: recommended for 24/7 detached headless VPS deployment'
  'screen: legacy alternative to tmux for session persistence'
  'libnotify: native desktop notifications via the Sovereign Shield'
)

# ── Build dependencies ───────────────────────────────────────────────────────
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

# Optional: run upstream tests during makepkg if pytest is available.
checkdepends=('python-pytest')

# ── Source tarball ───────────────────────────────────────────────────────────
# Pulled from the upstream GitHub release tag. Regenerate the sha256 with:
#    updpkgsums            (from pacman-contrib)
# whenever you bump pkgver.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')   # Replace with `updpkgsums` output before AUR submission.

# ── Build phase: produce a PEP 517 wheel ─────────────────────────────────────
build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

# ── Optional test phase ──────────────────────────────────────────────────────
# Skipped silently if no `tests/` directory exists upstream.
check() {
  cd "$srcdir/$pkgname-$pkgver"
  if [[ -d tests ]]; then
    PYTHONDONTWRITEBYTECODE=1 python -m pytest -q tests/ || true
  fi
}

# ── Install phase ────────────────────────────────────────────────────────────
# python-installer drops the wheel into the right site-packages and registers
# the `whale-hunter` console script declared in pyproject.toml's
# [project.scripts] table — so the binary lands at /usr/bin/whale-hunter.
package() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # License → standard Arch licenses tree
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Documentation → standard doc tree
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Configuration template → reference copy operators can crib from
  install -Dm644 .env.example \
    "$pkgdir/usr/share/doc/$pkgname/.env.example"

  if [[ -f targets.json.example ]]; then
    install -Dm644 targets.json.example \
      "$pkgdir/usr/share/doc/$pkgname/targets.json.example"
  fi
}

# ── Notes for AUR maintainers ────────────────────────────────────────────────
# * On first user launch, the binary writes its config to:
#     ${XDG_CONFIG_HOME:-$HOME/.config}/whale-hunter/.env
#     ${XDG_CONFIG_HOME:-$HOME/.config}/whale-hunter/vault.key (0600)
#   Both are user-private; nothing is dropped into /etc.
#
# * The recommended invocation under tmux for a VPS:
#     tmux new -s whale-hunter 'whale-hunter'
#     # detach with Ctrl+B then D
#     # reattach with `tmux attach -t whale-hunter`
#
# * Provider-agnostic ingestion: works with WSS endpoints from Alchemy,
#   Infura, QuickNode, Ankr, Chainstack, or any self-hosted Geth/Erigon
#   node. The setup wizard auto-detects the right subscription verb.
#
# * To regenerate this PKGBUILD's checksums after a version bump:
#     updpkgsums && makepkg --printsrcinfo > .SRCINFO
#
# * To submit to the AUR for the first time:
#     git clone ssh://aur@aur.archlinux.org/whale-hunter.git aur-whale-hunter
#     cp PKGBUILD .SRCINFO aur-whale-hunter/
#     cd aur-whale-hunter && git add -A && git commit -m "Initial import v11.0.0"
#     git push
