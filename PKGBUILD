# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/config>
# Package: hornero-config - curated HorneroOS desktop defaults.
# Profile selection: HORNERO_PROFILE=base|desktop|developer (default: base).
# All three names currently resolve to profiles/base, the only curated
# composition in this repo. Desktop and developer remain accepted aliases
# so callers can request them today without breaking when curated
# desktop/developer compositions land later.
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=hornero-config
pkgver=0.1.0
pkgrel=1
pkgdesc="HorneroOS curated desktop defaults (compositor, terminal, GTK, fonts, XDG handlers)"
arch=('any')
url="https://github.com/HorneroOS/config"
license=('MIT')
depends=('bash' 'git' 'python')
makedepends=('librsvg')
optdepends=(
  'hyprland: compositor defaults under /etc/xdg/hypr'
  'kitty: terminal defaults under /etc/xdg/kitty'
  'gtk3: GTK 3 defaults under /etc/xdg/gtk-3.0'
  'fontconfig: font defaults under /etc/xdg/fontconfig'
  'fastfetch: system info defaults under /etc/xdg/fastfetch'
  'btop: monitor defaults under /etc/xdg/btop'
  'cava: visualizer defaults under /etc/xdg/cava'
  'thunar: file manager defaults under /etc/xdg/Thunar'
  'copyq: clipboard defaults under /etc/xdg/copyq'
  'handlr: default-application handler under /etc/xdg/handlr'
  'qt6ct: Qt6 platform-theme defaults under /etc/xdg/qt6ct'
  'papirus-icon-theme: Papirus-Dark factory icons'
  'orchis-theme: Orchis factory GTK themes'
  'ttf-material-symbols-variable: Material Symbols shell icon font'
)
# Named "config" (not "$pkgname") so the checkout lands at
# "${srcdir}/config", matching _hornero_repo_root() below and keeping
# AUR chroot builds identical to local packaging/ builds.
source=("config::git+https://github.com/HorneroOS/config.git")
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
    base|desktop|developer)
      printf '%s:%s' "$profile" "profiles/base/profile.toml"
      ;;
    *)
      echo "error: unknown HORNERO_PROFILE='$profile' (want base, desktop, or developer)" >&2
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

  install -dm755 "$pkgdir/etc/xdg" "$pkgdir/usr/share/hornero/bin" \
    "$pkgdir/usr/share/hornero/profiles/base"

  # Staged per-user config -> system-wide XDG defaults. This loop is
  # generic on purpose: new modules picked up by materialize.sh flow
  # through here with no per-application list to keep in sync.
  local entry base
  for entry in "$stage"/.config/*; do
    [[ -e "$entry" ]] || continue
    base="$(basename "$entry")"
    if [[ -d "$entry" ]]; then
      mkdir -p "$pkgdir/etc/xdg/$base"
      cp -a "$entry/." "$pkgdir/etc/xdg/$base/"
    else
      install -Dm644 "$entry" "$pkgdir/etc/xdg/$base"
    fi
  done

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

  # Implementation libraries, CLI adapters, and theme recipes.
  # Staged canonical hornero/* is the source; dots/* are back-compat symlinks.
  mkdir -p "$pkgdir/usr/share/hornero/lib"
  cp -a "$stage/.local/lib/dots" "$pkgdir/usr/share/hornero/lib/dots"
  cp -a "$stage/.local/bin"/dots-* "$pkgdir/usr/share/hornero/bin/"
  mkdir -p "$pkgdir/usr/share/hornero/themes"
  cp -a "$stage/.local/share/hornero/themes/." "$pkgdir/usr/share/hornero/themes/"

  # Brand identity (vector sources only, never binaries). This block owns
  # /usr/share/hornero/brand exclusively. Coordination: config-gtk work owns
  # desktop/gtk-theme* + /usr/share/themes — this block touches neither.
  mkdir -p "$pkgdir/usr/share/hornero/brand"
  cp -a "$stage/.local/share/hornero/brand/." "$pkgdir/usr/share/hornero/brand/"
  # Real Hornero GTK themes (standard lookup path, discoverable by GTK 3+4
  # with no extra env). Ownership: these three trees own /usr/share/themes
  # exclusively — the recipe JSONs above own /usr/share/hornero/themes and
  # no file is shipped twice. Dev-only sources (src/, build.sh, gallery.py)
  # never enter the stage, so they cannot leak into the package.
  for variant in Dark Light Pampa; do
    if [[ ! -f "$stage/.local/share/themes/Hornero-$variant/gtk-3.0/gtk.css" ]] \
        || [[ ! -f "$stage/.local/share/themes/Hornero-$variant/gtk-4.0/gtk.css" ]] \
        || [[ ! -f "$stage/.local/share/themes/Hornero-$variant/index.theme" ]]; then
      echo "error: staged Hornero-$variant theme tree incomplete" >&2
      return 1
    fi
  done
  mkdir -p "$pkgdir/usr/share/themes"
  cp -a "$stage/.local/share/themes/Hornero-Dark" \
        "$stage/.local/share/themes/Hornero-Light" \
        "$stage/.local/share/themes/Hornero-Pampa" \
        "$pkgdir/usr/share/themes/"
  # Flagship wallpaper rasters (rendered by materialize.sh from vector
  # sources): the apply chain resolves them under hornero/wallpapers/.
  if [[ ! -f "$stage/.local/share/hornero/wallpapers/hornero-dark/hornero-dark-01.png" ]]; then
    echo "error: staged flagship wallpapers missing (rsvg-convert at build time?)" >&2
    return 1
  fi
  mkdir -p "$pkgdir/usr/share/hornero/wallpapers"
  cp -a "$stage/.local/share/hornero/wallpapers/." \
    "$pkgdir/usr/share/hornero/wallpapers/"


  # Profile manifests plus the resolved selection record.
  install -Dm644 "$repo_root/$profile_src" \
    "$pkgdir/usr/share/hornero/profiles/base/profile.toml"
  install -Dm644 "$repo_root/$profile_src" \
    "$pkgdir/usr/share/hornero/profile.toml"
  printf '%s\n' "$profile_name" > "$pkgdir/usr/share/hornero/HORNERO_PROFILE"

  # Permissions mirror scripts/materialize.sh: dirs 755, files 644,
  # with executables restored for CLI adapters and hypr helpers.
  find "$pkgdir/etc/xdg" "$pkgdir/usr/share/hornero" "$pkgdir/usr/share/themes" \
    -type d -exec chmod 755 {} +
  find "$pkgdir/etc/xdg" "$pkgdir/usr/share/hornero" "$pkgdir/usr/share/themes" \
    -type f -exec chmod 644 {} +
  chmod 755 "$pkgdir"/usr/share/hornero/bin/dots-*
  chmod 755 "$pkgdir"/etc/xdg/hypr/scripts/*.sh

  # Ship the license alongside the payload for offline inspection.
  install -Dm644 "$repo_root/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
