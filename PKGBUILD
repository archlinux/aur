# Maintainer: Echo J. <aidas957 at gmail dot com>
# Contributor: dakriy <aur at persignum dot com>
# shellcheck shell=bash disable=SC2034,SC2164

# Based on the classicube-git package (https://aur.archlinux.org/packages/classicube-git)

_pkgname=ClassiCube
pkgname=classicube
pkgver=1.3.8
pkgrel=1
pkgdesc="A custom Minecraft Classic compatible client written in C from scratch"
arch=('x86_64')
url="https://www.classicube.net/"
license=('BSD-3-Clause') # Main ClassiCube license
license+=('CC0-1.0') # Some function licenses (these are actually ambiguous public domain)
license+=('FTL') # Bundled FreeType license
license+=('MIT') # bundled BearSSL license
depends=('bash' 'libglvnd' 'openal' 'sdl3')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/${pkgver}.tar.gz"
        ClassiCubeLauncher)
sha256sums=('35293acf1e63baeca832dec2512283f2975c79ddf80cc855a12c10464723a6c4'
            '8a562c0358bca5217ea914f76dfe821a121d035d72b98287162750b850a4c25d')

prepare() {
  cd "${_pkgname}-${pkgver}"

  ## TODO: Upstream most of these changes by 1.3.9

  # Don't override external compile flags
  sed -i -e '0,/CFLAGS  =/{s//CFLAGS ?=/}' -e '0,/LDFLAGS =/{s//LDFLAGS ?=/}' Makefile

  # Use SDL3 instead of the X11 Linux default (avoids requiring X11 stuff)
  sed -i '0,/-lX11 -lXi/{s//-lSDL3/}' Makefile
  sed -i -e '0,/DEFAULT_WIN_BACKEND CC_WIN_BACKEND_X11/{//d}' -e '0,/CC_BUILD_XINPUT2/{//d}' src/Core.h

  # Remove spammy log calls
  sed -i '/Face:/d' src/SystemFonts.c
  sed -i '/Adding/d' src/_HttpBase.h

  # Make SDL dialogs actually work
  sed -i '/SIGCHLD/d' src/Platform_Posix.c

  # Fix up the upstream desktop file
  sed -i -e 's/net.classicube.flatpak.client/ClassiCube/g' \
     -e 's/ClassiCubeLauncher/ClassiCubeLauncher %u/' misc/flatpak/net.classicube.flatpak.client.desktop
}

build() {
  export CFLAGS+=" -DDEFAULT_WIN_BACKEND=CC_WIN_BACKEND_SDL3"
  make -C "${_pkgname}-${pkgver}"
}

package() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/ClassiCube"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -Dm644 misc/CCicon.png "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  install -Dm644 misc/flatpak/net.classicube.flatpak.client.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # TODO: Make the upstream launch script more robust by 1.3.9 (and use it instead)
  install -Dm755 ../ClassiCubeLauncher "$pkgdir/usr/bin/ClassiCubeLauncher"
}
