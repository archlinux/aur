# Maintainer: Javier Tia <floss@jetm.me>
# Contributor: Chris Speck <chris.speck(at)annalise(dot)ai>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Fork of the AUR `slack-desktop-wayland`, which trails upstream by several
# releases. The -jetm suffix is what keeps this installable: `provides` and
# `conflicts` alone still let a `slack-desktop-wayland` upgrade take the slot.
pkgname=slack-desktop-wayland-jetm
_debname=slack-desktop
pkgver=4.51.191
pkgrel=1
pkgdesc='Slack Desktop (Beta) for Linux, launched as a native Wayland client'
arch=('x86_64')
url='https://slack.com/downloads'
license=('LicenseRef-Slack')

# Direct DT_NEEDED of the shipped binary, minus what gtk3 already pulls
# transitively (cairo, pango, glib2, at-spi2-core, mesa, libcups, dbus, expat,
# systemd-libs and the libX* stack). libsecret, libnotify and libpipewire carry
# no NEEDED entry - Electron dlopen()s all three, so they appear only as
# literal sonames inside the binary.
#
# xdg-desktop-portal is what separates this package from plain `slack-desktop`:
# under Wayland both the screen picker and the file chooser go through it.
depends=('alsa-lib' 'gtk3' 'libnotify' 'libpipewire' 'libsecret' 'nss'
         'xdg-desktop-portal' 'xdg-utils')
optdepends=('libappindicator-gtk3: system tray icon'
            'org.freedesktop.secrets: keyring password store'
            'pipewire: PipeWire daemon, required for screen sharing'
            'xdg-desktop-portal-gnome: portal backend for GNOME'
            'xdg-desktop-portal-gtk: portal backend for GNOME and GTK'
            'xdg-desktop-portal-hyprland: portal backend for Hyprland'
            'xdg-desktop-portal-kde: portal backend for KDE'
            'xdg-desktop-portal-lxqt: portal backend for LXQt'
            'xdg-desktop-portal-wlr: portal backend for wlroots compositors')

provides=("slack-desktop=${pkgver}")
conflicts=('slack-desktop' 'slack-desktop-wayland' 'slack-electron')
replaces=('slack-desktop-wayland')

# Repackaging a prebuilt vendor binary: stripping Slack's bundled Electron and
# *.node modules can break them and buys nothing here. This also suppresses the
# debug package on its own - makepkg gates that on `debug` AND `strip`.
options=('!strip')

source=("https://downloads.slack-edge.com/desktop-releases/linux/x64/${pkgver}/${_debname}-${pkgver}-amd64.deb")
noextract=("${_debname}-${pkgver}-amd64.deb")
b2sums=('d06a3a0880f776ccf702481bd0009da0ec60d250811ded0c7cc654678b0bcfe97c2d8e75f9e2d54938ff1b4d04d741a7afb4f19714e885de06ed6dbb116d8dcf')

package() {
  # Match data.tar.* rather than data.tar.xz: Debian tooling has been moving
  # payloads to zstd, and a hardcoded suffix would turn that into an empty
  # package rather than a build failure. makepkg does not set pipefail, so a
  # failure in the first bsdtar is invisible here too - the native-module check
  # below is what catches both.
  bsdtar -O -xf "${srcdir}/${_debname}-${pkgver}-amd64.deb" 'data.tar.*' |
    bsdtar -C "${pkgdir}" -xf -

  # Refuse to ship a headless package. With the unpacked native modules
  # missing, Slack starts, draws no window, registers no tray icon and logs
  # nothing - a failure that only surfaces after install.
  local _natmod="${pkgdir}/usr/lib/slack/resources/app.asar.unpacked/node_modules/@tinyspeck/slack-desktop-utils/lib/binding/napi-v8/slackdesktoputils.node"
  if [[ ! -f $_natmod ]]; then
    echo 'error: native modules missing under app.asar.unpacked after extraction' >&2
    return 1
  fi

  # Rewrite the launcher in place instead of carrying a context diff, which
  # breaks every time upstream reflows this file. The grep restores the
  # fail-loud property a patch would have given, since sed exits 0 when it
  # matches nothing.
  #
  # --ozone-platform=wayland is the entire reason this package exists. Slack's
  # Electron build ships neither --ozone-platform-hint nor
  # ELECTRON_OZONE_PLATFORM_HINT, so with no switch it lands on XWayland.
  #
  # Icon=slack rather than the absolute /usr/share/pixmaps path upstream ships,
  # so an icon theme can override it.
  local _desktop="${pkgdir}/usr/share/applications/slack.desktop"
  local _exec='Exec=/usr/bin/slack --ozone-platform=wayland -s %U'
  sed -i -e "s|^Exec=.*|${_exec}|" -e 's|^Icon=.*|Icon=slack|' "$_desktop"
  if ! grep -qxF "$_exec" "$_desktop" || ! grep -qxF 'Icon=slack' "$_desktop"; then
    echo 'error: slack.desktop rewrite did not apply' >&2
    return 1
  fi

  # The deb ships some directories 0700.
  find "${pkgdir}" -type d -exec chmod 755 {} +

  # /etc holds an apt sources.list.d entry; src/ is Slack's own build tree.
  rm -rf "${pkgdir}/etc" \
    "${pkgdir}/usr/lib/slack/src" \
    "${pkgdir}/usr/share/lintian" \
    "${pkgdir}/usr/share/doc"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
