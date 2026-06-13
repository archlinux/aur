# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Pulsar33550336 <pulsar33550336@163.com>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
# Contributor: Joshua Glass <joshuag1000@outlook.com>

pkgname=arduino-ide
pkgver=2.3.10
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
  electron30
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
_tag=e5d4e20ed6aa0952c8d9f6d0c31726969b18a7c2
source=(
  git+https://github.com/arduino/arduino-ide.git#tag=${_tag}
  arduino-ide.sh
  arduino-ide.desktop
)

sha256sums=('653368f7604d9a830d462fce7b98c3fbfa9fb9f85463cf41ec0f1713e9e0745d'
            'd8462a3cf2cb7ceaac49b07208ff4c6ac7ac7918d89f61ce3037ca9bc0d2dcfb'
            'bfa4fc5098c423770f49a17ca6f7c401c1ce5e4b1936b50a8f0fed5bbd83a7fc')

prepare() {
  cd arduino-ide

  local _electron_version=$(cat electron-app/package.json | jq '.devDependencies.electron')
  if [[ ${_electron_version} != \"30.1.2\" ]]; then
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
  git describe --tags | cut -d '-' -f 1
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
