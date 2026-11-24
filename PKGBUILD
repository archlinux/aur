# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/config>
# Package: hornero-config - curated HorneroOS desktop defaults.
# Profile selection: HORNERO_PROFILE=base (default and only shipped composition).
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=hornero-config
pkgver=0.4.10
pkgrel=1
pkgdesc="HorneroOS curated desktop defaults: Hornero Signal themes, compositor, terminal, GTK/Qt, fonts, XDG handlers"
arch=('any')
url="https://github.com/HorneroOS/config"
license=('MIT' 'CC-BY-2.0' 'LicenseRef-owner-curated-unverified')
# LicenseRef-owner-curated-unverified: 54 owner-curated wallpapers ship with
# license unknown / unverified (see wallpaper-collection.json); only the
# three CC-BY-2.0 photographs in wallpaper-provenance.json are verified.
# python: lib/hornero/signal_theme.py + signal_render.py render every native
# theme format from the schema-v2 roles at apply time (stdlib only).
# ttf-ibm-plex: RFC 0001 §3.3 families (IBM Plex Sans / Mono / Sans Condensed)
# named by GTK, Qt, Kitty, fontconfig and hyprlock defaults.
# polkit-gnome: both compositor configs autostart its authentication agent
# (Hyprland autostart.lua, Niri spawn-at-startup); without it no agent is
# registered and every pkexec flow fails with "No session for cookie"
# (hornero#366). Hard dependency so existing installs gain the agent on the
# next hornero-config update, not only fresh installs via the catalogue.
depends=('bash' 'git' 'polkit-gnome' 'python' 'ttf-ibm-plex')
makedepends=('librsvg')
optdepends=(
  'hyprland: compositor defaults under /etc/xdg/hypr'
  'niri: compositor defaults in /etc/niri (fallback) and ~/.config/niri'
  'xdg-desktop-portal-gtk: default fallback portal and file chooser for Niri sessions'
  'xdg-desktop-portal-gnome: screencasting portal for Niri sessions'
  'xwayland-satellite: XWayland bridge for Niri sessions'
  'kitty: terminal defaults under /etc/xdg/kitty'
  'alacritty: optional terminal with factory defaults under /etc/alacritty'
  'ghostty: optional terminal; Hornero defaults are seeded for new users and themes are installed system-wide'
  'exo: Hornero default application launcher and TerminalEmulator helper'
  'gtk3: GTK 3 defaults under /etc/xdg/gtk-3.0'
  'fontconfig: font defaults under /etc/xdg/fontconfig'
  'fastfetch: system info defaults under /etc/xdg/fastfetch'
  'btop: monitor defaults under /etc/xdg/btop'
  'cava: visualizer defaults under /etc/xdg/cava'
  'thunar: file manager defaults under /etc/xdg/Thunar'
  'copyq: clipboard defaults under /etc/xdg/copyq'
  'handlr: default-application handler under /etc/xdg/handlr'
  'qt6ct: Qt6 platform-theme defaults under /etc/xdg/qt6ct'
  'qt5ct: Qt5 platform-theme defaults under /etc/xdg/qt5ct'
  'bluez: Bluetooth daemon (factory main.conf template under /usr/share/hornero/bluetooth)'
  'bluez-utils: bluetoothctl for Bluetooth diagnostics'
  'wireplumber: Bluetooth audio policy under /etc/wireplumber/wireplumber.conf.d'
  'papirus-icon-theme: Papirus-Dark factory icons'
  'noto-fonts-cjk: CJK fallback for the factory fontconfig aliases'
  'noto-fonts-emoji: emoji fallback for the factory fontconfig aliases'
  'grub: themed boot menu (run hornero-boot-theme apply --grub; theme files ship inert without it)'
  'plymouth: themed boot splash (run hornero-boot-theme apply --plymouth; optional, boot is unchanged without it)'
  'zsh-autosuggestions: optional plugin sourced by the factory zshrc when installed'
  'zsh-syntax-highlighting: optional plugin sourced by the factory zshrc when installed'
  'gvfs: Thunar volume and trash integration'
  'tumbler: Thunar thumbnail service'
  'ffmpegthumbnailer: video thumbnails for Thunar via tumbler'
  'thunar-volman: removable-media handling for Thunar'
  'nm-connection-editor: NetworkManager connection editor'
)
# Named "config" (not "$pkgname") so the checkout lands at
# "${srcdir}/config", matching _hornero_repo_root() below and keeping
# AUR chroot builds identical to local packaging/ builds.
install=hornero-config.install
backup=('etc/wireplumber/wireplumber.conf.d/51-hornero-bluetooth.conf')
source=("config::git+https://github.com/HorneroOS/config.git#commit=59dfd26e2e65eeac66b53fcfc299df034e3a6c8b")
sha256sums=('SKIP')

# Locate the checkout root both when building from a local clone
# (makepkg run inside packaging/) and when built from an exported source.
_hornero_repo_root() {
  if [[ -x "${startdir}/../scripts/materialize.sh" ]]; then
    printf '%s' "${startdir}/.."
  elif [[ -x "${srcdir}/config/scripts/materialize.sh" ]]; then
    printf '%s' "${srcdir}/config"
  else
    echo "error: cannot locate scripts/materialize.sh" >&2
    return 1
  fi
}

# Resolve HORNERO_PROFILE to the profile manifest shipped by this package.
# Prints "<requested-name>:<manifest-relative-path>".
_hornero_profile_manifest() {
  local profile="${HORNERO_PROFILE:-base}"
  case "$profile" in
    base)
      printf '%s:%s' "$profile" "profiles/base/profile.toml"
      ;;
    *)
      echo "error: unknown HORNERO_PROFILE='$profile' (want base)" >&2
      return 1
      ;;
  esac
}

package() {
  local repo_root stage profile_info profile_name profile_src
  repo_root="$(_hornero_repo_root)"

  # Packaging-time personal-data check: fail the build on leaked
  # identity or secrets (the no-identity guarantee).
  bash "$repo_root/scripts/guard-personal-data.sh"

  profile_info="$(_hornero_profile_manifest)"
  profile_name="${profile_info%%:*}"
  profile_src="${profile_info#*:}"
  if [[ ! -f "$repo_root/$profile_src" ]]; then
    echo "error: profile manifest missing: $profile_src" >&2
    return 1
  fi

  # Reuse the canonical install mapping instead of duplicating it:
  # materialize into a staging HOME, then rearrange that staged HOME
  # into the system layout below. Per-application file lists live
  # only in scripts/materialize.sh.
  stage="${srcdir}/stage-home"
  rm -rf "$stage"
  mkdir -p "$stage"
  bash "$repo_root/scripts/materialize.sh" --dest "$stage"

  install -dm755 "$pkgdir/etc/xdg" "$pkgdir/etc/alacritty" \
    "$pkgdir/etc/skel/.config/ghostty/themes" "$pkgdir/usr/share/ghostty/themes" \
    "$pkgdir/usr/share/hornero/bin" \
    "$pkgdir/usr/share/hornero/profiles/base"

  # Staged per-user config -> system-wide XDG defaults. This loop is
  # generic on purpose: new modules picked up by materialize.sh flow
  # through here with no per-application list to keep in sync.
  local entry base
  for entry in "$stage"/.config/*; do
    [[ -e "$entry" ]] || continue
    base="$(basename "$entry")"
    # Niri reads /etc/niri/config.kdl as its system fallback, not
    # /etc/xdg/niri. Install it once below at the upstream-owned path.
    [[ "$base" == niri ]] && continue
    # Alacritty's system fallback is /etc/alacritty/alacritty.toml; it does
    # not search /etc/xdg. Ghostty has no global config lookup, so its curated
    # config is seeded for newly created users below.
    [[ "$base" == alacritty || "$base" == ghostty ]] && continue
    # WirePlumber reads /etc/wireplumber, not /etc/xdg/wireplumber; its
    # staged user copy is installed once below at the system path.
    [[ "$base" == wireplumber ]] && continue
    if [[ "$base" == systemd ]]; then
      # systemd owns /etc/xdg/systemd/user as a symlink to /etc/systemd/user.
      # Putting a directory at that XDG path makes pacman refuse the package.
      # User-unit masks are system-wide defaults, so install only those files
      # at systemd's real user-unit configuration path.
      if [[ -d "$entry/user" ]]; then
        mkdir -p "$pkgdir/etc/systemd/user"
        cp -a "$entry/user/." "$pkgdir/etc/systemd/user/"
      fi
      continue
    fi
    if [[ -d "$entry" ]]; then
      mkdir -p "$pkgdir/etc/xdg/$base"
      cp -a "$entry/." "$pkgdir/etc/xdg/$base/"
    else
      install -Dm644 "$entry" "$pkgdir/etc/xdg/$base"
    fi
  done

  # btop searches its package-wide themes under /usr/share/btop/themes; it
  # does not use /etc/xdg/btop/themes as a system theme directory. Keep the
  # staged XDG copy for per-user materialization and install a recognized
  # factory fallback for package-only systems.
  install -Dm644 "$stage/.config/btop/themes/Hornero Dynamic.theme" \
    "$pkgdir/usr/share/btop/themes/Hornero Dynamic.theme"

  # btop and Cava read user configuration rather than /etc/xdg defaults.
  # Seed new accounts with the curated configs; Cava resolves themes only
  # from its user config directory, while btop also has the system fallback
  # installed above.
  install -Dm644 "$stage/.config/btop/btop.conf" \
    "$pkgdir/etc/skel/.config/btop/btop.conf"
  install -Dm644 "$stage/.config/cava/config" \
    "$pkgdir/etc/skel/.config/cava/config"
  install -Dm644 "$stage/.config/cava/themes/Hornero Dynamic" \
    "$pkgdir/etc/skel/.config/cava/themes/Hornero Dynamic"

  # Factory Zsh baseline + editor contract for new accounts (skel).
  install -Dm644 "$stage/.zshrc" "$pkgdir/etc/skel/.zshrc"
  install -Dm644 "$stage/.config/environment.d/10-hornero-editor.conf" \
    "$pkgdir/etc/skel/.config/environment.d/10-hornero-editor.conf"
  install -Dm644 "$stage/.config/environment.d/20-hornero-session.conf" \
    "$pkgdir/etc/skel/.config/environment.d/20-hornero-session.conf"

  # Hyprland's factory config imports modules from the user's XDG config
  # directory. Seed new accounts with that complete profile so the first
  # compositor session does not start with missing-source errors.
  mkdir -p "$pkgdir/etc/skel/.config"
  cp -a "$stage/.config/hypr" "$pkgdir/etc/skel/.config/"

  # Niri reads /etc/niri/config.kdl as its system fallback after the user's
  # XDG config. Keep one source file: materialize.sh also places it in the
  # staged HOME for chezmoi and package-only user setup.
  if [[ ! -f "$stage/.config/niri/config.kdl" ]]; then
    echo "error: staged Niri config missing" >&2
    return 1
  fi
  install -Dm644 "$stage/.config/niri/config.kdl" \
    "$pkgdir/etc/niri/config.kdl"

  # Bluetooth audio policy: WirePlumber's system drop-in directory.
  install -Dm644 "$stage/.config/wireplumber/wireplumber.conf.d/51-hornero-bluetooth.conf" \
    "$pkgdir/etc/wireplumber/wireplumber.conf.d/51-hornero-bluetooth.conf"

  # BlueZ factory template. Arch's bluez package owns
  # /etc/bluetooth/main.conf, so this package must not ship that path;
  # an admin installs the template there once (see the file header).
  # The staged per-user copy under .config/hornero/bluetooth also lands
  # in /etc/xdg/hornero/bluetooth via the generic loop above.
  install -Dm644 "$repo_root/desktop/bluetooth/main.conf" \
    "$pkgdir/usr/share/hornero/bluetooth/main.conf"

  # Enable bluetooth.service through the systemd preset mechanism only
  # (packaging/hornero-config.install runs `systemctl preset`).
  install -Dm644 "$repo_root/desktop/systemd/90-hornero-bluetooth.preset" \
    "$pkgdir/usr/lib/systemd/system-preset/90-hornero-bluetooth.preset"

  # Alacritty's documented system fallback uses /etc/alacritty. The user
  # config from materialize.sh stays XDG-aware for chezmoi installs.
  for file in alacritty.toml hornero-signal-night.toml hornero-signal-day.toml hornero-colors.toml; do
    install -Dm644 "$stage/.config/alacritty/$file" \
      "$pkgdir/etc/alacritty/$file"
  done

  # Ghostty reads user XDG configuration only. Seed new accounts from skel;
  # existing users receive the same config via materialize/chezmoi. Theme
  # lookup checks the user's XDG themes before this system fallback.
  install -Dm644 "$stage/.config/ghostty/config.ghostty" \
    "$pkgdir/etc/skel/.config/ghostty/config.ghostty"
  install -Dm644 "$stage/.config/ghostty/themes/Hornero Dynamic" \
    "$pkgdir/usr/share/ghostty/themes/Hornero Dynamic"

  # Thunar ships /etc/xdg/Thunar/uca.xml itself. Packaging the staged user
  # custom actions there causes a pacman ownership conflict on Arch. The
  # same curated file remains in materialize.sh for per-user dotfile installs.
  rm -f "$pkgdir/etc/xdg/Thunar/uca.xml"

  # GTK 2 skeleton (per-user ~/.gtkrc-2.0 upstream, system default here).
  install -Dm644 "$stage/.gtkrc-2.0" "$pkgdir/etc/xdg/gtkrc-2.0"

  # Factory shell default (path-contract row 6): content owned by
  # HorneroOS/shell, packaged here to the system location. The user-root
  # ~/.config/hornero/shell.json is owned by the shell runtime and is
  # never materialized (see shell/README.md).
  if [[ ! -f "$repo_root/shell/shell.default.json" ]]; then
    echo "error: factory shell default missing: shell/shell.default.json" >&2
    return 1
  fi
  install -Dm644 "$repo_root/shell/shell.default.json" \
    "$pkgdir/etc/xdg/hornero/shell.json"
  # shell.json key migrations (hornero/shell-migrations@1), read by
  # `horneroctl update plan` so renamed settings never drop user values.
  install -Dm644 "$repo_root/shell/shell-migrations.json" \
    "$pkgdir/usr/share/hornero/shell-migrations.json"
  install -Dm644 "$repo_root/shell/shell-migrations.schema.json" \
    "$pkgdir/usr/share/hornero/shell-migrations.schema.json"

  # Implementation libraries, CLI adapters, and theme recipes.
  # Stage the canonical Hornero data and configuration paths.
  mkdir -p "$pkgdir/usr/share/hornero/lib"
  cp -a "$stage/.local/lib/hornero" "$pkgdir/usr/share/hornero/lib/hornero"
  cp -a "$stage/.local/bin"/hornero-* "$pkgdir/usr/share/hornero/bin/"
  mkdir -p "$pkgdir/usr/share/hornero/themes"
  cp -a "$stage/.local/share/hornero/themes/." "$pkgdir/usr/share/hornero/themes/"
  # Hornero Chromatic: first-party app templates rendered by horneroctl
  # (/usr/share/hornero/chromatic/templates/*.json + *.tmpl).
  mkdir -p "$pkgdir/usr/share/hornero/chromatic"
  cp -a "$stage/.local/share/hornero/chromatic/." "$pkgdir/usr/share/hornero/chromatic/"
  # Layout presets are authored by HorneroOS/shell and copied into this
  # package from the pinned source recorded in shell/shell-presets.source.
  # Ship them as a read-only system catalogue so horneroctl and the Shell work
  # on a clean package-only install without personal dotfiles.
  local presets_dir="$stage/.local/share/hornero/shell-presets"
  if [[ ! -d "$presets_dir" || -z $(find "$presets_dir" -maxdepth 1 -type f -name '*.json' -print -quit) ]]; then
    echo "error: staged Hornero shell preset catalogue is missing or empty" >&2
    return 1
  fi
  install -dm755 "$pkgdir/usr/share/hornero/shell-presets"
  install -m644 "$presets_dir"/*.json "$pkgdir/usr/share/hornero/shell-presets/"

  # Brand identity (vector sources only, never binaries). This block owns
  # /usr/share/hornero/brand exclusively. Coordination: config-gtk work owns
  # desktop/gtk-theme* + /usr/share/themes — this block touches neither.
  mkdir -p "$pkgdir/usr/share/hornero/brand"
  cp -a "$stage/.local/share/hornero/brand/." "$pkgdir/usr/share/hornero/brand/"
  # Hornero Signal GTK themes (standard lookup path, discoverable by GTK 3+4
  # with no extra env). Ownership: the generated Hornero-* trees own their
  # /usr/share/themes dirs exclusively — the recipe JSONs above own
  # /usr/share/hornero/themes and no file is shipped twice. Dev-only sources
  # (src/, gallery.py) never enter the stage.
  local tree
  for tree in "$repo_root"/desktop/gtk-theme/Hornero-*/; do
    tree="$(basename "$tree")"
    if [[ ! -f "$stage/.local/share/themes/$tree/gtk-3.0/gtk.css" ]] \
        || [[ ! -f "$stage/.local/share/themes/$tree/gtk-4.0/gtk.css" ]] \
        || [[ ! -f "$stage/.local/share/themes/$tree/index.theme" ]]; then
      echo "error: staged $tree theme tree incomplete" >&2
      return 1
    fi
  done
  mkdir -p "$pkgdir/usr/share/themes"
  cp -a "$stage/.local/share/themes"/Hornero-* \
        "$pkgdir/usr/share/themes/"
  # Hornero Signal wallpaper rasters (rendered by materialize.sh from vector
  # sources): the apply chain resolves them under hornero/wallpapers/.
  if [[ ! -f "$stage/.local/share/hornero/wallpapers/hornero-signal-night/hornero-signal-night-01.png" ]]; then
    echo "error: staged flagship wallpapers missing (rsvg-convert at build time?)" >&2
    return 1
  fi
  mkdir -p "$pkgdir/usr/share/hornero/wallpapers"
  cp -a "$stage/.local/share/hornero/wallpapers/." \
    "$pkgdir/usr/share/hornero/wallpapers/"


  # Boot themes (GRUB menu + Plymouth splash). Shipped inert at their
  # canonical theme paths; nothing edits boot configuration at install time.
  # `hornero-boot-theme apply` (bin/) enables them, and only when grub /
  # plymouth are installed. Plymouth is optional: no dependency is added.
  bash "$repo_root/scripts/render-boot-assets.sh" --out "$srcdir/boot-assets"
  install -dm755 "$pkgdir/usr/share/grub/themes" "$pkgdir/usr/share/plymouth/themes"
  cp -a "$srcdir/boot-assets/grub/hornero-signal" "$pkgdir/usr/share/grub/themes/hornero-signal"
  cp -a "$srcdir/boot-assets/plymouth/hornero-signal" "$pkgdir/usr/share/plymouth/themes/hornero-signal"
  find "$pkgdir/usr/share/grub/themes/hornero-signal" "$pkgdir/usr/share/plymouth/themes/hornero-signal" \
    -type d -exec chmod 755 {} + -o -type f -exec chmod 644 {} +

  # Profile manifests plus the resolved selection record.
  install -Dm644 "$repo_root/$profile_src" \
    "$pkgdir/usr/share/hornero/profiles/base/profile.toml"
  install -Dm644 "$repo_root/$profile_src" \
    "$pkgdir/usr/share/hornero/profile.toml"
  printf '%s\n' "$profile_name" > "$pkgdir/usr/share/hornero/HORNERO_PROFILE"

  # Permissions mirror scripts/materialize.sh: dirs 755, files 644,
  # with executables restored for CLI adapters.
  find "$pkgdir/etc/xdg" "$pkgdir/etc/alacritty" "$pkgdir/etc/skel" \
    "$pkgdir/etc/systemd/user" "$pkgdir/etc/wireplumber" \
    "$pkgdir/usr/lib/systemd/system-preset" \
    "$pkgdir/usr/share/hornero" "$pkgdir/usr/share/themes" \
    "$pkgdir/usr/share/ghostty/themes" \
    -type d -exec chmod 755 {} +
  find "$pkgdir/etc/xdg" "$pkgdir/etc/alacritty" "$pkgdir/etc/skel" \
    "$pkgdir/etc/systemd/user" "$pkgdir/etc/wireplumber" \
    "$pkgdir/usr/lib/systemd/system-preset" \
    "$pkgdir/usr/share/hornero" "$pkgdir/usr/share/themes" \
    "$pkgdir/usr/share/ghostty/themes" \
    -type f -exec chmod 644 {} +
  chmod 755 "$pkgdir"/usr/share/hornero/bin/hornero-*

  # Packaged user seeding for install-on-Arch adoption: seeds only
  # files missing from an existing account (never overwrites), which
  # is what horneroctl config materialize resolves on packaged installs.
  install -Dm755 "$repo_root/scripts/seed-user.sh" \
    "$pkgdir/usr/share/hornero/seed-user.sh"

  # Ship the license alongside the payload for offline inspection.
  install -Dm644 "$repo_root/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$repo_root/profiles/themes/wallpaper-provenance.json" \
    "$pkgdir/usr/share/hornero/wallpapers/wallpaper-provenance.json"
  install -Dm644 "$repo_root/profiles/themes/wallpaper-collection.json" \
    "$pkgdir/usr/share/hornero/wallpapers/wallpaper-collection.json"
  install -Dm644 "$repo_root/profiles/themes/WALLPAPER-CREDITS.md" \
    "$pkgdir/usr/share/licenses/$pkgname/WALLPAPER-CREDITS.md"
}
