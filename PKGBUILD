# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=balena-etcher
_pkgname=etcher
pkgver=2.1.9
pkgrel=1
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
_github_url='https://github.com/balena-io/etcher'
url='https://balena.io/etcher'
license=(Apache-2.0 MIT)
_electron=electron44
depends=("${_electron}")
makedepends=('nvm' 'python' 'jq' 'git' 'libarchive')
optdepends=("libnotify: for notifications")
conflicts=("${_pkgname}"
  "${_pkgname}-git"
  "${_pkgname}-bin"
)
options=('!debug' '!strip')
source=("${_github_url}/archive/refs/tags/v${pkgver}.tar.gz"
  "${pkgname}.desktop"
  "${pkgname}"
  "etcher-util"
  'skip-build-util.patch'
)
sha256sums=('27819c1b62fa52546569e09c63952b4faeee9eb3f9ad2fdf0e23e7a2f1e6b842'
            '6c5fb48aeb636272689c86d7cf9beea4515214636bc617a61c3e8387628b3415'
            '7482eb18af030eb6d2b44850f23ecb99cd9198f642ac3b22b2f9f2ef0c8944d4'
            '515006160d41edc043425c741d5c83797bd4ff5e5cf8352fbc921e97c53de078'
            'fe13789032dfbb26577123fc64c35445d148606f54c304fd1c75438ca09b7a54')
prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --strip=1 <${srcdir}/skip-build-util.patch
  # same format as package-lock.json, which npm >= 12 reads instead
  mv npm-shrinkwrap.json package-lock.json
  # build against the system electron; package.json has no electron-builder
  # "build" key, electron-forge only reads devDependencies.electron
  local electronVersion="$(</usr/lib/${_electron}/version)"
  jq ".devDependencies.electron = \"$electronVersion\"" package.json > package.json.new
  mv package.json.new package.json
  # let electron-packager use a local zip of the system electron instead of
  # downloading the official release
  sed -i forge.config.ts \
    -e "/^\t\tasar: true,/a\\\t\telectronZipDir: process.env.ELECTRON_ZIP_DIR,"
  sed -i lib/gui/etcher.ts -e "s|process.resourcesPath|'/usr/lib/${pkgname}'|"
  sed -i ${srcdir}/${pkgname} -e "s|__ELECTRON__|${_electron}|"
  sed -i "/elevated = 'refused';/d" lib/shared/sudo/linux.ts
}

_ensure_local_nvm() {
  # private node toolchain in $srcdir following upstream's .nvmrc: the native
  # addons (nan based mountutils) don't build against the system nodejs
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install
  nvm use
  # use the headers shipped with the nvm node instead of downloading them
  export npm_config_nodedir="${NVM_DIR}/versions/node/$(nvm current)"
}

build() {
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export HOME="${srcdir}"
  export NODE_OPTIONS=--stack-trace-limit=50
  export npm_config_audit=false npm_config_fund=false npm_config_update_notifier=false
  cd "${_pkgname}-${pkgver}"
  unset MAKEFLAGS
  _ensure_local_nvm

  # zip the system electron where electron-packager looks for it
  local electronVersion="$(</usr/lib/${_electron}/version)"
  local electronArch="$(node -p 'process.arch === "arm" ? "armv7l" : process.arch')"
  export ELECTRON_ZIP_DIR="${srcdir}/electron-zip"
  mkdir -p "${ELECTRON_ZIP_DIR}"
  (cd "/usr/lib/${_electron}" && bsdtar -a -cf \
    "${ELECTRON_ZIP_DIR}/electron-v${electronVersion}-linux-${electronArch}.zip" *)

  # install from upstream's lockfile instead of re-resolving everything
  npm install
  npm run package

  # node_modules for our etcher-util wrapper, pinned to the versions the app
  # was built with; reuse upstream's allowScripts so native addons get built
  jq '{name: "etcher-util", private: true, allowScripts,
    dependencies: ($ARGS.positional | map({(.): $deps[.]}) | add)}' \
    --argjson deps "$(jq '.packages | with_entries(select(.key | startswith("node_modules/")
      and (ltrimstr("node_modules/") | contains("/") | not)) | .key |= ltrimstr("node_modules/")
      | .value |= .version)' package-lock.json)" \
    --args etcher-sdk ws lodash <package.json >out/sidecar/src/package.json
  # npm prunes the upstream lockfile down to what the sidecar needs
  cp package-lock.json out/sidecar/src/
  cd out/sidecar/src
  npm install --omit=dev
  rm package-lock.json
}

__clean_modules() {
  local __arch_remove
  __arch_remove=arm64
  if [[ "$CARCH" == "aarch64" ]]; then
    __arch_remove=x64
  fi
  cd "${pkgdir}/usr/lib/${pkgname}/utils/node_modules"
  rm -rf {drivelist,mountutils,xxhash-addon}/build/{config.gypi,Makefile,*.mk,Release/{obj.target,.deps,*.a}}
  rm -rf lzma-native/prebuilds/{darwin-{arm64,x64},win32-{ia32,x64},linux-${__arch_remove}}
  rm -rf drivelist/node-addon-api/nothing.target.mk
  rm -rf usb/prebuilds/{android,win32,darwin}-*
  case $CARCH in
  x86_64)
    rm -rf usb/prebuilds/linux-{arm*,ia32}
    ;;
  i386)
    rm -rf usb/prebuilds/linux-{arm*,x64}
    ;;
  aarch64)
    rm -rf usb/prebuilds/linux-{arm,x64,ia32}
    ;;
  armv7h)
    rm -rf usb/prebuilds/linux-{arm64,x64,ia32,arm/node.napi.armv6.node}
    ;;
  esac
}
package() {
  cd "${_pkgname}-${pkgver}"

  _appdir="${pkgdir}/usr/lib/${pkgname}"
  install -d "${_appdir}"

  cp -a out/balenaEtcher-linux-*/resources/* "${_appdir}"
  cp -a out/sidecar/src "${_appdir}/utils"

  install -Dm755 ${srcdir}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 ${srcdir}/etcher-util "${_appdir}"
  # etcher-util runs on the node 24 it was built with: its native addons
  # (nan based mountutils) are tied to that node ABI
  local _nodedir=("${srcdir}"/.nvm/versions/node/v*)
  install -Dm755 "${_nodedir[0]}/bin/node" "${_appdir}/bin/node"
  install -Dm644 "${_nodedir[0]}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/node-LICENSE"
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 "assets/iconset/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
  done
  __clean_modules
}
