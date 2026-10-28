# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: ArkFlame Studios <maintainers@arkflame.dev>

pkgname=flamewm-bin
pkgver=0.1.2b
pkgrel=1
pkgdesc='Fast Rust X11 window manager and desktop session, with a preliminary Wayland compositor'
arch=('x86_64')
url='https://wm.arkflame.com'
license=('LGPL-2.0-only' 'MIT' 'LGPL-3.0-or-later' 'GPL-3.0-only')
# bash and python run the session wrappers and the desktop-services companion.
# pam is loaded at runtime by the lock screen, not at link time. mesa provides
# libgbm, systemd-libs provides libudev, dbus provides libdbus-1.
# The X11 renderer and the Wayland compositor resolve Xft, fontconfig, Xrender,
# Xext, Xcursor, Xcomposite, Xdamage, XCB, EGL, GLES and libwayland through
# dlopen, so they never appear as NEEDED entries and are declared here.
# Upstream implements its own systemd-logind seat session, so neither libseat
# nor seatd is required; both upstream's Arch and Debian metadata confirm it.
depends=(
  'bash'
  'dbus'
  'fontconfig'
  # The .deb is built against a glibc newer than any Arch snapshot; the binaries
  # require GLIBC_2.43 and fail to start against an older one.
  'glibc>=2.43'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libinput'
  'libpulse'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxcursor'
  'libxdamage'
  'libxext'
  'libxft'
  'libxi'
  'libxkbcommon'
  'libxrender'
  'mesa'
  'pam'
  'python'
  'systemd-libs'
  'wayland'
  'xorg-xwayland'
)
optdepends=(
  'ark: archive extraction from Explorer'
  'dex: XDG autostart entries'
  'dunst: notification daemon for the session'
  'ffmpeg: screen recording'
  'imagemagick: desktop Convert wheel'
  'kwallet-pam: unlock KWallet at login'
  'libnotify: Explorer notifications'
  'libxkbcommon-x11: nested compositor session inside X11'
  'polkit-kde-agent: authentication agent for privileged actions'
  'ttf-ibm-plex: default interface font (falls back to Noto Sans or DejaVu Sans)'
  'udisks2: mount removable drives from Explorer'
  'xdg-desktop-portal-gtk: fallback portal backend'
  'xdg-desktop-portal-kde: preferred OpenURI and FileChooser portal backend'
  'xdg-utils: open files and links with their default applications'
  'xorg-xprop: deferred XDG autostart after the window manager is ready'
  'xorg-xrandr: display layout settings and restore at login'
)
provides=('flamewm')
# The bundled McMojave cursor theme owns /usr/share/icons/McMojave-cursors,
# which the AUR packages of the same theme also install.
conflicts=('flamewm' 'flamewm-git' 'mcmojave-cursors' 'mcmojave-cursors-git')
# Prebuilt release binaries: upstream strips their symbols, so a -debug package
# would carry no information.
options=('!debug')
backup=('etc/pam.d/flamewm-lock' 'etc/xdg/menus/flamewm-applications.menu')

latestver() {
  gh api repos/ArkFlame/flamewm/releases/latest --jq '.tag_name'
}

# The release tag carries a revision letter that the .deb filename does not:
# tag 0.1.2b publishes flamewm_0.1.2_amd64.deb. pkgver keeps the tag, because
# consecutive revisions are separately built and are byte-different payloads
# under the same .deb filename.
_debver=${pkgver%[a-z]}

source=(
  "flamewm-${pkgver}-amd64.deb::https://github.com/ArkFlame/flamewm/releases/download/${pkgver}/flamewm_${_debver}_amd64.deb"
  "flamewm-lock.pam::https://raw.githubusercontent.com/ArkFlame/flamewm/${pkgver}/packaging/arch/flamewm-lock.pam"
)
sha256sums=('c436546d075421f3ac2cf741aaf6367905f4a8c1c53ecf12ff81039b86053bf0'
            '2f9b7a7a8a8583ed40969240ee7d0d42ffba4a44b69a7d241bd60634795a8e84')

package() {
  bsdtar -xf "${srcdir}/flamewm-${pkgver}-amd64.deb" data.tar.zst
  bsdtar -xf data.tar.zst -C "${pkgdir}"

  # The .deb stores directories 0775 and data files 0664; Arch expects 0755 and
  # 0644, and pacman -Qkk reports every group-writable directory as altered.
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -perm -u+x -exec chmod 755 {} +
  find "${pkgdir}" -type f ! -perm -u+x -exec chmod 644 {} +

  # Arch has no /usr/libexec, and neither the binaries nor the wrappers name it
  # (the wrappers resolve their own directory from BASH_SOURCE), so only the two
  # session entries that exec them have to follow the move.
  install -d "${pkgdir}/usr/lib/flamewm"
  mv "${pkgdir}/usr/libexec/flamewm/"* "${pkgdir}/usr/lib/flamewm/"
  rmdir "${pkgdir}/usr/libexec/flamewm" "${pkgdir}/usr/libexec"
  sed -i 's|/usr/libexec/flamewm/|/usr/lib/flamewm/|' \
    "${pkgdir}/usr/share/xsessions/flamewm.desktop" \
    "${pkgdir}/usr/share/wayland-sessions/flamewm-wayland.desktop"

  # The .deb ships the Debian PAM include layout. Arch has no common-auth, so
  # the service must include system-auth or the lock screen cannot authenticate.
  install -Dm644 "${srcdir}/flamewm-lock.pam" "${pkgdir}/etc/pam.d/flamewm-lock"

  # Only the MIT component needs its text shipped; LGPL-2.0-only, LGPL-3.0-or-later
  # and GPL-3.0-only are provided by the licenses package. The remaining files
  # carry attribution for the bundled Breeze icons, cursors and the MIT renderer.
  local _l="${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/usr/share/doc/flamewm/LICENSES/RustWebRender-MIT.txt" \
    "${_l}/RustWebRender-MIT.txt"
  install -Dm644 "${pkgdir}/usr/share/flamewm/assets/cursors/COPYING-ICONS" \
    "${_l}/COPYING-ICONS-cursors"
  install -Dm644 "${pkgdir}/usr/share/flamewm/assets/cursors/AUTHORS" \
    "${_l}/AUTHORS-cursors"
  install -Dm644 "${pkgdir}/usr/share/flamewm/assets/web/breeze/COPYING-ICONS" \
    "${_l}/COPYING-ICONS-breeze"
  install -Dm644 "${pkgdir}/usr/share/doc/flamewm/copyright" "${_l}/copyright"

  local _binary
  for _binary in flamewm flamewm-apps flamewm-session flamewm-desktop flamewm-shell \
                 flamewm-settings flamewm-explorer flamewm-terminal flamewm-screenshot \
                 flamewm-lock flamewm-wayland flamewm-render-x11 flamewm-render-compile \
                 flamewm-render-inspect; do
    [[ -x "${pkgdir}/usr/bin/${_binary}" ]] || {
      echo "flamewm-bin: /usr/bin/${_binary} is missing from the upstream payload" >&2
      return 1
    }
  done
  [[ -d "${pkgdir}/usr/libexec" ]] && {
    echo 'flamewm-bin: payload still installs into /usr/libexec' >&2
    return 1
  }
  grep -qx 'auth       include      system-auth' "${pkgdir}/etc/pam.d/flamewm-lock" || {
    echo 'flamewm-bin: PAM service is not the system-auth layout' >&2
    return 1
  }
}
