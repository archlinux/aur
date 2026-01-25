# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.7.1.r27.g6ca6b31
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'coreutils'
  'glu'
  'libgit2'
  'libnotify'
  'mangohud'
  'pciutils'
  'polkit'
  'qt6pas'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'lazarus'
)
checkdepends=('appstream')
optdepends=(
  'gamemode: required for GameMode feature in Tweaks tab'
  'git: for ReShade shader cloning'
  'pascube: Run pasCube (beta)'
  'vkbasalt: Configure vkBasalt'
  'vulkan-tools: Vulkan preview'
  'zenergy-dkms: Display AMD CPU power'
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
