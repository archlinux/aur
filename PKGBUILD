# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
# Contributor: Joshua Glass <joshuag1000@outlook.com>

pkgname=arduino-ide
pkgver=2.3.4
pkgrel=1
pkgdesc="Open-source electronics prototyping platform"
arch=(x86_64)
url=https://github.com/arduino/arduino-ide
license=(AGPL-3.0-only)
depends=(
  arduino-cli
  arduino-fwuploader
  bash
  gcc-libs
  glib2
  glibc
  electron27
  libsecret
  libx11
  libxkbfile
  python
  ripgrep
)
makedepends=(
  arduino-language-server
  clang
  git
  jq
  nodejs-lts-iron
  npm
  python-setuptools
  yarn
)
optdepends=(
  'arduino-language-server: Arduino language server'
  'clang: Needed for clangd support'
  'libusb: Needed for some libraries or boards'
  'libusb-compat: Needed for the `micronucleus` cli utility'
  'python-pyserial: Needed for esptool'
  'usbutils: Needed for stm32 boards using st-link'
)
_tag=1112057979aa28f20c0ca184dfd8462c28ed5cf5
source=(
  git+https://github.com/arduino/arduino-ide.git#tag=${_tag}
  arduino-ide.sh
  arduino-ide.desktop
)
b2sums=('0f10a34560add1df2500519ce214cfc0ee9bf792ab82db280265a70a12acb3490b63e38427b7c0841071e7e341bc9bba4fcea582e7708890021a21a51f04b917'
        '12e045253c9ba57023cbc74a6138aa314b1f7fff6a9a1e5eeb4378a3259919f783ee068f9ae7dd420544f84e8deb7c21f06173ef436d2ee50f138b8306ee2ff3'
        '9b7c45d5081f23415c3dfd3d098cbe425b207f82a480b09f192e5d0e95511da5c8985ad20667301b8977a0ab3166c8b6aa5992e36df75173785bb026a10f8edb')

prepare() {
  cd arduino-ide

  local _electron_version=$(cat electron-app/package.json | jq '.devDependencies.electron')
  if [[ ${_electron_version} != \"^27.*\" ]]; then
    msg "Electron version must be ${_electron_version}"
    exit 1
  fi

  # Symlink to avoid downloads
  mkdir -p arduino-ide-extension/src/node/resources
  for bin in arduino-cli arduino-language-server arduino-fwuploader clang-format clangd; do
    ln -sf /usr/bin/$bin arduino-ide-extension/src/node/resources/$bin
  done

  export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
  yarn install --frozen-lockfile
}

pkgver() {
  cd arduino-ide
  git describe --tags
}

build() {
  cd arduino-ide
  export IS_NIGHTLY='false'
  export IS_RELEASE='true'
  yarn --cwd arduino-ide-extension build
  yarn --cwd electron-app rebuild
  yarn --cwd electron-app build
  yarn --cwd electron-app package
}

package() {
  install -dm 755 "${pkgdir}"/usr/{lib,share/doc}
  rm -rf arduino-ide/electron-app/dist/linux-unpacked/resources/app/plugins/cortex-debug/extension/binary_modules/*/{darwin,linux/{arm,arm64},win32}
  cp -dr --no-preserve=ownership arduino-ide/electron-app/dist/linux-unpacked/resources/app "${pkgdir}"/usr/lib/arduino-ide
  cp -dr --no-preserve=ownership arduino-ide/docs "${pkgdir}"/usr/share/doc/arduino-ide
  for bin in arduino-cli arduino-language-server arduino-fwuploader clang-format clangd; do
    ln -sf /usr/bin/$bin "${pkgdir}"/usr/lib/arduino-ide/lib/backend/resources/$bin
  done
  ln -sf /usr/bin/rg "${pkgdir}"/usr/lib/arduino-ide/lib/backend/native/rg
  install -Dm 755 arduino-ide.sh "${pkgdir}"/usr/bin/arduino-ide
  install -Dm 644 arduino-ide.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 arduino-ide/electron-app/resources/icons/512x512.png "${pkgdir}"/usr/share/pixmaps/arduino-ide.png
}

# vim: ts=2 sw=2 et:
