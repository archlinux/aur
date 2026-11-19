# Maintainer: lzsnyy <710080675@qq.com>
#
# Anaconda's Kilo Desktop. Upstream publishes a single mutable "latest" deb
# per architecture (no versioned URLs, no update manifest), and that deb's
# control metadata is stuck at Version 1.0.0 even though the payload changes:
# the packaged app.asar and every native prebuild are rebuilt per release.
# The build date from the deb's Last-Modified header is therefore appended to
# pkgver so a rebuilt artifact still reads as an upgrade. sha256sums pin the
# exact bytes that were audited, so an unnoticed upstream rebuild fails here
# instead of silently shipping.
#
# The deb bundles prebuilt Electron 45 runtime, app.asar and the unpacked
# native modules (keytar, koffi, better-sqlite3, @parcel/watcher, runtimed).
# Those are ABI-locked to this Electron build, so it is repacked rather than
# rebuilt against the distro's electron package.

pkgname=kilo-desktop-bin
_appver=1.0.0
_builddate=20261117
pkgver=${_appver}.${_builddate}
pkgrel=1
pkgdesc="Kilo Desktop by Anaconda, an AI coding agent with local notebooks and plugins"
arch=('x86_64' 'aarch64')
url='https://kilo.ai'
license=('custom')
depends=(
  'gtk3' 'nss' 'nspr' 'at-spi2-core' 'at-spi2-atk' 'cairo' 'pango'
  'glib2' 'dbus' 'libcups' 'libdrm' 'mesa' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
  'libxkbcommon' 'alsa-lib' 'systemd-libs' 'libsecret' 'expat'
)
optdepends=(
  'xdg-utils: open external links'
  'gnome-keyring: store credentials in the system keyring'
  'trash-cli: move files to the trash from the built-in file browser'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!strip' '!debug')

source_x86_64=(
  "kilo-desktop-${pkgver}-x86_64.deb::https://autoupdate.desktop.anaconda.com/kilo-desktop/latest/latest/linux/x64/kilo-desktop.deb"
)
source_aarch64=(
  "kilo-desktop-${pkgver}-aarch64.deb::https://autoupdate.desktop.anaconda.com/kilo-desktop/latest/latest/linux/arm64/kilo-desktop.deb"
)
sha256sums_x86_64=('5d9d8b00ac958cba8722bce54eefc502a6fa092a5dad27cf34984800ed388b81')
sha256sums_aarch64=('bfb33efa531a4a4ac1ae997403aa0e0eaed094bb41ca0ce497aea775bed91b71')
noextract=(
  "kilo-desktop-${pkgver}-x86_64.deb"
  "kilo-desktop-${pkgver}-aarch64.deb"
)

build() {
  local _deb
  case "${CARCH}" in
    x86_64) _deb="kilo-desktop-${pkgver}-x86_64.deb" ;;
    aarch64) _deb="kilo-desktop-${pkgver}-aarch64.deb" ;;
    *) printf 'unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
  esac

  rm -rf "${srcdir}/deb" "${srcdir}/payload"
  install -dm755 "${srcdir}/deb" "${srcdir}/payload"
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}/deb"
  bsdtar -xf "${srcdir}/deb/data.tar.xz" -C "${srcdir}/payload"

  # pkgver embeds the packaging date; upstream bumps the real version rarely.
  # If the control version moves, tell the maintainer instead of mislabelling.
  local _controlver
  _controlver="$(bsdtar -xOf "${srcdir}/deb/control.tar.xz" ./control \
    | sed -n 's/^Version: //p')"
  if [ "${_controlver}" != "${_appver}" ]; then
    echo "error: upstream version is ${_controlver}, expected ${_appver}; update _appver/_builddate/sha256sums" >&2
    return 1
  fi

  # The Electron runtime, app.asar and every unpacked native module are
  # vendored; verify the runtime we ship is the one the native code expects.
  local _electron
  _electron="$(cat "${srcdir}/payload/usr/lib/kilo-desktop/version")"
  if [ "${_electron}" != "45.1.0" ]; then
    echo "error: unexpected Electron runtime ${_electron}; re-audit native modules" >&2
    return 1
  fi
}

package() {
  install -dm755 "${pkgdir}/opt/kilo-desktop"
  cp -a "${srcdir}/payload/usr/lib/kilo-desktop/." "${pkgdir}/opt/kilo-desktop/"
  chmod 4755 "${pkgdir}/opt/kilo-desktop/chrome-sandbox"

  # CHROME_DESKTOP keeps the Wayland app_id and the X11 WM_CLASS tied to the
  # desktop file name, so the launcher and the task bar group correctly.
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/kilo-desktop" <<'LAUNCHER'
#!/bin/sh
unset ELECTRON_RUN_AS_NODE
export CHROME_DESKTOP='kilo-desktop.desktop'
exec /opt/kilo-desktop/kilo-desktop "$@"
LAUNCHER

  install -Dm644 "${srcdir}/payload/usr/share/applications/kilo-desktop.desktop" \
    "${pkgdir}/usr/share/applications/kilo-desktop.desktop"
  install -Dm644 "${srcdir}/payload/usr/share/pixmaps/kilo-desktop.png" \
    "${pkgdir}/usr/share/pixmaps/kilo-desktop.png"
  install -Dm644 "${srcdir}/payload/usr/share/pixmaps/kilo-desktop.png" \
    "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/kilo-desktop.png"
  install -Dm644 "${srcdir}/payload/usr/share/doc/kilo-desktop/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
