# Maintainer: Melvin Vermeeren <mail@mel.vin>
# Co-Maintainer: oi_wtf <brainpower at mailbox dot org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=lib32-sdl-openglhq
pkgver=1.2.15
pkgrel=2
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (with OpenGLHQ patch) (32-bit)"
arch=('x86_64')
url="https://libsdl.org"
license=('LGPL')
depends=('lib32-libxext' 'lib32-libxrender' 'lib32-libx11' 'sdl-openglhq')
makedepends=('lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse' 'lib32-glu' 'gcc-multilib')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
conflicts=('lib32-sdl')
provides=("lib32-sdl=${pkgver}")
options=('staticlibs')
source=("https://libsdl.org/release/SDL-${pkgver}.tar.gz"
        "https://libsdl.org/release/SDL-${pkgver}.tar.gz.sig"
        'SDL-1.2.10-GrabNotViewable.patch'
        'SDL-1.2.15-SDL_EnableUNICODE_drops_keyboard_events.patch'
        'SDL-1.2.15-const_XData32.patch'
        'SDL-1.2.15-ignore_insane_joystick_axis.patch'
        'SDL-1.2.15-no-default-backing-store.patch'
        'SDL-1.2.15-x11-Bypass-SetGammaRamp-when-changing-gamma.patch'
        'sdl-1.2.14-fix-mouse-clicking.patch'
        'sdl-1.2.14-disable-mmx.patch'
        'libsdl-1.2.15-resizing.patch'
        'X11_KeyToUnicode.patch'
        'openglhq-dosbox-for-sdl-20130726_msvc_gcc.patch')
sha256sums=('d6d316a793e5e348155f0dd93b979798933fb98aa1edebcc108829d6474aad00'
            'SKIP'
            'ea2042b8a45a083b1447d5c56e52b23b79f2ddb0d717ec7b287b34ef71bd2d1a'
            '292046466d52a2ebe995a0121404864e4ee0de2b6024203acb95bbd600844da0'
            'bab60b515a74b71650ee71d5a0075c77046a7bad48b061673c3798dbdd35446d'
            '7586d6124d5452ad721ca6aa10eae09946d94854748e22f9c9c6fdca3d0aeb12'
            '3941c44a5580df95c6868936cfc57ba3e7b6952fb8a3eb14f963d54d9d8ca8a4'
            'd296af5bb0d9856d049b4e5adb9dd995d2a1e51d76a6adf63457e65101a50620'
            '8d178f13eb707e81f5f9d86bf7b609ae8f0bac937fb4a37ebcbf4bbc9b89e21b'
            '17bb880dd2cb4922d4e3771d146660b9da8be8f1629a5cdaae7523d4a9d2bd7c'
            '5160fb1c07b04480d98d45b89a0aa6e577f2ac4c3bace0c80b251e6aca1fb4a1'
            'b1ad9c60829b166e6b647006d6549ea657155e755cf574fcfc4b91b658654769'
            'a6ed17aa0ac72f52e5426803e7f1e0642500cb7124d5ba09f60284ebef76bc48')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

prepare() {
  cd "SDL-${pkgver}"
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
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "SDL-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --disable-nasm --enable-alsa \
              --with-x --disable-rpath --disable-static --libdir=/usr/lib32
  make
}

package() {
  cd "SDL-${pkgver}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/"{include,share}

  mv "${pkgdir}/usr/bin/sdl-config" "${pkgdir}/usr/bin/sdl-config-32"
}
