# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=goverlay-git
pkgver=1.2.r26.g30ffcd0
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL-3.0-or-later')
depends=(
  'glu'
  'mangohud'
  'qt6pas'
)
makedepends=(
  'git'
  'lazarus'
  'xmlstarlet'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'mesa-utils: OpenGL preview'
  'ttf-dejavu: recommended font'
  'ttf-ubuntu-font-family: recommended font'
  'vulkan-tools: Vulkan preview'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/benjamimgois/goverlay.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --exclude=nightly --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # modify compiler options
  for i in "${pkgname%-git}.lpi"; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
      -i "$i"
  done

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value="${pkgname%-git}" \
    "data/io.github.benjamimgois.${pkgname%-git}.desktop"

  mkdir -p build
}

build() {
  cd "${pkgname%-git}"
  make LAZBUILDOPTS="--lazarusdir=/usr/lib/lazarus --primary-config-path=build"
}

check() {
  cd "${pkgname%-git}"
  make tests
}

package() {
  cd "${pkgname%-git}"
  make prefix=/usr libexecdir=/lib DESTDIR="$pkgdir/" install
}
