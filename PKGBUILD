# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=garuda-rani-git
pkgver=3.0.0.r0.ga1902a8
pkgrel=1
_electronversion=38
_pkgname=garuda-rani
pkgdesc="Garuda's Reliable Assistant for Native Installations"
arch=('any')
url="https://gitlab.com/garuda-linux/applications/rani"
license=('GPL-3.0-or-later')
depends=('bash' 'curl' "electron${_electronversion}" 'pacman-contrib' 'garuda-libs>=1.6.0')
makedepends=('git' 'base-devel' 'nodejs-lts-jod' 'pnpm')
optdepends=('paru: show pending AUR updates'
  'meld: compare pacdiff files via a GUI on GTK systems'
  'pace: manage Pacman repositories via a GUI'
  'reflector-simple: update Arch mirrorlists interactively'
  'btrfs-assistant: easily manage Btrfs snapshots and further settings')
provides=('garuda-rani')
conflicts=('garuda-rani')
options=('!strip' '!emptydirs' '!debug')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd rani || exit
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd rani || exit

  # Verbose by default as preview version
  sed -i 's/logLevel = LogLevel.INFO/logLevel = LogLevel.VERBOSE/g' "$srcdir/rani/packages/renderer/src/app/logging/logging.ts"

  sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/rani/assets/garuda-rani.sh"

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
  export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron${_electronversion}"

  HOME="${srcdir}/.electron-gyp"
  mkdir -p "${srcdir}/.electron-gyp"
  sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
  NODE_ENV=development pnpm -r install --shamefully-hoist
}

build() {
  cd rani || exit
  local electronDist="/usr/lib/electron${_electronversion}"

  NODE_ENV=production pnpm run build
  NODE_ENV=production pnpm exec electron-builder --linux dir \
    --config electron-builder.mjs \
    -c.electronDist="${electronDist}" \
    -c.electronVersion="${SYSTEM_ELECTRON_VERSION}"
}

package() {
  install -Dm755 "${srcdir}/rani/assets/garuda-rani.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/rani/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm644 "${srcdir}/rani/assets/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/rani/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "${srcdir}/rani/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/${_pkgname}.svg"
  install -Dm644 "${srcdir}/rani/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
