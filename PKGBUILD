# Manitainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

pkgbase=ollama-git
pkgname=(ollama-git ollama-rocm-git ollama-cuda-git ollama-vulkan-git ollama-docs-git)
pkgver=0.21.3rc0.r0.gea01af6f76fc
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm'
arch=(aarch64 x86_64)
url='https://github.com/ollama/ollama'
license=(MIT)
options=(!lto)
depends=(gcc-libs glibc)
makedepends=(cmake
             ninja
             git
             go
             rocm-toolchain
             hipblas
             cuda
             clblast
             vulkan-headers
             vulkan-icd-loader
             shaderc)
source=(git+$url#branch=main
        ollama-ld.conf
        ollama.service
        sysusers.conf
        tmpfiles.d)
b2sums=('SKIP'
        '121a7854b5a7ffb60226aaf22eed1f56311ab7d0a5630579525211d5c096040edbcfd2608169a4b6d83e8b4e4855dbb22f8ebf3d52de78a34ea3d4631b7eff36'
        'b2567ca9222da664aa52d290bfdea34bec7f03ea0553888a849aad582fc340c17176ede35abd366ca159615af32617fcc23279f3ce1566422ba22f0e46783cf8'
        '3aabf135c4f18e1ad745ae8800db782b25b15305dfeaaa031b4501408ab7e7d01f66e8ebb5be59fc813cfbff6788d08d2e48dcf24ecc480a40ec9db8dbce9fec'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

pkgver() {
  cd ollama
  git describe --long --tags --abbrev=12 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.rc/rc/'
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw '-ldflags=-linkmode=external -compressdwarf=false -X=github.com/ollama/ollama/version.Version=$pkgver -X=github.com/ollama/ollama/server.mode=release'"

  cd ollama

  # Remove the runtime dependencies from installation so CMake doesn't install
  # lots of system dependencies into the target path.
  sed -i 's/PRE_INCLUDE_REGEXES.*/PRE_INCLUDE_REGEXES = ""/' CMakeLists.txt

  local cmake_options=(
    -B build
    -G Ninja
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D AMDGPU_TARGETS="$(rocm-supported-gfx)"
    -D GPU_TARGETS="$(rocm-supported-gfx)"
    # Sync GPU targets from CMakePresets.json
    # For CUDA 12
    # -D CMAKE_CUDA_ARCHITECTURES="50;52;53;60;61;62;70;72;75;80;86;87;89;90;90a"
    # for CUDA 13
    -D CMAKE_CUDA_ARCHITECTURES="75;80;86;87;88;89;90;100;103;110;120;121;121-virtual"
  )

  cmake "${cmake_options[@]}"
  cmake --build build
  go build .
}

package_ollama-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=$pkgver")
  DESTDIR="$pkgdir" cmake --install ollama/build --component CPU

  install -Dm755 ${pkgbase%-git}/ollama "$pkgdir/usr/bin/ollama"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ollama/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -s /var/lib/ollama "$pkgdir/usr/share/ollama"
}

package_ollama-rocm-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=$pkgver")
  pkgdesc='Create, run and share large language models (LLMs) with ROCm'
  depends+=(ollama hipblas)

  DESTDIR="$pkgdir" cmake --install ollama/build --component HIP
  rm -rf "$pkgdir"/usr/lib/ollama/rocm/rocblas/library
}

package_ollama-cuda-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=$pkgver")
  pkgdesc='Create, run and share large language models (LLMs) with CUDA'
  depends+=(ollama cuda)

  DESTDIR="$pkgdir" cmake --install ollama/build --component CUDA
}

package_ollama-vulkan-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=$pkgver")
  pkgdesc='Create, run and share large language models (LLMs) with Vulkan'
  depends=(ollama vulkan-icd-loader)

  DESTDIR="$pkgdir" cmake --install ollama/build --component Vulkan
}

package_ollama-docs-git() {
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=$pkgver")
  pkgdesc='Documentation for Ollama'

  install -d "$pkgdir/usr/share/doc"
  cp -r ollama/docs "$pkgdir/usr/share/doc/ollama"
  install -Dm644 ollama/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
