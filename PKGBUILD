# Maintainer: Javier Tia <floss@jetm.me>
# Contributor: Chris Speck <chris.speck(at)annalise(dot)ai>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Fork of the AUR `slack-desktop-wayland`, which trails upstream by several
# releases. The -jetm suffix is what keeps this installable: `provides` and
# `conflicts` alone still let a `slack-desktop-wayland` upgrade take the slot.
#
# Ships Slack's own bundled Electron and launches it as a native Wayland client.
# An earlier revision ran the deb's app.asar under the system electron44 package
# to dodge the Electron 44.0.0 tray regression (electron/electron#52674,
# #53213, fixed in 44.1.0). Slack 4.53 bundles Electron 45.1.0, which carries
# that fix, and Arch has no electron45 package, so the swap no longer pays for
# the lag it causes.
pkgname=slack-desktop-wayland-jetm
_debname=slack-desktop
pkgver=4.53.276
pkgrel=1
pkgdesc='Slack Desktop (Beta) for Linux, launched as a native Wayland client'
arch=('x86_64')
url='https://slack.com/downloads'
license=('LicenseRef-Slack')

# gtk3, libsecret, libxss, nss and xdg-utils match the AUR `slack-desktop`
# package. xdg-desktop-portal is what separates this package from plain
# `slack-desktop`: under Wayland both the screen picker and the file chooser
# go through it, and libpipewire is what the screen capture reads from.
depends=('gtk3' 'libsecret' 'libxss' 'nss' 'xdg-utils'
         'libnotify' 'libpipewire' 'xdg-desktop-portal')
optdepends=('libappindicator-gtk3: Systray indicator support'
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

# Slack's own *.node native modules and its Electron binary are prebuilt vendor
# binaries - stripping them can break them. Also suppresses the debug package
# on its own - makepkg gates that on `debug` AND `strip`.
options=('!strip')

source=("https://downloads.slack-edge.com/desktop-releases/linux/x64/${pkgver}/${_debname}-${pkgver}-amd64.deb")
noextract=("${_debname}-${pkgver}-amd64.deb")
b2sums=('153e908075e45f00c7ecbbfffb8289260989bf6ac2978e324726339bdcbb83d7d748f81eb8b91d77cea4fd44a8e79e18390860cb3779e218cee91aa263ca5c60')

package() {
  bsdtar -O -xf "${srcdir}/${_debname}-${pkgver}-amd64.deb" 'data.tar.*' |
    bsdtar -C "${pkgdir}" -xf -

  # Refuse to ship a headless package. With the unpacked native modules
  # missing, Slack starts, draws no window, registers no tray icon and logs
  # nothing - a failure that only surfaces after install.
  local _natmod="${pkgdir}/usr/lib/slack/resources/app.asar.unpacked/node_modules/@tinyspeck/slack-desktop-utils/lib/binding/napi-v8/slackdesktoputils.node"
  [[ -f $_natmod ]] || {
    echo 'error: native modules missing under app.asar.unpacked after extraction' >&2
    return 1
  }

  find "${pkgdir}" -type d -exec chmod 755 {} +

  # The deb's apt-repo cron job, lintian overrides and docs have no use here.
  rm -rf "${pkgdir}/etc" \
         "${pkgdir}/usr/lib/slack/src" \
         "${pkgdir}/usr/share/lintian" \
         "${pkgdir}/usr/share/doc"

  # Rewrite the launcher in place instead of carrying a context diff, which
  # breaks every time upstream reflows this file. The grep restores the
  # fail-loud property a patch would have given, since sed exits 0 when it
  # matches nothing.
  #
  # --ozone-platform=wayland is the entire reason this package exists. Slack's
  # own Electron build ships neither --ozone-platform-hint nor
  # ELECTRON_OZONE_PLATFORM_HINT, so with no switch it lands on XWayland.
  #
  # Icon=slack rather than the absolute /usr/share/pixmaps path upstream
  # ships, so an icon theme can override it.
  local _desktop="${pkgdir}/usr/share/applications/slack.desktop"
  local _exec='Exec=/usr/bin/slack --ozone-platform=wayland %U'
  sed -i -e "s|^Exec=.*|${_exec}|" -e 's|^Icon=.*|Icon=slack|' "$_desktop"
  if ! grep -qxF "$_exec" "$_desktop" || ! grep -qxF 'Icon=slack' "$_desktop"; then
    echo 'error: slack.desktop rewrite did not apply' >&2
    return 1
  fi

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  mv "${pkgdir}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
