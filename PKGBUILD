# Maintainer: Ishan Parihar (Ishan-Parihar)
# Upstream: https://github.com/LinkSy-mg/linksy-releases (desktop track: linux-vX.Y.Z)

pkgname=linksy-bin
pkgver=0.9.15   # fallback, overridden by pkgver()
pkgrel=1
pkgdesc="Your devices, connected: direct file/clipboard/screen/camera sharing between Linux and Android, no cloud"
arch=('x86_64')
url="https://github.com/LinkSy-mg/linksy-releases"
license=('AGPL-3.0-only')
depends=(
  'gtk4'              # libgtk-4.so.1
  'libadwaita'        # libadwaita-1.so.0
  'gstreamer'         # libgstreamer-1.0.so.0
  'gst-plugins-base-libs'
  'gst-plugins-good'  # rtp/v4l2/pulse audio in/out (deb: gstreamer1.0-plugins-good)
  'gst-plugin-gtk4'   # gtk4 render/video sink (deb: gstreamer1.0-gtk4)
  'gst-plugin-pipewire' # pipewire audio (deb: gstreamer1.0-pipewire)
  'gst-libav'         # h264 software codecs (deb recommends: gstreamer1.0-libav)
  'gst-plugins-bad'   # extra codecs (deb recommends: gstreamer1.0-plugins-bad)
  'avahi'             # mDNS discovery
  'wl-clipboard'      # wayland clipboard (deb recommends)
  'xdg-desktop-portal' # file portal (deb depends)
)
optdepends=(
  'v4l2loopback-dkms: phone camera as webcam device'
  'v4l2loopback-utils: manage the loopback camera device'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!emptydirs')
install=linksy-bin.install
source=(
  # dummy VCS source -> yay --devel reruns pkgver() on every -Syu; upstream repo
  # is tiny (104K) and always non-empty (the empty AUR base breaks the first
  # clone). No #tag pin: source= expands before pkgver() runs, so a pin would
  # fetch a stale tag after a bump (see skill: makepkg ordering).
  "linksy-releases::git+https://github.com/LinkSy-mg/linksy-releases.git"
)
sha256sums=('SKIP')
# The deb is fetched and verified (against upstream SHA256SUMS) in prepare(),
# because its name changes with the version and source= is expanded before
# pkgver() runs (see skill: makepkg ordering).

# The repo has TWO release tracks: android (vX.Y.Z) and desktop (linux-vX.Y.Z).
# /releases/latest points at the android track, so we must filter for linux- tags.
# The VCS source is already cloned before pkgver() runs, so read tags locally —
# no API call, no rate limit (strongest form of the redirect-first rule).
pkgver() {
  _latest=$(git -C "$srcdir/linksy-releases" tag --list 'linux-v*' --sort=-v:refname 2>/dev/null | head -1 | sed 's|^linux-v||')
  if [[ -z "$_latest" || "$_latest" == "null" ]]; then
    _latest=$(curl -sL "https://api.github.com/repos/LinkSy-mg/linksy-releases/releases?per_page=30" \
      | jq -r '[.[] | select(.tag_name | startswith("linux-"))][0].tag_name' 2>/dev/null \
      | sed 's|^linux-v||')
  fi
  if [[ -n "$_latest" && "$_latest" != "null" && "$_latest" =~ ^[0-9] ]]; then
    printf "%s" "$_latest"
  else
    printf "%s" "0.8.3"
  fi
}

prepare() {
  _deb="linksy_${pkgver}_amd64.deb"
  # resolve asset URL via API first (handles %2F tag encoding), fall back to the
  # direct URL. These lookups are optional with fallbacks; guard with || true so
  # a rate-limited/unreachable API cannot abort prepare() under makepkg's set -e.
  _url_api=$(curl -sL "https://api.github.com/repos/LinkSy-mg/linksy-releases/releases/tags/linux-v${pkgver}" \
    | jq -r ".assets[] | select(.name==\"${_deb}\") | .browser_download_url" 2>/dev/null) || true
  _urls=()
  [[ -n "$_url_api" && "$_url_api" != "null" ]] && _urls+=("$_url_api")
  _urls+=("https://github.com/LinkSy-mg/linksy-releases/releases/download/linux-v${pkgver}/${_deb}")

  # cache-aware: reuse cached deb when it exists and is valid
  _ok=0
  if [[ -f "$srcdir/$_deb" ]]; then
    if bsdtar -tf "$srcdir/$_deb" >/dev/null 2>&1; then
      echo "Using cached $_deb"
      _ok=1
    else
      rm -f "$srcdir"/linksy_*_amd64.deb
    fi
  fi
  if [[ $_ok -eq 0 ]]; then
    for _u in "${_urls[@]}"; do
      echo "Fetching $_u ..."
      if curl -fL -o "$srcdir/$_deb" "$_u" && bsdtar -tf "$srcdir/$_deb" >/dev/null 2>&1; then
        _ok=1
        break
      fi
    done
  fi
  [[ $_ok -eq 1 ]] || { echo "Failed to fetch a valid linksy deb for ${pkgver}" >&2; exit 1; }

  # verify against upstream SHA256SUMS when available (integrity of artifact chain)
  _sums_url="https://github.com/LinkSy-mg/linksy-releases/releases/download/linux-v${pkgver}/SHA256SUMS"
  _want=$(curl -fsSL "$_sums_url" 2>/dev/null | awk -v f="$_deb" '$2==f {print $1}') || true
  _have=$(sha256sum "$srcdir/$_deb" | awk '{print $1}')
  if [[ -n "$_want" ]]; then
    [[ "$_want" == "$_have" ]] || { echo "SHA256 mismatch vs upstream SHA256SUMS" >&2; exit 1; }
    echo "SHA256 verified against upstream SHA256SUMS"
  fi

  bsdtar -xf "$srcdir/$_deb" -C "$srcdir"
  [[ -f "$srcdir/data.tar.xz" ]] || { echo "data.tar.xz missing from deb" >&2; exit 1; }
  bsdtar -xf "$srcdir/data.tar.xz" -C "$srcdir"
  [[ -d "$srcdir/usr" ]] || { echo "deb payload missing usr/ tree" >&2; exit 1; }
}

build() {
  # map Debian dependency names to Arch package names for the smoke test report
  echo "Linksy deb repack for Arch - binaries present:"
  ls -1 "$srcdir/usr/bin/"
}

check() {
  cd "$srcdir"

  # 1. Every shared library resolves against the target system (a missing one
  #    fails before main() ever runs).
  for _bin in usr/bin/linksy usr/bin/linksy-app usr/bin/linksyd usr/bin/linksy-screen; do
    if ldd "$_bin" | grep -q "not found"; then
      echo "ldd failure on $_bin:" >&2
      ldd "$_bin" | grep "not found" >&2
      return 1
    fi
  done
  echo "ldd: all libraries resolve"

  # 2. The GUI app parses its args headlessly (real GLib/GApplication init path).
  env -u WAYLAND_DISPLAY -u DISPLAY usr/bin/linksy-app --help >/dev/null 2>&1
  [[ $? -eq 0 ]] || { echo "linksy-app --help failed headlessly" >&2; return 1; }
  echo "linksy-app: GApplication init OK"

  # 3. The background daemon starts, binds its UDP port, and keeps running
  #    (a daemon's job). "Still alive after 8s" = clean startup path; a startup
  #    throw would have exited early. Then confirm it shuts down when asked.
  #    Isolated HOME so the smoke test leaves no ~/Downloads/Linksy behind.
  #    The outer timeout (12s) sits beyond the check window (8s) so the kill
  #    can never race the liveness check.
  _smoke_home="$srcdir/linksyd-smoke-home"
  mkdir -p "$_smoke_home"
  HOME="$_smoke_home" timeout 12 usr/bin/linksyd --name aur-smoke-test --port 47201 >"$srcdir/linksyd-smoke.log" 2>&1 &
  _pid=$!
  _alive=1
  for _i in $(seq 1 16); do
    sleep 0.5
    kill -0 "$_pid" 2>/dev/null || { _alive=0; break; }
  done
  [[ $_alive -eq 1 ]] || { echo "linksyd exited during startup" >&2; cat "$srcdir/linksyd-smoke.log" >&2; return 1; }
  grep -q "ready" "$srcdir/linksyd-smoke.log" || { echo "linksyd never reported ready" >&2; cat "$srcdir/linksyd-smoke.log" >&2; return 1; }
  kill -TERM "$_pid" 2>/dev/null || true
  wait "$_pid" 2>/dev/null || true
  # linksyd catches SIGTERM; give the log a moment to confirm the clean shutdown
  for _i in $(seq 1 10); do
    grep -q "shutting down" "$srcdir/linksyd-smoke.log" && break
    sleep 0.5
  done
  grep -q "shutting down" "$srcdir/linksyd-smoke.log" || { echo "linksyd did not shut down cleanly" >&2; cat "$srcdir/linksyd-smoke.log" >&2; return 1; }
  echo "linksyd: started, reported ready, alive after 8s, clean shutdown"

  # 4. Desktop entry + icon shipped correctly (launcher integration).
  desktop-file-validate usr/share/applications/mg.diary.linksy.Linksy.desktop
  [[ -f usr/share/icons/hicolor/scalable/apps/mg.diary.linksy.Linksy.svg ]] \
    || { echo "hicolor icon missing" >&2; return 1; }
  echo "desktop file + icon OK"
}

package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  # deb postinst equivalents handled at system level (not inside the chroot-ish package()):
  #  - systemctl --global enable linksyd.service  -> linksy-bin.install post_install
  #  - udev reload/trigger                        -> linksy-bin.install post_install
  #  - firewall config (firewalld/ufw)            -> NOT automatic; app's Finish Setup dialog handles it

  # licenses: deb ships them under /usr/share/licenses/linksy; keep and point at upstream repo
  if [[ -d "$pkgdir/usr/share/licenses/linksy" ]]; then
    mv "$pkgdir/usr/share/licenses/linksy" "$pkgdir/usr/share/licenses/$pkgname"
  else
    install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    echo "AGPL-3.0-only — see $url" > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
  chmod 0755 "$pkgdir/usr/bin/linksy" "$pkgdir/usr/bin/linksy-app" "$pkgdir/usr/bin/linksy-screen" "$pkgdir/usr/libexec/linksy/"*
}
