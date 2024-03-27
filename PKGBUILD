# Maintainer: Kaito Udagawa <umireon at gmail dot com>
# Contributor: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Contributor: PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval

pkgver=1.1.13
pkgrel=1
pkgdesc='Background removal plugin for OBS studio'

_source="${pkgname}-${pkgver}"
_onnxruntime_version=1.17.1
_onnxruntime_filename="onnxruntime-linux-x64-gpu-${_onnxruntime_version}.tgz"
_onnxruntime_url='https://github.com/microsoft/onnxruntime'

arch=(x86_64)
url='https://github.com/occ-ai/obs-backgroundremoval'
license=('GPL2')
depends=('obs-studio' 'opencv' 'curl')
makedepends=('cmake' 'ninja')
source=(
	"${_source}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz"
	"${_onnxruntime_filename}::${_onnxruntime_url}/releases/download/v${_onnxruntime_version}/${_onnxruntime_filename}"
)
noextract=("${_onnxruntime_filename}")
sha256sums=(
	'732d280dbc094ecb62783c4d51ebf956ea365a0b4f76c13621628bc7fcb9415b'
	'613c53745ea4960ed368f6b3ab673558bb8561c84a8fa781b4ea7fb4a4340be4'
)

build() {
  cmake -B build -S "${_source}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON \
    -DENABLE_FRONTEND_API=ON \
    -DENABLE_QT=OFF \
    -DUSE_SYSTEM_OPENCV=ON \
    -DCUSTOM_ONNXRUNTIME_URL="$(pwd)/${_onnxruntime_filename}" \
    -DCUSTOM_ONNXRUNTIME_HASH=SHA256=613c53745ea4960ed368f6b3ab673558bb8561c84a8fa781b4ea7fb4a4340be4
  cmake --build build
}

package() {
  cmake --install build --prefix "${pkgdir}/usr"
}
