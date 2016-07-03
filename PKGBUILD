# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based On: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdlmame-wout-toolkits
pkgver=0.175
pkgrel=1
pkgdesc="A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support. Without Qt toolkit"
url='http://mamedev.org'
license=('custom:MAME License')
arch=('i686' 'x86_64')
conflicts=('sdlmame' 'sdlmamefamily-tools')
depends=('sdl2_ttf'
         'alsa-lib'
         'lua'
         'flac'
         'portmidi'
         'libjpeg-turbo'
         'fontconfig'
         )
makedepends=('nasm'
             'mesa'
             'glu'
             'wget'
             'python'
             )
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        'sdlmame.sh'
        'extras.tar.gz')
sha1sums=('5b308fa2f0d825090a59e18d5172b99f4503c111'
          '1ed8016f41edecfca746fadcfb40eab78845a3d6'
          '75732974431844670aa3904d8f9ce3f5c5504827')
install=sdlmame-wout-toolkits.install
noextract=('extras.tar.gz')

prepare() {
  cd "mame-mame${pkgver/./}"

  bsdtar -xf ../extras.tar.gz
}

build() {
  cd "mame-mame${pkgver/./}"

  [ "${CARCH}" = "i686" ] && _use_64bits=0
  [ "${CARCH}" = "x86_64" ] && _use_64bits=1

  make PTR64="${_use_64bits}" \
       SSE2="${_use_64bits}" \
       OPTIMIZE=2 \
       NOWERROR=1 \
       USE_QTDEBUG=0 \
       TOOLS=1 \
       TEST=0 \
       STRIP_SYMBOLS=1 \
       VERBOSE=1 \
       USE_SYSTEM_LIB_EXPAT=1 \
       USE_SYSTEM_LIB_ZLIB=1 \
       USE_SYSTEM_LIB_JPEG=1 \
       USE_SYSTEM_LIB_FLAC=1 \
       USE_SYSTEM_LIB_LUA=1 \
       USE_SYSTEM_LIB_PORTMIDI=1 \
       USE_SYSTEM_LIB_PORTAUDIO=1
}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the sdlmame script
  install -Dm755 ../sdlmame.sh "${pkgdir}/usr/bin/sdlmame"

  # Install the applications and the UI font in /usr/share
  [ "${CARCH}" = "x86_64" ] && _suffix="64"
  install -Dm755 "mame${_suffix}" "${pkgdir}/usr/share/sdlmame/sdlmame"

  # Install the applications
  install -Dm755 castool    "${pkgdir}/usr/bin/castool"
  install -Dm755 chdman     "${pkgdir}/usr/bin/chdman"
  install -Dm755 floptool   "${pkgdir}/usr/bin/floptool"
  install -Dm755 imgtool    "${pkgdir}/usr/bin/imgtool"
  install -Dm755 jedutil    "${pkgdir}/usr/bin/jedutil"
  install -Dm755 ldresample "${pkgdir}/usr/bin/ldresample"
  install -Dm755 ldverify   "${pkgdir}/usr/bin/ldverify"
  install -Dm755 nltool     "${pkgdir}/usr/bin/nltool"
  install -Sm755 nlwav      "${pkgdir}/usr/bin/nlwav"
  install -Dm755 pngcmp     "${pkgdir}/usr/bin/pngrep"
  install -Dm755 regrep     "${pkgdir}/usr/bin/regrep"
  install -Dm755 romcmp     "${pkgdir}/usr/bin/romcmp"
  install -Dm755 split      "${pkgdir}/usr/bin/splitmamerom"
  install -Dm755 src2html   "${pkgdir}/usr/bin/src2html"
  install -Dm755 srcclean   "${pkgdir}/usr/bin/srcclean"
  install -Dm755 unidasm    "${pkgdir}/usr/bin/unidasm"

  # Install the extra bits
  for i in artwork bgfx ctrlr hash hlsl ini keymaps language plugins; do
    for e in $(find ${i} -type f); do install -Dm644 "${e}" ${pkgdir}/usr/share/sdlmame/${e}; done
  done
  install -d "${pkgdir}/usr/share/sdlmame/shader"
  install -m644 src/osd/modules/opengl/shader/glsl*.*h "${pkgdir}/usr/share/sdlmame/shader/"

  # Install man
  (cd docs/man/; for i in $(find . -type f -name '*.1'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man1/${i}"; done)
  (cd docs/man/; for i in $(find . -type f -name '*.6'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man6/${i}"; done)

  # Include the license
  install -Dm644 docs/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # documentation
  (cd docs; for i in $(find . -maxdepth 1 -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/${pkgname}/${i}"; done)

  # FS#28203
  sed -e 's|KEYCODE_2_PAD|KEYCODE_2PAD|' \
      -e 's|KEYCODE_4_PAD|KEYCODE_4PAD|' \
      -e 's|KEYCODE_6_PAD|KEYCODE_6PAD|' \
      -e 's|KEYCODE_8_PAD|KEYCODE_8PAD|' \
      -i "${pkgdir}/usr/share/sdlmame/ctrlr/"*.cfg
}
