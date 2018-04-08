# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based On: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdlmame-wout-toolkits
pkgver=0.196
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
             'glm'
             'wget'
             'python-sphinx'
             )
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        'sdlmame.sh'
        )
sha256sums=('fc4436a23d7f2ef0b3c3f600c00745bc468541d0d29bcd3a1e0c599c5c02df7f'
            'd0289344e2260411965a56290cb4744963f48961326ce7f41b90f75f4221bb42'
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
       USE_SYSTEM_LIB_SQLITE3=1 \
       USE_SYSTEM_LIB_GLM=1

}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the sdlmame script
  install -Dm755 "${srcdir}/sdlmame.sh" "${pkgdir}/usr/bin/sdlmame"

  # Install the applications and the UI font in /usr/share
  install -Dm755 mame64 "${pkgdir}/usr/share/sdlmame/sdlmame"
  _apps=('castool'
         'chdman'
         'floptool'
         'imgtool'
         'jedutil'
         'ldresample'
         'ldverify'
         'nltool'
         'nlwav'
         'pngcmp'
         'regrep'
         'romcmp'
         'split'
         'src2html'
         'srcclean'
         'unidasm'
         )
  for i in "${_apps[@]}"; do install -Dm755 "${i}" "${pkgdir}/usr/share/sdlmame/${i}"; done

  # Install the extra bits
  _extra=('artwork'
          'bgfx'
          'hash'
          'hlsl'
          'ini'
          'keymaps'
          'language'
          'plugins'
          'roms'
          )
  for i in $(find ${_extra[@]} -type f); do install -Dm644 "${i}" "${pkgdir}/usr/share/sdlmame/${i}"; done
  install -d "${pkgdir}/usr/share/sdlmame/shader"
  install -m644 src/osd/modules/opengl/shader/glsl*.*h "${pkgdir}/usr/share/sdlmame/shader/"
  install -Dm644 uismall.bdf "${pkgdir}/usr/share/sdlmame/fonts/uismall.bdf"

  # Install man
  (cd docs/man/; for i in $(find . -type f -name '*.1'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man1/${i}"; done)
  (cd docs/man/; for i in $(find . -type f -name '*.6'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man6/${i}"; done)

  # Include the license
  install -Dm644 docs/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # documentation
  (cd docs; make BUILDDIR="${pkgdir}/usr/share/doc/${pkgname}" html)
}
