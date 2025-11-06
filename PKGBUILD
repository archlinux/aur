# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.5.2.r56.g2a30e1b
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=(
  '7zip'
  'coreutils'
  'glu'
  'libnotify'
  'mangohud'
  'pciutils'
  'polkit'
  'qt6pas'
  'wget'
)
makedepends=(
  'git'
  'lazarus'
#  'xmlstarlet'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'git: Clone reshade repository'
  'pascube: Run pasCube (beta)'
  'vkbasalt: Configure vkBasalt'
  'vulkan-tools: Vulkan preview'
  'zenergy-dkms: Display AMD CPU power'
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

  # modify compiler options
#  for i in "${pkgname%-git}.lpi"; do
#    xmlstarlet edit --inplace --delete '//Other' "$i"
#    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
#      -i "$i"
#  done

  mkdir -p build
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
