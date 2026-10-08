# Maintainer: august <august@wolfgangwarehaus.com>
#
# AUR PKGBUILD for jellytoast — a native PySide6 Jellyfin/Subsonic music
# client with bit-perfect mpv playback. Builds the pure-Python wheel via
# the standard PEP 517 flow and installs it plus the .desktop / AppStream
# metainfo / hicolor icon.
#
# Package name is the bare `jellytoast` (not `python-jellytoast`): the
# `python-` prefix is reserved for importable library packages; this is an
# end-user application. arch=('any') — pure Python, no compiled extension.

pkgname=jellytoast
pkgver=0.2.2
pkgrel=1
pkgdesc='Audio-first native Jellyfin / Subsonic desktop music client with bit-perfect mpv playback'
arch=('any')
url='https://github.com/wolfgangwarehaus/jellytoast'
license=('GPL-2.0-or-later')

# Hard runtime deps. All in the official `extra` repo. NB: `mpv` is the
# load-bearing one — python-mpv is a ctypes binding that dlopen's
# libmpv.so AT IMPORT TIME, so without `mpv` the player module refuses to
# load. (python-mpv does NOT pull mpv automatically, so it MUST be listed.)
depends=(
  'python'
  'pyside6'                # Qt6 bindings
  'python-mpv'             # ctypes binding to libmpv
  'mpv'                    # provides libmpv.so — required at import time
  'python-pychromecast'    # Chromecast cast
  'python-zeroconf'        # mDNS discovery (Chromecast/DLNA)
  'python-ifaddr'          # LAN interface enumeration for discovery
  'python-dbus-next'       # MPRIS / media-key integration
  'python-xlib'            # X11 startup-notification cursor cleanup
  'python-requests'        # provider HTTP
  'python-keyring'         # credential storage (secret-service/kwallet)
  'python-cryptography'    # AES-GCM credential blob at rest
)

# Optional, lazily-imported features. Each degrades gracefully when absent
# (guarded import → the feature simply no-ops), so they are optdepends, not
# hard deps — even pyatv, which `pip install` pulls by default on Linux but
# jellytoast lazy-imports (jellytoast/airplay2.py `_ensure_pyatv`). Listing the
# AUR-only ones here avoids forcing an AUR transitive dep on every install.
optdepends=(
  'kwindowsystem: live glass blur behind the Frosted theme (KDE); absent, the Frosted body paints near-opaque instead'
  'python-numpy: audio visualizer'
  'python-async-upnp-client: DLNA casting (AUR; app targets >=0.47 — older may misbehave)'
  'python-soco: Sonos casting (AUR)'
  # NB: AirPlay 2 casting needs pyatv, which has no repo or AUR package as of
  # 2026-07 — installable via pip into the system env if wanted; the feature
  # no-ops without it. Re-add here if/when python-pyatv lands on the AUR.
)

makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

# Pin the source to a release tag tarball (reproducible — preferred over a
# moving branch). `pkgver` is kept in lockstep with pyproject by
# dev/cut_release.sh and gated by tests/test_version_consistency.py; the digest
# is refreshed by `updpkgsums` (the aur.yml workflow runs it, as does a manual
# cut). The value below matches the $pkgver tag archive, so a direct
# `makepkg` of this checkout works.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83b9ff94d7a65d691929cd14480322a90e2ed2b550b2cdb6d3ade756ad1dcb8e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Desktop entry + AppStream metadata + scalable icon. The icon is
  # installed under the app-id name so the .desktop `Icon=` key resolves.
  local appid=io.github.wolfgangwarehaus.jellytoast
  install -Dm644 "packaging/$appid.desktop" \
    "$pkgdir/usr/share/applications/$appid.desktop"
  install -Dm644 "packaging/$appid.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/$appid.metainfo.xml"
  install -Dm644 packaging/icons/jellytoast.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$appid.svg"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
