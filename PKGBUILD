#Maintainer: memchr
# FIXME: arabic tashkeel library path
pkgname=piper-tts-git
pkgver=2023.11.14.2.r30.c0670df
pkgrel=1
pkgdesc="A fast, local neural text to speech system"
arch=(x86_64 aarch64)
url="https://github.com/rhasspy/piper"
license=('MIT')
conflicts=('piper-tts')
provides=("piper-tts")
depends=(
  onnx
  openmpi
  onnxruntime
  espeak-ng
  gcc-libs
  gcc
)
makedepends=(
  git
  cmake
  ninja
)
source=(
  "piper::git+$url.git"
  "piper-phonemize::git+https://github.com/rhasspy/piper-phonemize.git"
  '0001-Use-system-libraries.patch'
  '0002-Use-bundled-piper-phonemize-library.patch'
  '0003-handle-arg-parsing-error-gracefully.patch'
  'phonmize-0001-support-building-as-static-library.patch'
  'phonmize-0002-Link-against-system-onnxruntime.patch'
  'phonmize-0003-Link-against-upstream-espeak-ng.patch'
  'phonmize-0004-remove-rpath.patch'
)
sha256sums=('SKIP'
  'SKIP'
  'c73cca6dc8f6bdb4a2b4297c720c3d5d7800ce53363f4b65f607fdd2fba13d19'
  '2b25f0065ad3dd59ac934951449c02467acf0845ae473c9ab3ed5adcecc01391'
  '44b9a86bc24d78c70ef97c8ca0f8add5c3a086c8a001461dcf9c17890fc8e65b'
  '2c426fb80f1c619da6f9388fc168b90c2be212ab682f5f96d7f0303e5b93c6a6'
  '191b9fc28732654ae9bdfb08cb0618f6d276eb94bc660159ed770728dd8970a7'
  'd6c7e5a48e6582aa83775d63f9bf8a85bb870fec119611a096eec2697470f533'
  'ef62efcd399e4649edd29cb6546e01165410032d348a99139f8b38bcf29649f6')
pkgver() {
  git -C "$srcdir/piper" describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/piper"
  patch -Np1 -i ../'0001-Use-system-libraries.patch'
  patch -Np1 -i ../'0002-Use-bundled-piper-phonemize-library.patch'
  patch -Np1 -i ../'0003-handle-arg-parsing-error-gracefully.patch'
  cd "$srcdir/piper-phonemize"
  patch -Np1 -i ../'phonmize-0001-support-building-as-static-library.patch'
  patch -Np1 -i ../'phonmize-0002-Link-against-system-onnxruntime.patch'
  patch -Np1 -i ../'phonmize-0003-Link-against-upstream-espeak-ng.patch'
  patch -Np1 -i ../'phonmize-0004-remove-rpath.patch'
}

build() {

  cd "$srcdir/piper-phonemize"
  cmake -Bbuild -GNinja \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=OFF \
    -Wno-dev
  cmake --build build --config Release
  DESTDIR="install" cmake --install build

  cd "$srcdir/piper"
  cmake -Bbuild -GNinja \
    -DPIPER_PHONEMIZE_DIR="$srcdir/piper-phonemize/install/usr" \
    -Wno-dev
  cmake --build build --config Release
}

package() {
  cd "$srcdir/piper-phonemize"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/piper-phonemize.LICENSE.md"

  cd "$srcdir/piper"
  install -D --strip -m755 build/piper "${pkgdir}/usr/bin/piper-tts"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/piper.LICENSE.md"
}
