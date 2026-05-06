# Maintainer: mizorewww <aac6fef@icloud.com>
pkgname=arkloop-git
pkgver=26.3.27.r0.g0000000
pkgrel=1
pkgdesc="Desktop app for building conversational AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/qqqqqf-q/Arkloop"
license=('Apache-2.0')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'gtk3'
  'libappindicator-gtk3'
  'libdrm'
  'libnotify'
  'libxcomposite'
  'libxdamage'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nss'
  'xdg-utils'
)
makedepends=('git' 'go' 'nodejs' 'pnpm')
provides=('arkloop' 'arkloop-desktop')
conflicts=('arkloop' 'arkloop-desktop')
options=('!strip' '!debug')
source=('git+https://github.com/qqqqqf-q/Arkloop.git')
sha256sums=('SKIP')

_pkgsrc="${srcdir}/Arkloop"
_app_dir="${_pkgsrc}/src/apps/desktop"

_pnpm() {
  pnpm --config.manage-package-manager-versions=false "$@"
}

_pnpm_install() {
  pnpm --config.manage-package-manager-versions=false --store-dir "${srcdir}/pnpm-store" "$@"
}

pkgver() {
  cd "${_pkgsrc}"
  local app_version commit_count commit_hash
  app_version="$(node -p "require('./src/apps/desktop/package.json').version")"
  commit_count="$(git rev-list --count HEAD)"
  commit_hash="$(git rev-parse --short=7 HEAD)"
  printf '%s.r%s.g%s\n' "${app_version}" "${commit_count}" "${commit_hash}"
}

_electron_arch() {
  case "${CARCH}" in
    x86_64) printf '%s\n' 'x64' ;;
    aarch64) printf '%s\n' 'arm64' ;;
    *) printf 'unsupported architecture: %s\n' "${CARCH}" >&2; return 1 ;;
  esac
}

prepare() {
  cd "${_pkgsrc}"
  _pnpm_install install --frozen-lockfile
}

build() {
  cd "${_pkgsrc}"
  local electron_arch
  electron_arch="$(_electron_arch)"

  _pnpm --filter @arkloop/desktop run build:web
  _pnpm --filter @arkloop/desktop run build:electron
  node src/apps/desktop/scripts/build-sidecar.mjs --platform linux --arch "${electron_arch}"

  rm -rf "${_app_dir}/release/linux-unpacked"
  _pnpm --filter @arkloop/desktop exec electron-builder \
    --linux dir \
    -c.extraMetadata.version="${pkgver}"
}

package() {
  local release_dir="${_app_dir}/release/linux-unpacked"
  local app_bin=''

  if [[ ! -d "${release_dir}" ]]; then
    printf 'missing electron-builder output: %s\n' "${release_dir}" >&2
    return 1
  fi

  install -dm755 "${pkgdir}/opt/arkloop"
  cp -a "${release_dir}/." "${pkgdir}/opt/arkloop/"

  for candidate in arkloop Arkloop @arkloopdesktop; do
    if [[ -x "${pkgdir}/opt/arkloop/${candidate}" ]]; then
      app_bin="${candidate}"
      break
    fi
  done

  if [[ -z "${app_bin}" ]]; then
    printf 'missing Arkloop executable in %s\n' "${release_dir}" >&2
    return 1
  fi

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/arkloop/${app_bin}" "${pkgdir}/usr/bin/arkloop"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat > "${pkgdir}/usr/share/applications/arkloop.desktop" <<EOF
[Desktop Entry]
Name=Arkloop
Comment=Desktop app for building conversational AI agents
Exec=/usr/bin/arkloop %U
Terminal=false
Type=Application
Icon=arkloop
Categories=Development;
StartupWMClass=Arkloop
EOF

  install -Dm644 "${_app_dir}/resources/icon.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/arkloop.png"
  install -Dm644 "${_pkgsrc}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f "${pkgdir}/opt/arkloop/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/arkloop/chrome-sandbox"
  fi
}
