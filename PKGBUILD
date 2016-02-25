# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: oi_wtf <brainpower at mailbox dot org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=sdl-openglhq-nokbgrab
pkgver=1.2.15
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (with OpenGLHQ and noXGrabKeyboard patches)"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
makedepends=('alsa-lib' 'mesa' 'libpulse' 'glu')
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
conflicts=("sdl"
           "sdl-nokbgrab"
           "sdl-openglhq")
provides=("sdl=$pkgver"
          "sdl-nokbgrab=$pkgver"
          "sdl-openglhq=$pkgver")
options=('staticlibs')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz
        SDL-1.2.10-GrabNotViewable.patch
        SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch
        SDL-1.2.15-const_XData32.patch
        SDL-1.2.15-ignore_insane_joystick_axis.patch
        SDL-1.2.15-no-default-backing-store.patch
        SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch
        sdl-1.2.14-fix-mouse-clicking.patch
        sdl-1.2.14-disable-mmx.patch
        libsdl-1.2.15-resizing.patch
        X11_KeyToUnicode.patch
        openglhq-dosbox-for-sdl-20130726_msvc_gcc.patch)
md5sums=('9d96df8417572a2afb781a7c4c811a85'
         '37ad001a4d2ff924a5fab356b49f8a78'
         '8d5a61a0adf1a302695a30141f402712'
         'd6a1bfa054507f281338626e5f12d74b'
         'e382e5b7449e95969c5ba4084b0aab39'
         '1b0578c76453813eb4eaf0125ce242db'
         '321377e38e2db7f1baf43c392e165dd5'
         '04d8c179f125e04bcd4c9d60e013c2d7'
         'e5c16b7611f62c7cb25f0534eff68852'
         '3dd50347d8856160a9cbd7f80383a1f8'
         'edea272dff4698470877c016d818918d'
         'fb22bc709430fd280b64d5406375c7f4')

prepare() {
  cd SDL-$pkgver
  patch -Np1 -i "${srcdir}/SDL-1.2.10-GrabNotViewable.patch"
  patch -Np1 -i "${srcdir}/SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch"
  patch -Np1 -i "${srcdir}/SDL-1.2.15-const_XData32.patch"
  patch -Np1 -i "${srcdir}/SDL-1.2.15-ignore_insane_joystick_axis.patch"
  patch -Np1 -i "${srcdir}/SDL-1.2.15-no-default-backing-store.patch"

  # https://bugs.freedesktop.org/show_bug.cgi?id=27222
  patch -Np1 -i "${srcdir}/SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch"

  patch -Np1 -i "${srcdir}/sdl-1.2.14-fix-mouse-clicking.patch"
  patch -Np1 -i "${srcdir}/sdl-1.2.14-disable-mmx.patch"
  patch -Np1 -i "${srcdir}/libsdl-1.2.15-resizing.patch"
  patch -Np1 -i "${srcdir}/X11_KeyToUnicode.patch"
  patch -Np1 -i "${srcdir}/openglhq-dosbox-for-sdl-20130726_msvc_gcc.patch"

  sed -i '/XGrabKeyboard/{s_^_//_;n;s_^_//_}' src/video/x11/SDL_x11wm.c
}

build() {
  cd SDL-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static
  make
}

package() {
  cd SDL-$pkgver
  make DESTDIR="$pkgdir" install
}
