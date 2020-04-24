# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Andrew Bueide <abueide@protonmail.com>
# Maintainer: rouhannb <rouhannb@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-skia-bin
pkgver=1.2.18
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url='http://www.aseprite.org/'
license=('custom')
depends=('cmark' 'curl' 'giflib' 'zlib' 'libpng' 'tinyxml' 'freetype2'
         'fontconfig' 'libxcursor' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'freeglut' 'harfbuzz-icu' 'nettle' 'libxi')
provides=('aseprite')
conflicts=('aseprite-git' 'aseprite-gpl' 'skia-git' 'aseprite')
source=("https://github.com/aseprite/aseprite/releases/download/v${pkgver}/Aseprite-v${pkgver}\
-Source.zip"
'https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip'
'aseprite.desktop'
)
noextract=('Skia-Linux-Release-x64.zip')
sha256sums=('8ac253a002b14a9064d0ebcb99ad5fc715fd021c64ae9c9faa5f0facf1beb998'
            '37cb146efbffb0571a541c48acd7926ed6571cd3aa50be67f8a9b97901e26769'
            'deaf646a615c79a4672b087562a09c44beef37e7acfc6f5f66a437d4f3b97a25')

prepare() {
  mkdir --verbose "${srcdir}/skia"
  bsdtar --extract --verbose --directory "${srcdir}/skia" --file 'Skia-Linux-Release-x64.zip'
}

build() {
  cd "${srcdir}"

  mkdir --parents --verbose build && cd build

  cmake \
    -DWITH_WEBP_SUPPORT=ON \
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_CMARK=ON \
    -DENABLE_UPDATER=OFF \
    -DUSE_SHARED_FREETYPE=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLAF_BACKEND=skia \
    -DSKIA_DIR="${srcdir}/skia" \
    -DSKIA_LIBRARY_DIR="${srcdir}/skia/out/Release-x64" \
    -G Ninja \
    ..

  ninja aseprite
}

package() {
  cd "${srcdir}"/build

  install -D --verbose 'bin/aseprite' "${pkgdir}/usr/bin/aseprite"

  # Aseprite, by default, doesn't install a few files on its own. So, they are installed manually.

  install --directory --verbose "${pkgdir}/usr/share/aseprite/data"
  cp --recursive --verbose 'bin/data' "${pkgdir}/usr/share/aseprite"

  install --directory --verbose "${pkgdir}/usr/share/doc/aseprite"
  cp --recursive --verbose '../docs' "${pkgdir}/usr/share/doc/aseprite"
  install --mode=644 --verbose 'bin/data/EULA.txt' "${pkgdir}/usr/share/doc/aseprite"
  install --mode=644 --verbose '../README.md' "${pkgdir}/usr/share/doc/aseprite"

  install -D --mode=644 --verbose '../aseprite.desktop' \
    "${pkgdir}/usr/share/applications/aseprite.desktop"

  for _size in 32 48 64
  do
    install -D --mode=644 --verbose "../data/icons/ase${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/aseprite.png"
  done

  install -D --mode=644 --verbose --target-directory "${pkgdir}/usr/share/licenses/${pkgname}" \
    'bin/data/EULA.txt'
  install --mode=644 --verbose '../docs/LICENSES.md' "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
