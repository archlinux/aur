# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=garuda-toolbox-git
pkgver=4.0.1.r15.g6e78199
pkgrel=1
_electronversion=43
_pkgname=garuda-toolbox
pkgdesc="Garuda Toolbox - A collection of useful tools to manage your Garuda Linux system"
arch=('any')
url="https://gitlab.com/garuda-linux/applications/toolbox"
license=('GPL-3.0-or-later')
depends=('bash' 'curl' "electron${_electronversion}" 'pacman-contrib' 'garuda-libs>=1.6.0' 'archlinux-appstream-data' 'util-linux')
makedepends=('git' 'base-devel' 'nodejs' 'pnpm')
optdepends=('paru: show pending AUR updates'
  'meld: compare pacdiff files via a GUI on GTK systems'
  'pace: manage Pacman repositories via a GUI'
  'reflector-simple: update Arch mirrorlists interactively'
  'btrfs-assistant: easily manage Btrfs snapshots and further settings')
provides=('garuda-toolbox')
conflicts=('garuda-toolbox')
replaces=('garuda-rani-git')
options=('!strip' '!emptydirs' '!debug')
source=("toolbox::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd toolbox || exit
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd toolbox || exit

  # Verbose by default as preview version
  sed -i 's/logLevel = LogLevel.INFO/logLevel = LogLevel.VERBOSE/g' "$srcdir/toolbox/packages/renderer/src/app/logging/logging.ts"

  sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${_pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto --disable-vulkan/g
    " "${srcdir}/toolbox/assets/garuda-toolbox.sh"

  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
  export ELECTRON_OVERRIDE_DIST_PATH="/usr/lib/electron${_electronversion}"
  export CI=true

  HOME="${srcdir}/.electron-gyp"
  mkdir -p "${srcdir}/.electron-gyp"
  sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
  NODE_ENV=development pnpm -r install --no-frozen-lockfile --force
}

build() {
  cd toolbox || exit
  local electronDist="/usr/lib/electron${_electronversion}"

  NODE_ENV=production pnpm run build
  NODE_ENV=production pnpm exec electron-builder --linux dir \
    --config electron-builder.mjs \
    -c.electronDist="${electronDist}" \
    -c.electronVersion="${SYSTEM_ELECTRON_VERSION}"
}

package() {
  install -Dm755 "${srcdir}/toolbox/assets/garuda-toolbox.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "${srcdir}/toolbox/assets/garuda-toolbox-pty-wrapper" "${pkgdir}/usr/libexec/garuda-toolbox-pty-wrapper"
  install -Dm644 "${srcdir}/toolbox/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${_pkgname}"
  install -Dm644 "${srcdir}/toolbox/assets/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/toolbox/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "${srcdir}/toolbox/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/${_pkgname}.svg"
  install -Dm644 "${srcdir}/toolbox/assets/images/garuda-purple.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 "${srcdir}/toolbox/assets/org.garudalinux.toolbox.policy" "${pkgdir}/usr/share/polkit-1/actions/org.garudalinux.toolbox.policy"
}
