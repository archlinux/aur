# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: dakriy <aur at persignum dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# Based on the classicube-git package (https://aur.archlinux.org/packages/classicube-git)

_pkgname=ClassiCube
pkgname=classicube
pkgver=1.3.6
pkgrel=1
pkgdesc="A custom Minecraft Classic compatible client written in C from scratch"
arch=('x86_64')
url="https://www.classicube.net/"
license=('BSD-3-Clause') # Main ClassiCube license
license+=('CC0-1.0') # Some function licenses (these are actually ambiguous public domain)
license+=('FTL') # Bundled FreeType license
depends=('bash' 'curl' 'libglvnd' 'openal' 'sdl2')
optdepends=('zenity: Dialog box support')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        sdl2-dialog.patch
        ClassiCubeLauncher
        ClassiCube.desktop)
sha256sums=('fab780f4dcf0669a0f94683c9b6596f40cb83e09727a3b91aaae5e934a9740b0'
            '4bc98c1f4f881d28f8c042b3d0d6c25c63303965702b82cfed6f17909922a74c'
            'abcf649e1e886f0c3278648ebf4eb8f6d070ac1358e26920ceaa396624cac91e'
            '2c11b3f517f68b6322b007922999d7a8b51fab183ee6cc51c0260f3ae56d0a4a')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Don't override makepkg compile flags
  sed -i -e '0,/CFLAGS=/{s//CFLAGS?=/}' -e '0,/LDFLAGS=/{s//LDFLAGS?=/}' Makefile

  # Change to SDL2 on Linux
  sed -i '0,/-lX11 -lXi/{s//-lSDL2/}' Makefile
  sed -i -e '0,/CC_BUILD_X11/{//d}' -e '0,/CC_BUILD_XINPUT2/{//d}' src/Core.h
  sed -i '/#error/d' src/Window_SDL.c
  patch --no-backup-if-mismatch --binary -Np1 -i ../sdl2-dialog.patch

  # Fix an incompatible pointer error (this is unnecessary in the git version)
  sed -i 's/samples, count \* 2/(cc_uint8*)samples, count * 2/' src/Resources.c

  # Remove spammy log calls
  sed -i '/Face:/d' src/SystemFonts.c
  sed -i '/Adding/d' src/_HttpBase.h

  # Make SDL dialogs actually work
  sed -i '/SIGCHLD/d' src/Platform_Posix.c

  # Fix SDL fullscreen exit
  sed -i 's/SDL_RestoreWindow(win_handle); return 0;/return SDL_SetWindowFullscreen(win_handle, 0);/' src/Window_SDL.c
}

build() {
  export CFLAGS+=" -DCC_BUILD_SDL -DCC_BUILD_GLMODERN"
  make -C "${_pkgname}-${pkgver}"
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/ClassiCube"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 misc/CCicon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  # TODO: Use upstream launch files directly once there's a new release
  install -Dm755 ../ClassiCubeLauncher "$pkgdir/usr/bin/ClassiCubeLauncher"
  install -Dm644 ../${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
