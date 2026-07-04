# Maintainer: Adarsh Senghani <adarsh@retainia.com>
#
# THIS is the AUR-published PKGBUILD (package: argus-tracker). It differs
# from packaging/arch/PKGBUILD in ONE important way: it is fully
# self-contained and builds from a downloaded release tarball
# (source=()), NOT from the surrounding repo tree. The AUR builds each
# package in isolation with only what source=() fetches — there is no
# repo checkout to copy from, so the $startdir/../.. trick used by
# packaging/arch/PKGBUILD (a convenience for local `makepkg -si` from a
# working copy) cannot work here.
#
# Everything else (venv-under-/opt rationale, --system-site-packages for
# PyGObject/GStreamer GI bindings, the python-SONAME-bump rebuild caveat,
# the argus-tracker vs argus naming) is identical — see
# packaging/arch/PKGBUILD's top-of-file comments for the full reasoning.
#
# On each upstream release, CI regenerates the sha256 + .SRCINFO and pushes
# this file to the AUR (see .github/workflows/release.yml, publish-aur job).
pkgname=argus-tracker
pkgver=0.3.0
pkgrel=1
pkgdesc="Always-on personal desktop activity tracker (KDE Plasma / Wayland)"
arch=('x86_64')
url="https://github.com/Adarsh077/argus"
provides=('argus')
conflicts=('argus')
replaces=('argus')
# license=('...')  # omitted: no LICENSE file in the repo yet
depends=(
  'python'
  'python-gobject'          # GI bindings — system package only, never pip
  'gstreamer'
  'gst-plugins-base'         # videoconvert/audioconvert/audioresample/audiomixer
  'gst-plugins-good'         # mp4mux (isomp4) + pulsesrc
  'gst-plugins-ugly'         # x264enc (H.264 encode)
  'gst-plugin-rsaudiofx'     # audiornnoise (RNNoise mic denoise, preferred)
  'gst-plugins-bad'          # webrtcdsp (mic noise suppression fallback)
  'webrtc-audio-processing'  # backing library for webrtcdsp
  'gst-libav'                # avenc_aac (AAC encode)
  'gst-plugin-pipewire'
  'pipewire'
  'pipewire-pulse'          # pulsesrc mic + sink .monitor
  'libpulse'                # pactl for audio-device resolution
  'xdg-desktop-portal-kde'
  'libayatana-appindicator'
  'kdotool'                 # AUR dep; paru/yay resolve it transitively
)
makedepends=('uv' 'rsync')
options=('!strip')  # vendored third-party wheels — leave their binaries alone
install=argus.install
# GitHub tag tarball. Extracts to argus-$pkgver/ (repo name is `argus`,
# tag is v$pkgver). CI keeps the checksum current via updpkgsums.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee5f78bbaad8c597e559132335494b0035976e32a7a8e3dede4df21c288c6418')

_src() { echo "$srcdir/argus-$pkgver"; }

build() {
  cd "$(_src)"
  rm -rf dist
  uv build

  # venv with --system-site-packages so it can see the Arch-packaged
  # python-gobject / GStreamer GI bindings (depends= above); these are not
  # reliably pip-installable and must never come from PyPI.
  python -m venv --system-site-packages "$srcdir/venv"
  "$srcdir/venv/bin/python" -m pip install --upgrade pip

  # Install the built wheel with --no-deps so pip never tries to pull
  # pygobject from PyPI, then install the pure-Python deps explicitly
  # (mirrors pyproject [project.dependencies] minus pygobject [system] and
  # pywin32 [Windows-only]).
  "$srcdir/venv/bin/python" -m pip install --no-deps \
    "$(_src)"/dist/argus-${pkgver}-py3-none-any.whl
  "$srcdir/venv/bin/python" -m pip install \
    'dbus-next>=0.2.3' \
    'fastapi>=0.139.0' \
    'httpx>=0.28.1' \
    'jinja2>=3.1.6' \
    'markdown>=3.10.2' \
    'mss>=10.2.0' \
    'opencv-python>=5.0.0.93' \
    'pillow>=12.3.0' \
    'platformdirs>=4.10.0' \
    'psutil>=7.2.2' \
    'pystray>=0.19.5' \
    'python-multipart>=0.0.32' \
    'tomli-w>=1.2.0' \
    'uvicorn[standard]>=0.49.0'
}

package() {
  install -dm755 "$pkgdir/opt/argus"
  cp -a "$srcdir/venv" "$pkgdir/opt/argus/venv"

  # Wrapper runs the venv interpreter on the console script directly (the
  # script's baked shebang points at the transient build-time venv path).
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/argus" <<'EOF'
#!/bin/sh
exec /opt/argus/venv/bin/python /opt/argus/venv/bin/argus "$@"
EOF

  # systemd --user unit, ExecStart repointed at the packaged binary.
  install -Dm644 "$(_src)/packaging/arch/argus.service" \
    "$pkgdir/usr/lib/systemd/user/argus.service"
  sed -i 's#^ExecStart=.*#ExecStart=/usr/bin/argus run#' \
    "$pkgdir/usr/lib/systemd/user/argus.service"

  # Globally enable the user unit for every user's graphical session at
  # package-install time. Pacman hooks run outside any login session (no
  # D-Bus, no `systemctl --user enable` possible), so instead we ship the
  # enablement symlink the way `systemctl --user enable` would create it,
  # but in the package-owned /usr/lib tree: systemd reads
  # <unit-dir>/<target>.wants/ for user units, so this makes argus.service
  # start automatically on the next graphical login for all users, no
  # manual per-user step. (Matches the unit's own WantedBy=.)
  install -dm755 "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants"
  ln -s ../argus.service \
    "$pkgdir/usr/lib/systemd/user/graphical-session.target.wants/argus.service"

  # Tray autostart at graphical login.
  install -Dm644 "$(_src)/packaging/arch/argus-tray.desktop" \
    "$pkgdir/etc/xdg/autostart/argus-tray.desktop"
}
