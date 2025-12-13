# Maintainer: Akuma-real

pkgname=stelliberty-bin
pkgver=1.1.70
pkgrel=1
pkgdesc="Modern Clash/Mihomo 客户端的二进制发行版"
arch=('x86_64' 'aarch64')
url="https://github.com/Kindness-Kismet/Stelliberty"
license=('custom:Stelliberty')
depends=('gtk3' 'nss' 'openssl' 'libappindicator-gtk3' 'libdbusmenu-gtk3' 'rsync')
makedepends=('libarchive')
optdepends=('xdg-utils: for xdg-open support')
provides=("stelliberty=${pkgver}")
conflicts=('stelliberty')
options=('!strip')
install=stelliberty-bin.install

_common_sources=(
  "app_icon.png::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/linux/runner/resources/app_icon.png"
  "stelliberty.desktop::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/linux/stelliberty.desktop"
  "LICENSE::https://raw.githubusercontent.com/Kindness-Kismet/Stelliberty/v${pkgver}/LICENSE"
)

source=("${_common_sources[@]}")
source_x86_64=("Stelliberty-v${pkgver}-linux-x64.zip::https://github.com/Kindness-Kismet/Stelliberty/releases/download/v${pkgver}/Stelliberty-v${pkgver}-linux-x64.zip")
source_aarch64=("Stelliberty-v${pkgver}-linux-arm64.zip::https://github.com/Kindness-Kismet/Stelliberty/releases/download/v${pkgver}/Stelliberty-v${pkgver}-linux-arm64.zip")

noextract=("Stelliberty-v${pkgver}-linux-x64.zip" "Stelliberty-v${pkgver}-linux-arm64.zip")

sha256sums=('fa89e84a3090b5a566b0ddf4d8e11adec3785b66d660746774fb6197173bf9d8'
            'ca2f07aef3208f38d47eee1bdc163b2699362432e050e0127b744163d6dc9eca'
            '174ae059d5746740127cebf3029724e6c149e67723bb377b293a91ed4d83baa8')
sha256sums_x86_64=('fcfb918b6db70904cfb084d0ff342069d18a23ffd18df62cf3fc3412f0485cf4')
sha256sums_aarch64=('fa45cbbc5790bde80a019605c584b627dc934b83879e85a1fa539302592c845f')

package() {
  local _upstream_arch
  case "${CARCH}" in
    x86_64) _upstream_arch="x64" ;;
    aarch64) _upstream_arch="arm64" ;;
    *) echo "Unsupported architecture: ${CARCH}" >&2; return 1 ;;
  esac

  local _archive="Stelliberty-v${pkgver}-linux-${_upstream_arch}.zip"

  install -d "${pkgdir}/opt/stelliberty"
  bsdtar -xf "${srcdir}/${_archive}" -C "${pkgdir}/opt/stelliberty"

  chmod +x "${pkgdir}/opt/stelliberty/stelliberty"
  chmod +x "${pkgdir}/opt/stelliberty/data/flutter_assets/assets/service/stelliberty-service"

  install -d "${pkgdir}/usr/bin"
  cat > "${pkgdir}/usr/bin/stelliberty" <<'EOF'
#!/usr/bin/env bash
set -euo pipefail

system_dir="/opt/stelliberty"
data_root="${XDG_DATA_HOME:-${HOME}/.local/share}/stelliberty"
user_dir="${data_root}/app"

version_of() {
  local file="$1"
  if [[ -r "$file" ]]; then
    grep -oE '"version":"[^"]+"' "$file" | sed 's/.*"version":"\([^"]*\)".*/\1/'
  fi
}

sync_app() {
  install -d "${user_dir}"
  rsync -a --delete \
    --exclude 'data/subscriptions' \
    --exclude 'data/subscriptions/***' \
    --exclude 'data/overrides' \
    --exclude 'data/overrides/***' \
    --exclude 'data/running.logs*' \
    "${system_dir}/" "${user_dir}/"
}

sys_ver="$(version_of "${system_dir}/data/flutter_assets/version.json")"
usr_ver="$(version_of "${user_dir}/data/flutter_assets/version.json")"

if [[ "${usr_ver:-}" != "${sys_ver:-}" ]]; then
  sync_app
fi

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
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
