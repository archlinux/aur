# Maintainer: Andrea Richiardi <a.richiardi.work@gmail.com>
#
# nvbandwidth replaces the cuda-samples p2pBandwidthLatencyTest sample, which
# NVIDIA removed in the CUDA 13.4 samples update.
#
# Optional build environment variables, all read by CMake itself (see README.md):
#   CUDACXX         CUDA compiler              (default /opt/cuda/bin/nvcc)
#   CUDAHOSTCXX     CUDA host C++ compiler     (unset: nvcc default)
#   CUDAARCHS       GPU architectures          (unset: upstream detects)
#   CUDAFLAGS       extra nvcc flags           (unset)
#   LDFLAGS         extra linker flags         (unset: use -L when the driver
#                                               userspace is outside /usr/lib)

pkgname=nvbandwidth
pkgver=0.10.0
pkgrel=1
pkgdesc='Bandwidth measurements on NVIDIA GPUs, including device-to-device P2P'
arch=('x86_64')
url='https://github.com/NVIDIA/nvbandwidth'
license=('Apache-2.0')
depends=('cuda')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('37fc32ef8b2b6c3f08591b7564c497cb501d8899badf72b4c73753c51230cb70')

build() {
	cd "$srcdir"

	# nvcc may not be in PATH on Arch; the cuda package installs to /opt/cuda.
	export CUDACXX="${CUDACXX:-/opt/cuda/bin/nvcc}"

	# Upstream reads CMAKE_CUDA_ARCHITECTURES before project() and then unsets
	# the value that CMake initialises from CUDAARCHS, so forward it instead.
	local _cmake_args=()
	[[ -n "${CUDAARCHS:-}" ]] && _cmake_args+=(-DCMAKE_CUDA_ARCHITECTURES="$CUDAARCHS")

	cmake -Wno-author -S "$pkgname-$pkgver" -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		"${_cmake_args[@]}"
	cmake --build build --parallel "$(nproc)"
}

package() {
	cd "$srcdir"

	install -Dm755 build/nvbandwidth "$pkgdir/usr/bin/nvbandwidth"
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname-$pkgver/Licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/Licenses.txt"
	install -Dm644 "$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
