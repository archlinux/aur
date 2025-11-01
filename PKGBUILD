# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=garuda-rani
pkgver="3.5.0"
_commit='e2f2d8f64b9d1baf2b44f36395ed8a2599045076'
pkgrel=1
_electronversion=38
pkgdesc="Garuda's Reliable Assistant for Native Installations"
arch=('any')
url="https://gitlab.com/garuda-linux/applications/rani"
license=('GPL-3.0-or-later')
depends=('bash' 'curl' "electron${_electronversion}" 'pacman-contrib' 'garuda-libs>=1.6.0')
makedepends=('git' 'base-devel' 'nodejs-lts-krypton' 'pnpm')
optdepends=('paru: show pending AUR updates'
  'meld: compare pacdiff files via a GUI on GTK systems'
  'pace: manage Pacman repositories via a GUI'
  'reflector-simple: update Arch mirrorlists interactively'
  'btrfs-assistant: easily manage Btrfs snapshots and further settings')
options=('!strip' '!emptydirs' '!debug')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')
# Replaces all of garuda-settings-manager
replaces=('garuda-settings-manager' 'garuda-settings-manager-git' 'garuda-settings-manager-kcm' 'garuda-settings-manager-kcm-git' 'garuda-settings-manager-notifier' 'garuda-settings-manager-knotifier' 'garuda-settings-manager-knotifier-git' 'garuda-settings-manager-notifier-git')

prepare() {
  cd rani || exit

  sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
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
  install -Dm755 "${srcdir}/rani/assets/garuda-rani.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/rani/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${srcdir}/rani/assets/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/rani/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/rani/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/${pkgname}.svg"
  install -Dm644 "${srcdir}/rani/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
