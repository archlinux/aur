# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Steven Allen <steven@stebalien.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: Kainoa Kanter <kainoa@t1c.dev>
# Contributor: Vitalii Drevenchuk <cradlemann@gmail.com>

pkgbase=ollama-amd-igpu
pkgname=(ollama-amd-igpu ollama-amd-igpu-rocm ollama-amd-igpu-cuda ollama-amd-igpu-docs)
pkgver=0.9.5
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
b2sums=('SKIP'
        'a1cbf7a65d816ba8014623a80c0b2f96d6f95218791acc9ecc4c495707b1e99d6af292bce3534febb36b88c4a4bc766020deac065e49654fc253d6addae9170b'
        '031e0809a7f564de87017401c83956d43ac29bd0e988b250585af728b952a27d139b3cad0ab1e43750e2cd3b617287d3b81efc4a70ddd61709127f68bd15eabd'
        '68622ac2e20c1d4f9741c57d2567695ec7b5204ab43356d164483cd3bc9da79fad72489bb33c8a17c2e5cb3b142353ed5f466ce857b0f46965426d16fb388632'
        'e8f2b19e2474f30a4f984b45787950012668bf0acb5ad1ebb25cd9776925ab4a6aa927f8131ed53e35b1c71b32c504c700fe5b5145ecd25c7a8284373bb951ed')

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
