# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Based On: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=sdlmame-wout-toolkits
pkgver=0.240
pkgrel=1
pkgdesc="A port of the popular Multiple Arcade Machine Emulator using SDL with OpenGL support. Without Qt toolkit"
url='http://mamedev.org'
license=('custom:MAME License')
arch=('x86_64')
conflicts=('sdlmame'
           'sdlmamefamily-tools'
           'mame'
           )
provides=('sdlmame')
depends=('sdl2_ttf'
         'lua53'
         'libxi'
         'libpulse.so'
         'libportaudio.so'
         'libportmidi.so'
         'libjpeg.so'
         'libFLAC.so'
         'fontconfig'
         'sqlite'
         'libutf8proc'
         'pugixml'
         'hicolor-icon-theme'
         )
makedepends=('nasm'
             'mesa'
             'glu'
             'glm'
             'wget'
             'asio'
             'libpulse'
             'portmidi'
             'portaudio'
             'libjpeg-turbo'
             'flac'
             'python-sphinxcontrib-svg2pdfconverter'
             'rapidjson'
             )
source=("https://github.com/mamedev/mame/archive/mame${pkgver/./}.tar.gz"
        'mame.sh'
        'https://raw.githubusercontent.com/archlinux/svntogit-community/packages/mame/trunk/mame.desktop'
        'https://raw.githubusercontent.com/archlinux/svntogit-community/packages/mame/trunk/mame.svg'
        )
sha256sums=('f5228ccd7e561e8ee6e42d85f1f1be3432f4869169a4d692e646a6959c5c8f75'
            '4447b80208ac512764f78fce52aef159ba494db2762c04c6fd79e2aceed5307b'
            '0e5e93f84673c2d17a1bf7a6b256cfa54ef89a086a828df19bc054c12776d821'
            '17c442c933d764175e4ce1de50a80c0c2ddd5d733caf09c3cd5e6ba697ac43f4'
            )
install=sdlmame-wout-toolkits.install

build() {
  cd "mame-mame${pkgver/./}"

  export CFLAGS+=" -I/usr/include/lua5.3/"
  export CXXFLAGS+=" -I/usr/include/lua5.3/"

  export CXXFLAGS+=" -Wp,-U_GLIBCXX_ASSERTIONS" # FS#73202

  # Hack to force linking to lua5.3
  mkdir lib
  ln -s /usr/lib/liblua5.3.so lib/liblua.so
  export LDFLAGS+=" -L${PWD}/lib"

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
       USE_BUNDLED_LIB_SDL2=0

}

package() {
  cd "mame-mame${pkgver/./}"

  # Install the sdlmame script
  install -Dm755 "${srcdir}/mame.sh" "${pkgdir}/usr/bin/mame"

  # Install the applications, and the UI font in /usr/share
  install -Dm755 mame "${pkgdir}/usr/lib/mame/mame"
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
         'srcclean'
         'testkeys'
         'unidasm'
         )
  for i in "${_apps[@]}"; do
    install -Dm755 "${i}" "${pkgdir}/usr/lib/mame/${i}"
    ln -s "../lib/mame/${i}" "${pkgdir}/usr/bin/mame-${i}"
  done

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

  # install desktop file and icon
  install -Dm644 "${srcdir}/mame.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/mame.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
