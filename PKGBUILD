pkgname=any-listen-desktop
pkgver=0.8.0
pkgrel=2
pkgdesc='A cross-platform private music playback service'
arch=('x86_64')
url='https://github.com/any-listen/any-listen-desktop'
license=('custom:AGPL-3.0-based')

_electron=electron43
_srcdir="${pkgname}-${pkgver}"

depends=(
  "${_electron}"
  'hicolor-icon-theme'
)

makedepends=(
  'git'
  'nodejs-lts-krypton'
  'pnpm'
  'python'
  'node-gyp'
)

conflicts=(
  'any-listen-desktop-bin'
  'any-listen-desktop-git'
)

source=(
  "${_srcdir}::git+https://github.com/any-listen/any-listen.git#tag=desktop-v${pkgver}"
)

sha256sums=('SKIP')

_setup_env() {
  export HOME="${srcdir}/home"
  export XDG_CACHE_HOME="${srcdir}/xdg-cache"
  export npm_config_cache="${srcdir}/npm-cache"
  export PNPM_HOME="${srcdir}/pnpm-home"
  export ELECTRON_CACHE="${srcdir}/electron-cache"
  export ELECTRON_BUILDER_CACHE="${srcdir}/electron-builder-cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export ELECTRON_NO_DOWNLOAD=1
  export npm_config_electron_skip_binary_download=true
  export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
  export PUPPETEER_SKIP_DOWNLOAD=1
  export SKIP_INSTALL_SIMPLE_GIT_HOOKS=1
  export npm_config_nodedir=/usr
  export npm_config_build_from_source=true
  export CSC_IDENTITY_AUTO_DISCOVERY=false
  export COREPACK_ENABLE_STRICT=0
  export NO_UPDATE_NOTIFIER=1
  export SKIP_LIB_COPY=true
  unset IS_CI

  mkdir -p \
    "${HOME}" \
    "${XDG_CACHE_HOME}" \
    "${npm_config_cache}" \
    "${PNPM_HOME}" \
    "${srcdir}/pnpm-store" \
    "${ELECTRON_CACHE}" \
    "${ELECTRON_BUILDER_CACHE}"
}

_patch_electron_npm() {
  local electron_dist="/usr/lib/${_electron}"
  local electron_bin="${electron_dist}/electron"
  local package_json
  local package_dir
  local found=0

  [[ -x "${electron_bin}" ]] || return 1

  while IFS= read -r -d '' package_json; do
    found=1
    package_dir="${package_json%/package.json}"

    rm -rf "${package_dir}/dist"
    ln -s "${electron_dist}" "${package_dir}/dist"
    printf '%s\n' 'electron' >"${package_dir}/path.txt"

    node - "${package_dir}/index.js" "${electron_bin}" <<'EOF'
const fs = require('fs')
fs.writeFileSync(process.argv[2], `module.exports = ${JSON.stringify(process.argv[3])}\n`)
EOF
  done < <(find node_modules/.pnpm -path '*/node_modules/electron/package.json' -print0)

  [[ "${found}" -eq 1 ]]
}

prepare() {
  cd "${srcdir}/${_srcdir}"

  local electron_dist="/usr/lib/${_electron}"

  [[ -r "${electron_dist}/version" ]] || return 1

  cat >>.npmrc <<'EOF'
engine-strict=false
package-manager-strict=false
manage-package-manager-versions=false
fund=false
audit=false
EOF

  ELECTRON_DIST="${electron_dist}" node <<'EOF'
const fs = require('fs')

function readJson(file) {
  return JSON.parse(fs.readFileSync(file, 'utf8'))
}

function writeJson(file, data) {
  fs.writeFileSync(file, JSON.stringify(data, null, 2) + '\n')
}

for (const file of ['package.json', 'packages/desktop/package.json']) {
  const pkg = readJson(file)
  pkg.scripts ??= {}
  pkg.scripts.preinstall = 'true'
  pkg.scripts.prepare = 'true'
  writeJson(file, pkg)
}

const file = 'packages/desktop/package.json'
const pkg = readJson(file)

pkg.build ??= {}
pkg.build.electronDist = process.env.ELECTRON_DIST
pkg.build.asar = true

const electronSpecifier = pkg.devDependencies?.electron ?? pkg.dependencies?.electron ?? ''
const electronVersion = electronSpecifier.replace(/^[^\d]*/, '')

if (electronVersion) {
  pkg.build.electronVersion = electronVersion
}

pkg.build.linux ??= {}
pkg.build.linux.target = ['dir']

writeJson(file, pkg)
EOF
}

build() {
  cd "${srcdir}/${_srcdir}"

  _setup_env

  pnpm install --frozen-lockfile --prod=false --store-dir "${srcdir}/pnpm-store"

  _patch_electron_npm

  pnpm -F scripts build:desktop

  pnpm -C packages/desktop run pack:dir
}

package() {
  cd "${srcdir}/${_srcdir}"

  local resources_dir="build/linux-unpacked/resources"
  local icon_dir="packages/desktop/resources/icons"
  local size

  [[ -f "${resources_dir}/app.asar" ]] || return 1

  install -Dm644 \
    "${resources_dir}/app.asar" \
    "${pkgdir}/usr/lib/${pkgname}/app.asar"

  if [[ -d "${resources_dir}/app.asar.unpacked" ]]; then
    cp -a --no-preserve=ownership \
      "${resources_dir}/app.asar.unpacked" \
      "${pkgdir}/usr/lib/${pkgname}/"
  fi

  install -dm755 "${pkgdir}/usr/bin"
  cat >"${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh
export ELECTRON_FORCE_IS_PACKAGED=1
exec /usr/bin/${_electron} --disable-setuid-sandbox --enable-wayland-ime /usr/lib/${pkgname}/app.asar "\$@"
EOF
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  for size in 16 24 32 48 64 128 256 512; do
    if [[ -f "${icon_dir}/${size}x${size}.png" ]]; then
      install -Dm644 \
        "${icon_dir}/${size}x${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/${pkgname}.png"
    fi
  done

  install -Dm644 \
    "${icon_dir}/icon.png" \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  cat >"${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Any Listen
Comment=A cross-platform private music playback service
Comment[zh_CN]=一款跨平台的私人音乐播放服务
Exec=${pkgname}
Terminal=false
Type=Application
Icon=${pkgname}
Categories=AudioVideo;Audio;Player;Music;
StartupNotify=true
EOF
  chmod 644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  install -Dm644 \
    LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
