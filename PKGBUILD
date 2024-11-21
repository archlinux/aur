# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgbase=superconductor
pkgname=('superconductor' 'tsr-bridge')
pkgver=0.11.3
pkgrel=4
_pkgname=SuperConductor
arch=('x86_64')
url="https://github.com/SuperFlyTV/SuperConductor"
license=('LicenseRef-unknown' 'AGPL-3.0-only')
makedepends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libvips'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'python-setuptools'
  'nvm'
  'yarn'
)
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'superconductor.desktop'
        'tsr-bridge.desktop')
sha256sums=('b3ce1cfaca92a21bdd20ff20b5ec32a109f5a9f93e7ffdcd29a87c2ab0a18590'
            '40968067cd055add4f6cfbffa4ca52155abc5771a44df2fca548d691b433bb3a'
            '7e3f99900f3feb6f4d9bae385adaa42a6aae46a8ac8ebcd2bd69b9dfac5e93ea')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"

  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd ${_pkgname}-${pkgver}
  _ensure_local_nvm
  # Set node.js to v18.20.5 for build 
  nvm install 18.20.5
  # Workaround for 'husky - .git can't be found'
  mkdir -p .git
  # Installs all dependencies, including Lerna.
  yarn install --silent --cache "${srcdir}/yarn-cache"
}

build() {
  cd ${_pkgname}-${pkgver}
  _ensure_local_nvm
  # Compile Typescript, run Webpack, etc:
  yarn build
  # Make binaries for the SuperConductor UI and tsr-bridge. Must have run "yarn build" first.
  # The SuperConductor UI binary will be located at apps/app/dist.
  # The tsr-bridge binary will be located at apps/tsr-bridge/dist.
  # This command should work on all platforms (Windows, macOS, and Linux).
  yarn build:binary 
}

package_superconductor() {
  pkgdesc='A playout client that will let you control CasparCG Server, BMD ATEM, OBS Studio, vMix, OSC-compatible devices, HTTP (REST)-compatible devices, and more'
  depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libvips'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'python'
  )
  optdepends=('tsr-bridge: External application which handles the actual playout and control of the connected devices')
  provides=('superconductor')
  conflicts=('superconductor')

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  # Install SuperConductor
  cp -a --no-preserve='ownership' "${_pkgname}-${pkgver}/apps/app/dist/linux-unpacked" "${pkgdir}/usr/share/${pkgname}"
  ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install icons
  for i in 16 24 32 48 64 96 128 256 512 1024; do
    install -Dm 644 "${_pkgname}-${pkgver}/apps/app/build/icons/${i}x${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  # Install desktop files, license
  install -Dm644 ${pkgname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Cleanup reference to $srcdir/$pkgdir
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

package_tsr-bridge() {
  pkgdesc='Handles the actual playout and control of the connected devices'
  depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libvips'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'python'
  )
  provides=('tsr-bridge')
  conflicts=('tsr-bridge')

  install -d "${pkgdir}/usr/bin" "${pkgdir}/usr/share"
  # Install TSR-Bridge
  cp -a --no-preserve='ownership' "${_pkgname}-${pkgver}/apps/tsr-bridge/dist/linux-unpacked" "${pkgdir}/usr/share/tsr-bridge"
  ln -s "/usr/share/tsr-bridge/tsr-bridge" "${pkgdir}/usr/bin/tsr-bridge"

  # Install icons
  install -Dm 644 "${_pkgname}-${pkgver}/apps/tsr-bridge/assets/tray.png" \
    "${pkgdir}/usr/share/icons/hicolor/48x48/apps/tsr-bridge.png"

  # Install desktop files, license
  install -Dm644 tsr-bridge.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 ${_pkgname}-${pkgver}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Cleanup reference to $srcdir/$pkgdir
  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
}

# vim:set ts=2 sw=2 et:
