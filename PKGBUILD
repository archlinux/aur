# Maintainer: Akuma-real

pkgname=stelliberty-bin
pkgver=1.2.284
pkgrel=1
pkgdesc="Modern Clash/Mihomo 客户端的二进制发行版"
arch=('x86_64' 'aarch64')
url="https://github.com/Kindness-Kismet/Stelliberty"
license=('LicenseRef-Stelliberty')
install=stelliberty-bin.install
depends=(
  'gtk3'
  'libkeybinder3'
  'libappindicator'
  'rsync'
)
makedepends=('libarchive' 'patchelf')
optdepends=(
  'xdg-utils: for xdg-open support'
  'polkit: for pkexec-based service installation from the UI'
)
provides=("stelliberty=${pkgver}")
conflicts=('stelliberty')
options=('!strip')

_common_sources=(
  "app_icon.png::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/linux/runner/resources/app_icon.png"
  "stelliberty.desktop::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/linux/stelliberty.desktop"
  "LICENSE-v${pkgver}::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/LICENSE"
)

source=("${_common_sources[@]}")
source_x86_64=("Stelliberty-v${pkgver}-linux-x64.zip::https://github.com/Kindness-Kismet/Stelliberty/releases/download/v${pkgver}/Stelliberty-v${pkgver}-linux-x64.zip")
source_aarch64=("Stelliberty-v${pkgver}-linux-arm64.zip::https://github.com/Kindness-Kismet/Stelliberty/releases/download/v${pkgver}/Stelliberty-v${pkgver}-linux-arm64.zip")

noextract=("Stelliberty-v${pkgver}-linux-x64.zip" "Stelliberty-v${pkgver}-linux-arm64.zip")

sha256sums=('fa89e84a3090b5a566b0ddf4d8e11adec3785b66d660746774fb6197173bf9d8'
            'ca2f07aef3208f38d47eee1bdc163b2699362432e050e0127b744163d6dc9eca'
            '6f6fc60debd655040216a90ce3a87071ede50c392f6eba3642f169891c638e10')
sha256sums_x86_64=('91f8cee95842f25bb128d7f51b4a75e04f1629aa095d3d29c98d605bff100b65')
sha256sums_aarch64=('7fe052c5bed27cb1a164119e687a4ee4fd0a60353fdca7b794894be0cffb3ab4')

package() {
  local _upstream_arch
  case "${CARCH}" in
    x86_64) _upstream_arch="x64" ;;
    aarch64) _upstream_arch="arm64" ;;
    *) echo "Unsupported architecture: ${CARCH}" >&2; return 1 ;;
  esac

  local _archive="Stelliberty-v${pkgver}-linux-${_upstream_arch}.zip"
  local _install_dir="${pkgdir}/usr/lib/stelliberty"

  install -d "${_install_dir}"
  bsdtar -xf "${srcdir}/${_archive}" -C "${_install_dir}"
  rm -f "${_install_dir}/data/.portable"
  printf '%s\n' "${pkgver}-${pkgrel}" > "${_install_dir}/data/.package-sync-revision"

  while IFS= read -r -d '' _file; do
    _rpath="$(/usr/bin/patchelf --print-rpath "${_file}" 2>/dev/null || true)"
    if [[ -z "${_rpath}" ]]; then
      continue
    fi

    if [[ "${_rpath}" == *"/home/runner/"* || "${_rpath}" == *"/__w/"* ]]; then
      /usr/bin/patchelf --remove-rpath "${_file}"
    fi
  done < <(find "${_install_dir}" -type f -print0)

  chmod +x "${_install_dir}/stelliberty"
  chmod +x "${_install_dir}/data/flutter_assets/assets/service/stelliberty-service"

  local _clash_core="${_install_dir}/data/flutter_assets/assets/clash/clash-core"
  if [[ -f "${_clash_core}" ]]; then
    chmod 755 "${_clash_core}"
  else
    echo "Missing clash core: ${_clash_core}" >&2
    return 1
  fi

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/stelliberty" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

system_dir="/usr/lib/stelliberty"
# Allow overriding the app data root when HOME/XDG_DATA_HOME contains unsupported characters.
data_root="${STELLIBERTY_DATA_ROOT:-${XDG_DATA_HOME:-${HOME}/.local/share}/stelliberty}"
user_dir="${data_root}/app"

ensure_exec() {
  local file="$1"
  if [[ ! -f "${file}" ]]; then
    printf 'stelliberty: required file not found: %s\n' "${file}" >&2
    exit 1
  fi
  if [[ ! -x "${file}" ]]; then
    chmod 755 "${file}"
  fi
}

version_of() {
  local file="$1"
  if [[ -r "$file" ]]; then
    grep -oE '"version":"[^"]+"' "$file" | sed 's/.*"version":"\([^"]*\)".*/\1/'
  fi
}

token_of() {
  local file="$1"
  if [[ -r "$file" ]]; then
    head -n1 "$file"
  fi
}

sync_app() {
  install -d "${user_dir}"

  local -a preserve_patterns=(
    'data/subscriptions'
    'data/subscriptions/***'
    'data/subscriptions_list.json'
    'data/overrides'
    'data/overrides/***'
    'data/overrides_list.json'
    'data/image_cache'
    'data/image_cache/***'
    'data/dns_config.yaml'
    'data/stelliberty_proxy.pac'
    'data/settings_preferences.json'
    'data/settings_preferences_dev.json'
    'data/running.logs*'
    'data/runtime'
    'data/runtime/***'
  )

  local -a rsync_args=(-a --delete)
  local pattern
  for pattern in "${preserve_patterns[@]}"; do
    rsync_args+=(--exclude "${pattern}")
  done

  rsync "${rsync_args[@]}" "${system_dir}/" "${user_dir}/"
}

sys_ver="$(version_of "${system_dir}/data/flutter_assets/version.json")"
usr_ver="$(version_of "${user_dir}/data/flutter_assets/version.json")"
sys_sync_revision="$(token_of "${system_dir}/data/.package-sync-revision")"
usr_sync_revision="$(token_of "${user_dir}/data/.package-sync-revision")"

if [[ "${usr_ver:-}" != "${sys_ver:-}" || "${usr_sync_revision:-}" != "${sys_sync_revision:-}" ]]; then
  sync_app
fi
ensure_exec "${user_dir}/stelliberty"
ensure_exec "${user_dir}/data/flutter_assets/assets/clash/clash-core"
ensure_exec "${user_dir}/data/flutter_assets/assets/service/stelliberty-service"

backend="${GDK_BACKEND:-}"
if [[ -z "${backend}" ]]; then
  if [[ "${XDG_SESSION_TYPE:-}" == "wayland" ]]; then
    backend="wayland"
  else
    backend="x11"
  fi
fi
export GDK_BACKEND="${backend}"

export LD_LIBRARY_PATH="${user_dir}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

extra_args=()
if [[ "${STELLIBERTY_DISABLE_HW:-}" == "1" ]]; then
  extra_args+=(--enable-software-rendering)
fi
if [[ -n "${STELLIBERTY_FLAGS:-}" ]]; then
  read -r -a _flags <<<"${STELLIBERTY_FLAGS}"
  extra_args+=("${_flags[@]}")
fi

exec "${user_dir}/stelliberty" "${extra_args[@]}" "$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/stelliberty"

  install -Dm644 "${srcdir}/stelliberty.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -e 's/^Icon=.*/Icon=stelliberty/' -e 's/^Exec=.*/Exec=stelliberty/' -i "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 "${srcdir}/app_icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/stelliberty.png"
  install -Dm644 "${srcdir}/LICENSE-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
