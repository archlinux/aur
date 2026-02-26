# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.7.4.r23.ga6c7b5a
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

  # Bump libgit2 version
  sed -i 's/libgit2.so.1.7/libgit2.so.1.9/g' git2pas.pas
  sed -i 's/libgit2.so.1.6/libgit2.so.1.8/g' git2pas.pas
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
