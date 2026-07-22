# Maintainer: jtaw5649
pkgname=hyprspaces-waybar-bin
pkgver=0.1.6
pkgrel=2
pkgdesc="Prebuilt hyprspaces-waybar with paired workspace support"
arch=('x86_64')
url='https://github.com/jtaw5649/Waybar'
license=('MIT')
depends=(
  'atkmm'
  'cairomm'
  'fmt'
  'glib2'
  'glibc'
  'glibmm'
  'gtk-layer-shell'
  'gtk3'
  'gtkmm3'
  'jack'
  'jsoncpp'
  'libdbusmenu-gtk3'
  'libevdev'
  'libgcc'
  'libinput'
  'libmpdclient'
  'libnl'
  'libpipewire'
  'libpulse'
  'libsigc++'
  'libstdc++'
  'libwireplumber'
  'libxkbcommon'
  'playerctl'
  'sndio'
  'spdlog'
  'systemd-libs'
  'upower'
  'wayland'
)
provides=('waybar=0.15.0' "hyprspaces-waybar=${pkgver}")
conflicts=('waybar' 'hyprspaces-waybar')
backup=('etc/xdg/waybar/config.jsonc' 'etc/xdg/waybar/style.css')
options=('!debug')
_release_tag="hyprspaces-waybar-v${pkgver}"
_asset="hyprspaces-waybar-full-x86_64.tar.zst"
_commit='d608965c8693a9e714e6574be6c64d0ba1c2c714'
source=(
  "${url}/releases/download/${_release_tag}/${_asset}"
  "LICENSE::https://raw.githubusercontent.com/jtaw5649/Waybar/${_commit}/LICENSE"
)
sha256sums=(
  'a93598569eeb102ae0b0f8a3cb0483f43cfe4a51a55de3addfa3b4d3cc330df1'
  'cf9f7af35361d9e0af784fb60a1ed8be5bb939233fbd70671575a90e458db00e'
)

check() {
  local binary_strings
  local dynamic_section
  local key
  local -a required_keys=(
    'hyprspaces-dynamic-workspaces'
    'hyprspaces-workspace-count'
    'hyprspaces-special-overlay'
  )

  local binary="${srcdir}/usr/bin/waybar"
  local service="${srcdir}/usr/lib/systemd/user/waybar.service"

  [[ -x "${binary}" ]] || { printf 'Waybar asset lacks usr/bin/waybar\n' >&2; return 1; }
  [[ -f "${srcdir}/etc/xdg/waybar/config.jsonc" ]] || { printf 'Waybar asset lacks default config\n' >&2; return 1; }
  [[ -f "${srcdir}/etc/xdg/waybar/style.css" ]] || { printf 'Waybar asset lacks default stylesheet\n' >&2; return 1; }
  [[ -f "${service}" ]] || { printf 'Waybar asset lacks systemd user service\n' >&2; return 1; }
  grep -Fxq 'ExecStart=/usr/bin/waybar' "${service}" || { printf 'Waybar service does not use canonical binary\n' >&2; return 1; }
  compgen -G "${srcdir}/usr/share/man/man5/waybar*.5*" >/dev/null || { printf 'Waybar asset lacks manual pages\n' >&2; return 1; }
  "${binary}" --version >/dev/null || { printf 'Waybar asset cannot run --version\n' >&2; return 1; }

  if ! dynamic_section="$(LC_ALL=C readelf --dynamic "${binary}")"; then
    printf 'Failed to inspect Waybar dynamic dependencies\n' >&2
    return 1
  fi

  if [[ "${dynamic_section}" == *'Shared library: [libcava'* ]] ||
    [[ "${dynamic_section}" == *'Shared library: [libepoxy'* ]] ||
    [[ "${dynamic_section}" == *'Shared library: [libgps'* ]]; then
    printf 'Waybar asset unexpectedly requires libcava, libepoxy, or libgps\n' >&2
    return 1
  fi

  if ! binary_strings="$(LC_ALL=C strings -a -- "${binary}")"; then
    printf 'Failed to inspect Waybar asset strings\n' >&2
    return 1
  fi

  for key in "${required_keys[@]}"; do
    if ! LC_ALL=C grep -Fqx -- "${key}" <<< "${binary_strings}"; then
      printf 'Waybar asset lacks required hyprspaces-waybar key: %s\n' "${key}" >&2
      return 1
    fi
  done
}

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  cp -a "${srcdir}/etc" "${pkgdir}/"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
