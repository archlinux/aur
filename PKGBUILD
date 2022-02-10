# Maintainer: Ng Oon-Ee <n g o o n e e dot t a l k @ gmail dot com>
# Based on obs-backgroundremoval PKGBUILD by PedroHLC <root@pedrohlc.com>
pkgname=obs-backgroundremoval-git
pkgver=v0.3.0.beta.r9.0ba4a82
pkgrel=1
pkgdesc="Background removal plugin for OBS studio (precompiled onxxruntime, git version, CUDA)"
arch=(x86_64)
url='https://github.com/royshil/obs-backgroundremoval'
license=('MIT custom')
depends=('obs-studio' 'opencv')
makedepends=('git' 'cmake')
conflicts=("obs-backgroundremoval")
_onnx_version=1.9.0
#_onxx_runtime=onxxruntime-linux-x64-${_onnx_version}
_onnx_runtime=onnxruntime-linux-x64-gpu-${_onnx_version}
# Comment the line above (and uncomment the line above it) if you want to use CPU instead of GPU
source=('git+https://github.com/royshil/obs-backgroundremoval.git'
        'remove_cuda_provider_include.patch'
        "https://github.com/microsoft/onnxruntime/releases/download/v${_onnx_version}/${_onnx_runtime}.tgz")
sha256sums=('SKIP'
            '9ed2b9bb22dd3f29644f4386cca5dae6ff7db0b28773b45e659e41a54d2491f5'
            '2fb0e4ed01aec68860cdea372a51db3d0648c21e90432458884db674ea576dd8')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    # Apply patch for onxx_runtime 1.9.0
	patch --directory="$srcdir/${pkgname%-git}" --forward --strip=1 --input "$srcdir/remove_cuda_provider_include.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cmake -B build -DVERSION="${pkgver}" -DobsIncludePath=/usr/include/obs/ \
           -DWITH_CUDA=ON \
           -DCMAKE_INSTALL_PREFIX:PATH=/usr \
           -DOnnxruntime_INCLUDE_DIRS="$srcdir/$_onnx_runtime/include/" -DOnnxruntime_LIBRARIES="$srcdir/$_onnx_runtime/lib/libonnxruntime.so" \
           -DOnnxruntime_INCLUDE_DIR="$srcdir/$_onnx_runtime/include/" \
           -DCMAKE_INSTALL_RPATH="/usr/lib/obs-backgroundremoval"
    cd build
    make
}

package() {
	make -C "$srcdir/${pkgname%-git}/build" DESTDIR="$pkgdir/" install
    install -Dt "$pkgdir/usr/share/licenses/obs-backgroundremoval" "$srcdir/${pkgname%-git}/LICENSE"
    # install onnxruntime
    cd "$srcdir/$_onnx_runtime"
    install -Dt "$pkgdir/usr/share/licenses/obs-backgroundremoval/onnxruntime" \
          LICENSE  Privacy.md  README.md  ThirdPartyNotices.txt
    install -Dt "$pkgdir/usr/lib/obs-backgroundremoval" lib/*
}
