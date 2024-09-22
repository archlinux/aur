# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: dakriy <aur at persignum dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# Based on the classicube-git package (https://aur.archlinux.org/packages/classicube-git)

_pkgname=ClassiCube
pkgname=classicube
pkgver=1.3.7
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
        ClassiCubeLauncher)
sha256sums=('04f96eb2cc338b81a36a843b7d1f23de54ef539a80d2b793bbef69aa9043585f'
            '277b5ab664238d5f3a55d7ba0e75e92deb120b4bb8e29d0b8c22c2bfd9bda34f'
            '8a562c0358bca5217ea914f76dfe821a121d035d72b98287162750b850a4c25d')

prepare() {
  cd "${_pkgname}-${pkgver}"

  ## TODO: Upstream most of these changes by 1.3.8

  # Don't override external compile flags
  sed -i -e '0,/CFLAGS  =/{s//CFLAGS ?=/}' -e '0,/LDFLAGS =/{s//LDFLAGS?=/}' Makefile

  # Switch to SDL2 on Linux (SDL3 is still in development)
  sed -i '0,/-lX11 -lXi/{s//-lSDL2 -lm/}' Makefile
  sed -i -e '0,/DEFAULT_WIN_BACKEND CC_WIN_BACKEND_X11/{//d}' -e '0,/CC_BUILD_XINPUT2/{//d}' src/Core.h
  patch --no-backup-if-mismatch --binary -Np1 -i ../sdl2-dialog.patch

  # Remove spammy log calls
  sed -i '/Face:/d' src/SystemFonts.c
  sed -i '/Adding/d' src/_HttpBase.h

  # Make SDL dialogs actually work
  sed -i '/SIGCHLD/d' src/Platform_Posix.c

  # Fix SDL2 fullscreen exit
  sed -i 's/SDL_RestoreWindow(win_handle); return 0;/return SDL_SetWindowFullscreen(win_handle, 0);/' src/Window_SDL2.c

  # Fix up the upstream desktop file
  sed -i -e 's/net.classicube.flatpak.client/ClassiCube/g' \
     -e 's/ClassiCubeLauncher/ClassiCubeLauncher %u/' misc/linux/flatpak/net.classicube.flatpak.client.desktop
}

build() {
  export CFLAGS+=" -DDEFAULT_WIN_BACKEND=CC_WIN_BACKEND_SDL2"
  make -C "${_pkgname}-${pkgver}"
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/ClassiCube"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 misc/CCicon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 misc/linux/flatpak/net.classicube.flatpak.client.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # TODO: Use upstream launch script directly by 1.3.8
  install -Dm755 ../ClassiCubeLauncher "$pkgdir/usr/bin/ClassiCubeLauncher"
}
