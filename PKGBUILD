# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based On: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdlmame-wout-toolkits
pkgver=0.207
pkgrel=2
pkgdesc="A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support. Without Qt toolkit"
url='http://mamedev.org'
license=('custom:MAME License')
arch=('x86_64')
conflicts=('sdlmame'
           'sdlmamefamily-tools'
           'mame'
           )
depends=('sdl2_ttf'
         'lua'
         'flac'
         'portmidi'
         'portaudio'
         'libjpeg-turbo'
         'fontconfig'
         'sqlite'
         'libutf8proc'
         'pugixml'
         )
makedepends=('nasm'
             'mesa'
             'glu'
             'glm'
             'wget'
             'asio'
             'python-sphinxcontrib-svg2pdfconverter'
             'rapidjson'
             )
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        'mame.sh'
        )
sha256sums=('69c29533d2128345c59fbf23fabc3af696322a77a6c1d7a7bd7f5a2ee57adafb'
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
       USE_SYSTEM_LIB_ASIO=1 \
       USE_SYSTEM_LIB_EXPAT=1 \
       USE_SYSTEM_LIB_ZLIB=1 \
       USE_SYSTEM_LIB_JPEG=1 \
       USE_SYSTEM_LIB_FLAC=1 \
       USE_SYSTEM_LIB_LUA=1 \
       USE_SYSTEM_LIB_SQLITE3=1 \
       USE_SYSTEM_LIB_PORTMIDI=1 \
       USE_SYSTEM_LIB_PORTAUDIO=1 \
       USE_SYSTEM_LIB_UTF8PROC=1 \
       USE_SYSTEM_LIB_GLM=1 \
       USE_SYSTEM_LIB_RAPIDJSON=1 \
       USE_SYSTEM_LIB_PUGIXML=1 \

}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the sdlmame script
  install -Dm755 "${srcdir}/mame.sh" "${pkgdir}/usr/bin/mame"

  # Install the applications and the UI font in /usr/share
  install -Dm755 mame64 "${pkgdir}/usr/lib/mame/mame"
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
         'testkeys'
         'unidasm'
         )
  for i in "${_apps[@]}"; do install -Dm755 "${i}" "${pkgdir}/usr/lib/mame/${i}"; done

  # Install the extra bits
  _extra=('artwork'
          'bgfx'
          'ctrlr'
          'hash'
          'hlsl'
          'keymaps'
          'language'
          'plugins'
          'roms'
          )
  for i in $(find ${_extra[@]} -type f); do install -Dm644 "${i}" "${pkgdir}/usr/lib/mame/${i}"; done
  (cd src/osd/modules/opengl/shader; for i in glsl*.*h; do install -Dm644 "${i}" "${pkgdir}/usr/lib/mame/shader/${i}"; done)
  install -Dm644 uismall.bdf "${pkgdir}/usr/lib/mame/fonts/uismall.bdf"

  # Install man
  (cd docs/man/; for i in $(find . -type f -name '*.1'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man1/${i}"; done)
  (cd docs/man/; for i in $(find . -type f -name '*.6'); do install -Dm644 "${i}" "${pkgdir}/usr/share/man/man6/${i}"; done)

  # Include the license
  install -Dm644 docs/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # documentation
  (cd docs; make BUILDDIR="${pkgdir}/usr/share/doc/${pkgname}" html)
  for i in $(find "${pkgdir}/usr/share/doc/${pkgname}" -type f); do
    sed -e "s|${srcdir}||g" \
        -e "s|${pkgdir}||g" \
        -i "${i}"
  done
  
}
