pkgname=obs-backgroundremoval

pkgver=0.4.0
pkgrel=1
_onnx_version=1.7.0
_onnx_runtime=onnxruntime-linux-x64-${_onnx_version}
sha256sums=('e88bbc902154b5efd46d8fc1dee52fcf079c8ff2ae6593d9f716017fdd1ef601'
            '0345f45f222208344406d79a6db3280ed2ccc884dc1e064ce6e6951ed4c70606')
_source="${pkgname}-${pkgver}"

arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
pkgdesc='Background removal plugin for OBS studio (precompiled onnxruntime)'
license=(MIT custom)
depends=(obs-studio opencv)
makedepends=(cmake)
source=("${_source}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/microsoft/onnxruntime/releases/download/v${_onnx_version}/${_onnx_runtime}.tgz")

prepare() {
  # build from archive, not git. Version set during build()
  sed -i "s/^version_from_git/#&/" "${_source}/CMakeLists.txt"
}

build() {
  cd "$_source"
  # set rpath to avoid installing onnxruntime globally
  cmake -B build -DVERSION="${pkgver}" -DobsIncludePath=/usr/include/obs/ \
           -DCMAKE_INSTALL_PREFIX:PATH=/usr \
           -DOnnxruntime_INCLUDE_DIRS="$srcdir/$_onnx_runtime/include/" -DOnnxruntime_LIBRARIES="$srcdir/$_onnx_runtime/lib/libonnxruntime.so" \
           -DOnnxruntime_INCLUDE_DIR="$srcdir/$_onnx_runtime/include/" \
           -DCMAKE_INSTALL_RPATH="/usr/lib/obs-backgroundremoval"
  cd build
  make
}

package() {
  make -C "$_source/build" DESTDIR="$pkgdir" install
  install -Dt "$pkgdir/usr/share/licenses/obs-backgroundremoval" "$_source/LICENSE"

  # install onnxruntime
  cd "$_onnx_runtime"
  install -Dt "$pkgdir/usr/share/licenses/obs-backgroundremoval/onnxruntime" \
          LICENSE  Privacy.md  README.md  ThirdPartyNotices.txt
  install -Dt "$pkgdir/usr/lib/obs-backgroundremoval" lib/*
}
