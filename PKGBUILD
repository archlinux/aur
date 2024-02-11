# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-uosc-git
_gitname=uosc
pkgver=5.2.0.r0.g60dc197
pkgrel=1
pkgdesc='Feature-rich minimalist proximity-based UI for MPV player'
arch=(x86_64)
url=https://github.com/tomasklaen/uosc
license=(
  LGPL-2.1-or-later
)
makedepends=(
  git
  go
  upx
)
depends=(
  mpv
)
optdepends=('mpv-thumbfast: for showing thumbnails on-the-fly on seek')
provides=(mpv-uosc)
conflicts=(
  mpv-uosc
  'mpv<0.33'
)
source=(
  uosc::git+https://github.com/tomasklaen/uosc.git
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  GOOS="linux"
  GOARCH="amd64"
  go build -ldflags "-s -w" -o "ziggy-linux" "src/ziggy/ziggy.go"
  upx --brute "ziggy-linux"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 644 "src/fonts/"* -t "${pkgdir}/etc/mpv/fonts/"
  install -Dm 644 "src/uosc.conf" -t "${pkgdir}/etc/mpv/script-opts/"
  install -Dm 755 "ziggy-linux" -t "${pkgdir}/etc/mpv/scripts/uosc/bin/"
  for dir in {char-conv,elements,intl,lib}; do
    install -Dm 644 "src/uosc/${dir}/"* -t "${pkgdir}/etc/mpv/scripts/uosc/${dir}/"
  done
  install -Dm 644 "src/uosc/main.lua" -t "${pkgdir}/etc/mpv/scripts/uosc/"
  install -Dm 644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:

