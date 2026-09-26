# Maintainer: Ranadeep Biswas <mail@rnbguy.at>
pkgname=bend-bin
pkgver=2.0.29
pkgrel=1
pkgdesc='Bend programming language'
arch=('x86_64' 'aarch64')
url='https://github.com/bendlang/bend'
license=('Apache-2.0')
depends=('glibc')
optdepends=('clang: compile Bend programs to native binaries (clang 14+, 19+ for GPU programs)'
            'cuda: build GPU programs (NVRTC headers/libs at /opt/cuda) and run them on NVIDIA GPUs (needs the NVIDIA driver)'
            'libx11: build programs that open a window'
            'alsa-lib: build programs that play audio')
provides=('bend')
conflicts=('bend')
source_x86_64=("bend-${pkgver}-linux-x64.tar.gz::https://github.com/bendlang/bend/releases/download/v${pkgver}/bend-${pkgver}-linux-x64.tar.gz")
source_aarch64=("bend-${pkgver}-linux-arm64.tar.gz::https://github.com/bendlang/bend/releases/download/v${pkgver}/bend-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('e0ff4fa44581b42f6024d2a1128e7e518219a502cb726030c714a5c23d61726e')
sha256sums_aarch64=('74b79cefca579b694da626c4de326b77063a3f913eb46abb7edfdb8b8de257e4')
options=('!strip')

package() {
  # Tarball root is bend/{bin/bend,bend2,guide}; the binary locates its
  # stdlib (bend2) and docs (guide) relative to its own path, so keep the
  # tree intact under /usr/lib/bend and exec it via a PATH wrapper.
  install -dm755 "${pkgdir}/usr/lib/bend"
  cp -a "${srcdir}/bend/bin" "${srcdir}/bend/bend2" "${srcdir}/bend/guide" \
    "${pkgdir}/usr/lib/bend/"

  # The binary defaults to the NVIDIA-default /usr/local/cuda; Arch's cuda
  # package lives at /opt/cuda. Upstream honors CUDA_HOME, so export the
  # Arch path instead of patching the binary.
  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexport CUDA_HOME="${CUDA_HOME:-/opt/cuda}"\nexec /usr/lib/bend/bin/bend "$@"\n' \
    > "${pkgdir}/usr/bin/bend"
  chmod 755 "${pkgdir}/usr/bin/bend"
}
