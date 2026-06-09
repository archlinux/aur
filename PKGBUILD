# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.8.2.r74.g96f027c
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'coreutils'
  'curl'
  'fontconfig'
  'git'
  'glu'
  'libgit2'
  'libnotify'
  'mangohud'
  'mesa-utils'
  'pciutils'
  'polkit'
  'qt6pas'
  'sdl2-compat'
  'ttf-font-nerd'
)
makedepends=(
  'desktop-file-utils'
  'git'
  'lazarus'
)
checkdepends=('appstream')
optdepends=(
  'gamemode: Feral GameMode daemon (for the GameMode tweak)'
  'protontricks: Proton prefix management'
  'vkbasalt: Vulkan post-processing effects'
  'vksumi: Alternative Vulkan post-processor with 15 tunable parameters'
  'zenergy-dkms: Displays AMD CPU power metrics in MangoHud'
  'zenity: FGMod GUI'
)
provides=("${pkgname%-git}" 'pascube')
conflicts=("${pkgname%-git}" 'pascube')
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

  ln -s /usr/lib/pascube "$pkgdir/usr/bin/"
}
