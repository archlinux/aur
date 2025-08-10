# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# Contributor: Vitalii Drevenchuk <cradlemann@gmail.com>

pkgbase=ollama-amd-igpu
pkgname=(ollama-amd-igpu ollama-amd-igpu-rocm ollama-amd-igpu-cuda ollama-amd-igpu-docs)
pkgver=0.11.4
pkgrel=1
pkgdesc='Create, run and share large language models (LLMs) with ROCm, patched for AMD iGPUs'
arch=(x86_64)
url='https://github.com/Crandel/ollama-amd-igpu'
license=(MIT)
options=('!lto')
conflicts=('ollama')
makedepends=(cmake ninja git go hipblas cuda clblast)
source=(ollama::git+$url#branch=amd-igpu
        ollama-ld.conf
        ollama.service
        sysusers.conf
        tmpfiles.d)
sha256sums=('SKIP'
            '5e94c1a5a71e44a0dcde082f0c0a26667c6601db53c8ed340c7533ea8aa9c86e'
            '9177dd27de7ec74cf4f74790e0d1db373f0da3fd6efe3e856b089e0124a4c1ed'
            '14e2e267be85b6943f66dfe60e73f5e0a611eaf40ee69a4cc0d497d071392cf4'
            '137e1d50a5f3058c30a73b7bb3c323888d225e6a7ae47564be869827db0659a3')


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

  # Sync GPU targets from CMakePresets.json
  cmake -B build -G Ninja \
    -DCMAKE_CUDA_ARCHITECTURES="50;52;53;60;61;62;70;72;75;80;86;87;89;90;90a" \
    -DAMDGPU_TARGETS="gfx900;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102;gfx1200;gfx1201;gfx906:xnack-;gfx908:xnack-;gfx90a:xnack+;gfx90a:xnack-" \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
  go build .
}

check() {
  ollama/ollama --version > /dev/null
  cd ollama
  go test .
}

package_ollama-amd-igpu() {
  DESTDIR="$pkgdir" cmake --install ollama/build --component CPU

  install -Dm755 ollama/ollama "$pkgdir/usr/bin/ollama"
  install -dm755 "$pkgdir/var/lib/ollama"
  install -Dm644 ollama.service "$pkgdir/usr/lib/systemd/system/ollama.service"
  install -Dm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/ollama.conf"
  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/ollama.conf"
  install -Dm644 ollama/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  ln -s /var/lib/ollama "$pkgdir/usr/share/ollama"
}

package_ollama-amd-igpu-rocm() {
  pkgdesc='Create, run and share large language models (LLMs) with ROCm'
  depends+=(ollama-amd-igpu hipblas)

  DESTDIR="$pkgdir" cmake --install ollama/build --component HIP
  rm -rf "$pkgdir"/usr/lib/ollama/rocm/rocblas/library
}

package_ollama-amd-igpu-cuda() {
  pkgdesc='Create, run and share large language models (LLMs) with CUDA'
  depends+=(ollama-amd-igpu cuda)

  DESTDIR="$pkgdir" cmake --install ollama/build --component CUDA
}

package_ollama-amd-igpu-docs() {
  pkgdesc='Documentation for Ollama'

  install -d "$pkgdir/usr/share/doc"
  cp -r ollama/docs "$pkgdir/usr/share/doc/ollama"
  install -Dm644 ollama/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
