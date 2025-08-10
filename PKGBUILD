# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Andrew Stubbs <andrew.stubbs@gmail.com>

pkgname=balena-etcher
_pkgname=etcher
pkgver=2.1.3
pkgrel=2
epoch=2
pkgdesc='Flash OS images to SD cards & USB drives, safely and easily'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
_github_url='https://github.com/balena-io/etcher'
url='https://balena.io/etcher'
license=(Apache-2.0)
_electron=electron37
depends=("${_electron}" "nodejs-lts-jod")
makedepends=("npm" "python" 'jq' 'moreutils' 'python-setuptools' 'git')
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
sha256sums=('3d5c9d0c9067cae8953d6679c81e1e46832264fc39ce4342b2c8ae46c8f55bff'
            '6c5fb48aeb636272689c86d7cf9beea4515214636bc617a61c3e8387628b3415'
            '7482eb18af030eb6d2b44850f23ecb99cd9198f642ac3b22b2f9f2ef0c8944d4'
            'f27e34eaec0d2cb74fee259ff32c2cbd1dae36d2046d2b3e97394b91f47adace'
            'a64369d70d41a3e9bed9d2260dedcaf76fceb8c654dbf8b6eee947785de2ae45')
prepare() {
  cd "${_pkgname}-${pkgver}"
  patch --strip=1 <${srcdir}/skip-build-util.patch
  local electronDist="/usr/lib/${_electron}"
  local electronVersion="$(<$electronDist/version)"
  jq ".devDependencies.electron = \"$electronVersion\"" package.json | sponge package.json
  jq ".build.electronDist = \"$electronDist\"" package.json | sponge package.json
  jq ".build.electronVersion = \"$electronVersion\"" package.json | sponge package.json
  sed -i lib/gui/etcher.ts -e "s|process.resourcesPath|'/usr/lib/${pkgname}'|"
  sed -i ${srcdir}/${pkgname} -e "s|__ELECTRON__|${_electron}|"
}

build() {
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export HOME="${srcdir}"
  export NODE_OPTIONS=--stack-trace-limit=50
  # skip download of node headers
  export npm_config_nodedir=/usr/
  cd "${_pkgname}-${pkgver}"
  unset MAKEFLAGS

  npm install
  npm run package

  # node_modules for our etcher-util wrapper
  cd "out/sidecar/src"
  npm install --prefix . etcher-sdk ws lodash
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
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 "assets/iconset/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
  done
  __clean_modules
}
