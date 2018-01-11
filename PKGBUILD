# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based On: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdlmame-wout-toolkits
pkgver=0.193
pkgrel=1
pkgdesc="A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support. Without Qt toolkit"
url='http://mamedev.org'
license=('custom:MAME License')
arch=('x86_64')
conflicts=('sdlmame' 'sdlmamefamily-tools')
depends=('sdl2_ttf'
         'alsa-lib'
         'lua'
         'flac'
         'portmidi'
         'portaudio'
         'libjpeg-turbo'
         'fontconfig'
         'sqlite'
         'libutf8proc'
         )
makedepends=('nasm'
             'mesa'
             'glu'
             'wget'
             'python'
             )
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        'sdlmame.sh'
        )
sha256sums=('6b5e90b602befbcad2b6989b1e930d0ff6e537dc901f7b1615a3e6deec2207a2'
            '201e9cc3d0d7397e15a4aaf7477f8b32a379a9ba2134b94180cdaf2067d1f859'
            )
install=sdlmame-wout-toolkits.install

build() {
  cd "mame-mame${pkgver/./}"

  make PTR64=1 \
       SSE2=1 \
       OPTIMIZE=2 \
       NOWERROR=1 \
       ARCHOPTS=-flifetime-dse=1 \
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
       USE_SYSTEM_LIB_PORTAUDIO=1 \
       USE_SYSTEM_LIB_UTF8PROC=1 \
       USE_SYSTEM_LIB_SQLITE3=1
}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the sdlmame script
  install -Dm755 ../sdlmame.sh "${pkgdir}/usr/bin/sdlmame"

  # Install the applications and the UI font in /usr/share
  install -Dm755 "mame64" "${pkgdir}/usr/share/sdlmame/sdlmame"

  # Install the applications
  install -Dm755 castool    "${pkgdir}/usr/bin/castool"
  install -Dm755 chdman     "${pkgdir}/usr/bin/chdman"
  install -Dm755 floptool   "${pkgdir}/usr/bin/floptool"
  install -Dm755 imgtool    "${pkgdir}/usr/bin/imgtool"
  install -Dm755 jedutil    "${pkgdir}/usr/bin/jedutil"
  install -Dm755 ldresample "${pkgdir}/usr/bin/ldresample"
  install -Dm755 ldverify   "${pkgdir}/usr/bin/ldverify"
  install -Dm755 nltool     "${pkgdir}/usr/bin/nltool"
  install -Dm755 nlwav      "${pkgdir}/usr/bin/nlwav"
  install -Dm755 pngcmp     "${pkgdir}/usr/bin/pngrep"
  install -Dm755 regrep     "${pkgdir}/usr/bin/regrep"
  install -Dm755 romcmp     "${pkgdir}/usr/bin/romcmp"
  install -Dm755 split      "${pkgdir}/usr/bin/splitmamerom"
  install -Dm755 src2html   "${pkgdir}/usr/bin/src2html"
  install -Dm755 srcclean   "${pkgdir}/usr/bin/srcclean"
  install -Dm755 unidasm    "${pkgdir}/usr/bin/unidasm"

  # Install the extra bits
  for i in artwork bgfx hash hlsl ini keymaps language plugins; do
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
}
