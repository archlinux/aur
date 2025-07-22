# Maintainer: exu <aur _a_ frm01 _d_ net>

pkgname=vivictpp
pkgdesc='An easy to use tool for subjective comparison of the visual quality of different encodings of the same video source.'
pkgver=1.3.0
# Uncomment for releases with hyphens
# _pkgver=$(echo "$pkgver" | tr '~' -)
pkgrel=1
arch=('x86_64')
url='https://github.com/vivictorg/vivictpp'
license=('GPL2')
depends=('sdl2_ttf'
  'ffmpeg'
  'freetype2'
  'zlib')
makedepends=('cmake'
  'meson'
  'git')
provides=("${pkgname}")
conflicts=("${pkgname}")
# See https://wiki.archlinux.org/title/Arch_package_guidelines#Package_sources for how to generate this
_tag="67a885302139f2560937334e4837f35fd68c43cb"
source=("git+https://github.com/vivictorg/vivictpp.git#tag=${_tag}"
  "meson_build.patch")
sha256sums=('8ed1646332adde563a165d22a30b101e3ad5f48ab0f0b4fef898d801b6044193'
  '966dcc43a7c125df5dc141db2c6ca7a87694676a3af07867b0702a53921d011e')
options=(!lto)

prepare() {
  # patching
  pushd "$pkgname"
  patch --strip=1 <../meson_build.patch
  git submodule update --init
  popd
}

build() {
  meson --prefix=/usr --buildtype=plain "$srcdir/${pkgname}" "builddir"
  meson compile -C builddir
}

package() {
  meson install -C builddir --destdir "$pkgdir"
}
