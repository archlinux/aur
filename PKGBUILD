# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=altirrasdl-git
pkgver=r229.4e084cc
pkgrel=1
pkgdesc="An 8-bit Atari computer emulator, native SDL"
arch=('x86_64' 'aarch64')
url="https://github.com/ilmenit/AltirraSDL"
license=('GPL2')
depends=('cmake' 'sdl3' 'sdl3_image')
optdepends=('librashader')
makedepends=('git')
source=("git+https://github.com/ilmenit/AltirraSDL.git")
sha256sums=('SKIP')

pkgver() {
  cd "AltirraSDL"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "AltirraSDL"
  JOBS=$(grep "^MAKEFLAGS=" /etc/makepkg.conf) || true
  JOBS=$(echo "${JOBS//MAKEFLAGS=\"-j}" | tr -d "\"")
  [ -n "${JOBS}" ] && JOBS="--jobs ${JOBS}"
  ./build.sh ${JOBS}
}

package() {
  cd "AltirraSDL"
  sed -i 's/Name=Altirra/Name=AltirraSDL/' "${srcdir}/AltirraSDL/dist/linux/altirra.desktop"
  sed -i 's/Icon=altirra/Icon=altirraSDL/' "${srcdir}/AltirraSDL/dist/linux/altirra.desktop"
  install -Dm655 "${srcdir}/AltirraSDL/build/linux-release/src/AltirraSDL/AltirraSDL" "${pkgdir}/usr/bin/AltirraSDL"
  install -Dm644 "${srcdir}/AltirraSDL/dist/linux/altirra.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm644 "${srcdir}/AltirraSDL/dist/linux/altirra.png" "${pkgdir}/usr/share/pixmaps/${pkgname%sdl-git}SDL.png"
}
