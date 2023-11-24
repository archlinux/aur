# Maintainer:
# Contributor: Adler Neves <adlerosn@gmail.com>

_pkgname="anime4k"
pkgname="$_pkgname-git"
pkgver=4.0.1.r40.g8e39551
pkgrel=1
pkgdesc="A High-Quality Real Time Upscaler for Anime Video"
url="https://github.com/bloc97/Anime4K"
license=('MIT')
arch=('any')

makedepends=('go-md2man')

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  go-md2man -in anime4k/md/GLSL_Instructions_Linux.md -out glsl.man
  go-md2man -in anime4k/md/GLSL_Instructions_Advanced.md -out glsladv.man
}

package() {
  install -d "${pkgdir}/usr/share/anime4k/tensorflow"
  cp -rf "$_pkgsrc/glsl"/* "${pkgdir:?}/usr/share/anime4k/"
  cp -rf "$_pkgsrc/tensorflow"/* "${pkgdir:?}/usr/share/anime4k/tensorflow/"

  install -Dm644 glsl.man "${pkgdir}/usr/share/man/man1/anime4k.1"
  install -Dm644 glsladv.man "${pkgdir}/usr/share/man/man1/anime4k-advanced.1"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/"
}
