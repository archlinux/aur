# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>
# PKGBUILD based on the one from https://aur.archlinux.org/packages/lite-xl

pkgname=lite-xl-git
_pkgname=lite-xl
pkgver=1.16.9.r0.ge58d760
pkgrel=1
pkgdesc='A lightweight text editor written in Lua'
arch=('x86_64')
url="https://github.com/franko/$pkgname"
license=('MIT')
depends=('lua52' 'sdl2' 'freetype2')
makedepends=('meson>=0.58' 'gendesk')
conflicts=("lite" "lite-xl")
provides=("$_pkgname")
source=("git+https://github.com/franko/lite-xl"
	# credits to 6r1d  for the svg icon
	"$pkgname.svg.zip::https://github.com/rxi/lite/files/4716765/lite.svg.zip")
sha256sums=('SKIP'
            '504d2ccd74f1c5b631b5b83a4f4319c74edb705fc383b3058f4b2d9354093b53')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # XDG desktop file
  gendesk -n -f \
          --pkgname "$_pkgname" \
          --pkgdesc "$pkgdesc" \
          --exec "lite %F" \
          --name "Lite XL" \
          --categories "Utility;TextEditor;Development" \
          --mimetype "text/plain"
}

build() {
  cd "$_pkgname"
  arch-meson build --wrap-mode default
  meson compile -C build
}

package() {
  cd "$_pkgname"

  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  install -Dm 644 "../lite.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
  install -Dm 644 "${_pkgname}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
