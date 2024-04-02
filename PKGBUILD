# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Joshua Glass <joshuag1000@outlook.com>

pkgname=arduino-ide
pkgver=2.3.2
pkgrel=1
pkgdesc="Open-source electronics prototyping platform"
arch=(x86_64)
url=https://github.com/arduino/arduino-ide
license=(AGPL-3.0-only)
depends=(
  bash
  gcc-libs
  glib2
  glibc
  electron27
  libsecret
  libx11
  libxkbfile
  python
)
makedepends=(
  git
  jq
  nodejs-lts-iron
  npm
  yarn
)
optdepends=(
  'libusb: Needed for some libraries or boards'
  'libusb-compat: Needed for the `micronucleus` cli utility'
  'python-pyserial: Needed for esptool'
  'usbutils: Needed for stm32 boards using st-link'
)
_tag=da57c53700c313719977dd53211af1e1d7d93e27
source=(
  git+https://github.com/arduino/arduino-ide.git#tag=${_tag}
  arduino-ide.sh
  arduino-ide.desktop
)
b2sums=('7ed1c9e378c264f22c765c7a2136269c8bb00c9181827e9c19ea8296a7d2a6f46a7e612c7375fea9fca1df0e1694a206453d9e0c7419294bd69631cb971e8349'
        '71b0369b1896456a210800507764151975cdd2bb29dcc9b3086bc3eb786126a1efd0b60d1f6c66b23528ae17693cc4317d676c390f62b3c0013d96b42e1752d3'
        '9b7c45d5081f23415c3dfd3d098cbe425b207f82a480b09f192e5d0e95511da5c8985ad20667301b8977a0ab3166c8b6aa5992e36df75173785bb026a10f8edb')

prepare() {
  cd arduino-ide

  local _electron_version=$(cat electron-app/package.json | jq '.devDependencies.electron')
  if [[ ${_electron_version} != \"^27.*\" ]]; then
    msg "Electron version must be ${_electron_version}"
    exit 1
  fi

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
  install -dm 755 "${pkgdir}"/usr/{lib,share/docs}
  rm -rf arduino-ide/electron-app/dist/linux-unpacked/resources/app/plugins/cortex-debug/extension/binary_modules/*/{darwin,linux/{arm,arm64},win32}
  cp -dr --no-preserve=ownership arduino-ide/electron-app/dist/linux-unpacked/resources/app "${pkgdir}"/usr/lib/arduino-ide
  cp -dr --no-preserve=ownership arduino-ide/docs "${pkgdir}"/usr/share/docs/arduino-ide
  install -Dm 755 arduino-ide.sh "${pkgdir}"/usr/bin/arduino-ide
  install -Dm 644 arduino-ide.desktop -t "${pkgdir}"/usr/share/applications/
  install -Dm 644 arduino-ide/electron-app/resources/icons/512x512.png "${pkgdir}"/usr/share/pixmaps/arduino-ide.png
}

# vim: ts=2 sw=2 et:
