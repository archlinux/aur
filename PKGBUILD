# Maintainer: Ishan Parihar <ishan@example.com>
# Upstream: https://github.com/browseros-ai/BrowserOS (browserclaw/*)
# Maintenance-free: pkgver() curls latest browserclaw tag; prepare() fetches deb via API
# Dummy git source makes `yay -Syu` with `devel:true` run pkgver() on every Syu.

pkgname=browseros-neo-bin
_pkgname=browserclaw
pkgver=0.50.5
pkgrel=5
pkgdesc="BrowserOS neo — AI browser for agents (Chromium 151, binary from browserclaw/* tags, auto-rolling)"
arch=('x86_64')
url="https://github.com/browseros-ai/BrowserOS"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'atk' 'cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'libcups' 'libdrm' 'libxcomposite' 'libxdamage' 'libxrandr' 'libxkbcommon'
         'mesa' 'nspr' 'nss' 'pango' 'libx11' 'systemd-libs' 'expat' 'libxcb'
         'sqlite3' 'binutils')
makedepends=('curl' 'jq' 'git')
optdepends=('xdg-utils: open links with xdg-open'
            'libnotify: desktop notifications'
            'apparmor: AppArmor profile at /etc/apparmor.d/browserclaw')
provides=("browseros-neo=${pkgver}" "browserclaw=${pkgver}" "${_pkgname}=${pkgver}")
conflicts=('browseros-neo' 'browserclaw' 'browseros-neo-git')
options=('!strip' '!emptydirs')
install=browseros-neo.install
source=("browseros-neo::git+https://aur.archlinux.org/browseros-neo-bin.git")
sha256sums=('SKIP')

pkgver() {
  _latest=$(curl -sL "https://api.github.com/repos/browseros-ai/BrowserOS/releases?per_page=20" \
    | jq -r '[.[] | select(.tag_name | startswith("browserclaw/"))][0].tag_name' 2>/dev/null \
    | sed 's|^browserclaw/v||')
  if [[ -n "$_latest" && "$_latest" != "null" ]]; then
    printf "%s" "$_latest"
  else
    printf "%s" "0.50.5"
  fi
}

prepare() {
  _deb="BrowserOS_neo_v${pkgver}_amd64.deb"
  _url_api=$(curl -sL "https://api.github.com/repos/browseros-ai/BrowserOS/releases/tags/browserclaw%2Fv${pkgver}" \
    | jq -r '.assets[] | select(.name=="'"$_deb"'") | .browser_download_url' 2>/dev/null)
  _urls=()
  [[ -n "$_url_api" && "$_url_api" != "null" ]] && _urls+=("$_url_api")
  _urls+=("https://github.com/browseros-ai/BrowserOS/releases/download/browserclaw%2Fv${pkgver}/${_deb}")
  _urls+=("https://github.com/browseros-ai/BrowserOS/releases/download/browserclaw/v${pkgver}/${_deb}")

  if [[ -f "$srcdir/$_deb" ]] && bsdtar -tf "$srcdir/$_deb" >/dev/null 2>&1; then
    echo "Using cached $_deb"
  else
    rm -f "$srcdir"/BrowserOS_neo_*.deb 2>/dev/null || true
    _fetched=0
    for _u in "${_urls[@]}"; do
      echo "Trying $_u ..."
      if curl -fL -o "$srcdir/$_deb" "$_u"; then
        if bsdtar -tf "$srcdir/$_deb" >/dev/null 2>&1; then
          echo "Fetched $_deb successfully"
          _fetched=1
          break
        else
          echo "Not a valid deb, trying next"
          rm -f "$srcdir/$_deb"
        fi
      else
        echo "curl failed, trying next"
        rm -f "$srcdir/$_deb"
      fi
    done
    if [[ $_fetched -eq 0 ]]; then echo "ERROR: Failed to fetch $_deb" >&2; exit 1; fi
  fi
  bsdtar -xf "$srcdir/$_deb" -C "$srcdir"
}

package() {
  bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir"
  if [[ -f "$pkgdir/usr/lib/browserclaw/chrome_sandbox" ]]; then chmod 4755 "$pkgdir/usr/lib/browserclaw/chrome_sandbox"; fi
  install -dm755 "$pkgdir/usr/bin"

  # browseros-neo-doctor: user-facing repair tool for sidecar DB/state mismatches.
  # Runs as the launching user (not root). Invoked manually or via wrapper.
  install -Dm755 /dev/stdin "$pkgdir/usr/lib/browserclaw/browseros-neo-doctor.sh" <<'EOF'
#!/bin/sh
# browseros-neo-doctor: Repair sidecar database migration mismatches and stale state.
# Run as the user who will launch browseros-neo.
set -eu

DB="${HOME}/.browserclaw/browserclaw.sqlite"
BIN="/usr/lib/browserclaw/BrowserClawServer/default/resources/bin/browseros-claw-server"
LOCK_DIR="${HOME}/.config/browser-claw/.browseros/BrowserClawServer"

[ -f "$DB" ] || exit 0
[ -f "$BIN" ] || exit 0

# Remove migration rows not present in the current binary
sqlite3 "$DB" "SELECT version FROM seaql_migrations;" 2>/dev/null | while IFS= read -r v; do
  [ -z "$v" ] && continue
  strings "$BIN" 2>/dev/null | grep -aFq "$v" || {
    echo "browseros-neo-doctor: removing unknown migration $v"
    sqlite3 "$DB" "DELETE FROM seaql_migrations WHERE version='$v';" 2>/dev/null || true
  }
done

# Clear stale lock/state that can block sidecar launch
rm -f "$LOCK_DIR/versions" 2>/dev/null || true
rm -rf "$LOCK_DIR/versions" 2>/dev/null || true
# Only clear server.lock if the owning process is dead
if [ -f "$LOCK_DIR/server.lock" ]; then
  _pid=$(cat "$LOCK_DIR/server.lock" 2>/dev/null | tr -d '[:space:]')
  if [ -n "$_pid" ] && [ "$_pid" -gt 0 ] 2>/dev/null; then
    kill -0 "$_pid" 2>/dev/null || {
      echo "browseros-neo-doctor: removing stale server.lock (pid $_pid dead)"
      rm -f "$LOCK_DIR/server.lock" 2>/dev/null || true
    }
  fi
fi
EOF

  # Wrapper that runs pre-flight repair before launching browser
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/browserclaw" <<'EOF'
#!/bin/sh
# browserclaw wrapper: runs pre-flight repair then launches browser.
export LD_LIBRARY_PATH=/usr/lib/browserclaw${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

# Pre-flight: run doctor as the launching user (no-op if DB/binary absent)
_doctor=/usr/lib/browserclaw/browseros-neo-doctor.sh
if [ -x "$_doctor" ]; then
  "$_doctor" >/dev/null 2>&1 || true
fi

exec /usr/lib/browserclaw/browserclaw "$@"
EOF

  ln -sf /usr/bin/browserclaw "$pkgdir/usr/bin/browseros-neo" 2>/dev/null || true
  ln -sf /usr/bin/browserclaw "$pkgdir/usr/bin/browseros-neo-bin" 2>/dev/null || true

  if [[ ! -f "$pkgdir/usr/share/licenses/${pkgname}/LICENSE" ]]; then
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    echo "AGPL-3.0-only - see https://github.com/browseros-ai/BrowserOS/blob/browserclaw/v${pkgver}/LICENSE" > "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  fi
}