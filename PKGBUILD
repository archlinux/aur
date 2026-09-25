# Maintainer: Javier Tia <floss@jetm.me>
# Contributor: Chris Speck <chris.speck(at)annalise(dot)ai>
# Contributor: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

# Fork of the AUR `slack-desktop-wayland`, which trails upstream by several
# releases. The -jetm suffix is what keeps this installable: `provides` and
# `conflicts` alone still let a `slack-desktop-wayland` upgrade take the slot.
pkgname=slack-desktop-wayland-jetm
_debname=slack-desktop
pkgver=4.52.162
pkgrel=1
pkgdesc='Slack Desktop (Beta) for Linux, launched as a native Wayland client on the system Electron package'
arch=('x86_64')
url='https://slack.com/downloads'
license=('LicenseRef-Slack')

# Runs the deb's own app.asar under the system electron<N> package instead of
# Slack's bundled Electron binary. Slack 4.52.155 bundles Electron 44.0.0,
# which carries a since-fixed upstream Linux tray/StatusNotifierItem
# regression (electron/electron#52674, #53213): the SNI object it registers
# on hide comes back with empty introspection and the D-Bus connection drops
# outright, so a hidden window has no tray icon to click back - matching
# KDE Bug 524697 against this exact Slack version. Fixed upstream in Electron
# 44.1.0 (electron/electron#53214); the `extra` repo's electron44 is 44.4.2 as
# of this writing, well past it. `slack-electron` in the AUR already proves
# this swap works (34 votes) - this package folds the same technique into the
# one already carrying the Wayland fix below, rather than adopting a second
# package with no Wayland hook to patch against.
_electronver=44

# Slack's own native code (the *.node modules under app.asar.unpacked) needs
# these directly, independent of which Electron binary hosts them - dlopen
# calls carry no DT_NEEDED entry, so they don't show up in the binary's own
# dependency list. glibc/libstdc++/libx11/libxkbfile match the AUR
# `slack-electron` package's own vetted set for the same reason: Slack's
# native modules link them directly, not by way of electron44's dependency
# graph. xdg-desktop-portal is what separates this package from plain
# `slack-desktop`: under Wayland both the screen picker and the file chooser
# go through it.
depends=("electron${_electronver}" 'glibc' 'libstdc++' 'libx11' 'libxkbfile'
         'libnotify' 'libpipewire' 'libsecret'
         'xdg-desktop-portal' 'xdg-utils')
optdepends=('org.freedesktop.secrets: keyring password store'
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

# Slack's own *.node native modules under app.asar.unpacked are prebuilt
# vendor binaries - stripping them can break them. This package no longer
# carries a compiled Electron binary of its own to strip (electron44 hosts
# the app.asar instead), but the *.node modules still need this. Also
# suppresses the debug package on its own - makepkg gates that on `debug`
# AND `strip`.
options=('!strip')

source=("https://downloads.slack-edge.com/desktop-releases/linux/x64/${pkgver}/${_debname}-${pkgver}-amd64.deb")
noextract=("${_debname}-${pkgver}-amd64.deb")
b2sums=('58be09bb5f84f9d3520d630137d7cf3a1a68180cb72486701c9f9e7dadcc23de524f41615c12ac7689066ebe03c84f81cab859cc9b9b0731147343541055872a')

_archive="${_debname}-${pkgver}"

prepare() {
  # Extracted to a scratch tree rather than straight into $pkgdir: package()
  # below installs an explicit allowlist (resources/, locales/, the few
  # top-level files Slack's own code reads at runtime), not "everything minus
  # a few directories" - the deb also carries Slack's own bundled Electron
  # binary, its setuid chrome-sandbox helper, and its private copies of
  # Chromium's *.pak/icudtl.dat/v8 snapshot files, none of which this package
  # ships once electron44 is what actually runs the app.
  mkdir -p "${_archive}"
  bsdtar -O -xf "${srcdir}/${_debname}-${pkgver}-amd64.deb" 'data.tar.*' |
    bsdtar -C "${_archive}" -xf -

  # Refuse to build against a deb whose own Electron major does not match
  # _electronver: the app.asar was built and tested against exactly one
  # Electron major, and this package's whole point is running it under a
  # different point release of that SAME major, not a different one.
  grep -q "^${_electronver}" "${_archive}/usr/lib/slack/version" || {
    echo "error: deb's Electron major (usr/lib/slack/version) does not match _electronver=${_electronver}" >&2
    return 1
  }

  # Refuse to ship a headless package. With the unpacked native modules
  # missing, Slack starts, draws no window, registers no tray icon and logs
  # nothing - a failure that only surfaces after install.
  local _natmod="${_archive}/usr/lib/slack/resources/app.asar.unpacked/node_modules/@tinyspeck/slack-desktop-utils/lib/binding/napi-v8/slackdesktoputils.node"
  [[ -f $_natmod ]] || {
    echo 'error: native modules missing under app.asar.unpacked after extraction' >&2
    return 1
  }

  # Rewrite the launcher in place instead of carrying a context diff, which
  # breaks every time upstream reflows this file. The grep restores the
  # fail-loud property a patch would have given, since sed exits 0 when it
  # matches nothing.
  #
  # --ozone-platform=wayland stays here, not in the /usr/bin/slack wrapper
  # below - it's the entire reason this package exists. Slack's own Electron
  # build ships neither --ozone-platform-hint nor
  # ELECTRON_OZONE_PLATFORM_HINT, so with no switch it lands on XWayland, and
  # electron44's own bundled Chromium defaults the same way.
  #
  # Icon=slack rather than the absolute /usr/share/pixmaps path upstream
  # ships, so an icon theme can override it.
  local _desktop="${_archive}/usr/share/applications/slack.desktop"
  local _exec='Exec=/usr/bin/slack --ozone-platform=wayland -s %U'
  sed -i -e "s|^Exec=.*|${_exec}|" -e 's|^Icon=.*|Icon=slack|' "$_desktop"
  if ! grep -qxF "$_exec" "$_desktop" || ! grep -qxF 'Icon=slack' "$_desktop"; then
    echo 'error: slack.desktop rewrite did not apply' >&2
    return 1
  fi
}

package() {
  install -vdm755 "${pkgdir}/usr/lib/slack/resources/"
  cp -va -t "${pkgdir}/usr/lib/slack/resources/" "${_archive}"/usr/lib/slack/resources/*

  install -vdm755 "${pkgdir}/usr/lib/slack/locales/"
  cp -va -t "${pkgdir}/usr/lib/slack/locales/" "${_archive}"/usr/lib/slack/locales/*

  install -vDm644 -t "${pkgdir}/usr/lib/slack" \
    "${_archive}/usr/lib/slack/LICENSES-linux.json" \
    "${_archive}/usr/lib/slack/resources.pak" \
    "${_archive}/usr/lib/slack/version"

  # This package's own launcher, not the deb's: the deb's /usr/bin/slack is a
  # symlink straight to its bundled Electron binary (usr/lib/slack/slack),
  # which is intentionally not installed above - electron44 hosts the
  # app.asar instead. Forwards "$@" untouched so the Wayland flag rewritten
  # into slack.desktop's Exec above, and any flags a caller passes directly
  # (e.g. this host's Hyprland keybind), still reach Chromium unchanged.
  install -vDm755 /dev/stdin "${pkgdir}/usr/bin/slack" <<-EOF
	#!/bin/sh
	exec electron${_electronver} /usr/lib/slack/resources/app.asar "\$@"
	EOF

  install -vDm644 -t "${pkgdir}/usr/share/applications" "${_archive}/usr/share/applications/slack.desktop"
  install -vDm644 -t "${pkgdir}/usr/share/pixmaps" "${_archive}/usr/share/pixmaps/slack.png"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm644 "${_archive}/usr/lib/slack/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/lib/slack/LICENSE"
}
