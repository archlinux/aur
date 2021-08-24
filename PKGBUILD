# Maintainer: Typology <mohammedkaabi64@gmail.com>
# Maintainer: Fredrick Brennan <copypaste@kittens.ph>
# Maintainer: Andrew Bueide <abueide@protonmail.com>
# Maintainer: rouhannb <rouhannb@gmail.com>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Benoit Favre <benoit.favre@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Kamil Biduś <kamil.bidus@gmail.com>

pkgname=aseprite-skia-bin
pkgver=1.2.29
pkgrel=1
pkgdesc='Create animated sprites and pixel art'
arch=('x86_64')
url='http://www.aseprite.org/'
license=('custom')
depends=('cmark' 'curl' 'libjpeg-turbo' 'giflib' 'zlib' 'libpng' 'tinyxml' 'pixman' 'freetype2'
         'fontconfig' 'libxcursor' 'hicolor-icon-theme')
makedepends=('cmake' 'libglvnd' 'ninja' 'freeglut' 'harfbuzz-icu' 'nettle' 'libxi')
provides=('aseprite')
conflicts=('aseprite-git' 'aseprite-gpl' 'skia-git' 'aseprite')
source=("https://github.com/aseprite/aseprite/releases/download/v${pkgver}/Aseprite-v${pkgver}\
-Source.zip"
'https://github.com/aseprite/skia/releases/download/m81-b607b32047/Skia-Linux-Release-x64.zip'
'aseprite.desktop'
)
noextract=('Skia-Linux-Release-x64.zip')
sha256sums=('ed37e12495bf81ad1126076ec2634b132976c40dd56d4f3924e6fddad4a1e2e4'
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
    -DUSE_SHARED_CURL=ON \
    -DUSE_SHARED_JPEGLIB=ON \
    -DUSE_SHARED_GIFLIB=ON \
    -DUSE_SHARED_ZLIB=ON \
    -DUSE_SHARED_LIBPNG=ON \
    -DUSE_SHARED_TINYXML=ON \
    -DUSE_SHARED_PIXMAN=ON \
    -DUSE_SHARED_FREETYPE=ON \
    -DUSE_SHARED_HARFBUZZ=ON \
    -DENABLE_UPDATER=OFF \
    -DWITH_WEBP_SUPPORT=ON \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLAF_BACKEND=skia \
    -DSKIA_DIR="${srcdir}/skia" \
    -DSKIA_LIBRARY_DIR="${srcdir}/skia/out/Release-x64" \
    -DSKIA_LIBRARY="${srcdir}/skia/out/Release-x64/libskia.a" \
    -DLAF_WITH_TESTS=OFF \
    -DLAF_WITH_EXAMPLES=OFF \
    -G Ninja \
    ..

  # Workaround for the multiple definition error (https://github.com/aseprite/aseprite/issues/2387#issuecomment-697334354)
  var=$(ninja aseprite | tee /dev/tty)
  var=$(echo $var | grep -o -P '(?<=&&).*(?=&&)')
  var=${var/"lib/libwebp.a"}
  $var

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
