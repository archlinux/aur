# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.8.1.r12.ga620cb8
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'coreutils'
  'curl'
  'git'
  'glu'
  'libgit2'
  'libnotify'
  'mangohud'
  'mesa-utils'
  'pciutils'
  'polkit'
  'qt6pas'
  'ttf-font-nerd'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'lazarus'
)
checkdepends=('appstream')
optdepends=(
  'gamemode: Feral GameMode daemon for CPU/GPU optimisation'
  'pascube: OpenGL preview cube for testing the MangoHud overlay'
  'protontricks: required for Wine prefix manager'
  'vkbasalt: Vulkan post-processing effects'
  'vulkan-tools: Vulkan cube for testing Vulkan layer injection'
  'zenergy-dkms: Displays AMD CPU power metrics'
  'zenity: FGMod GUI'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --exclude=nightly --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  mkdir -p build

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="${pkgname%-git}" \
    "data/io.github.benjamimgois.${pkgname%-git}.desktop"
}

build() {
  cd "${pkgname%-git}"
  make LAZBUILDOPTS="--lazarusdir=/usr/lib/lazarus --primary-config-path=build"
}

check() {
  cd "${pkgname%-git}"
  export AS_VALIDATE_NONET='true'
  make tests
}

package() {
  cd "${pkgname%-git}"
  make prefix=/usr libexecdir=/lib DESTDIR="$pkgdir/" install
}
