# Maintainer: Ranadeep Biswas <mail@rnbguy.at>
pkgname=bend-bin
pkgver=2.0.34
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
sha256sums_x86_64=('78106a97af242429dcc057258eb8d10f69cddebcd5e263022185a52d003e09bf')
sha256sums_aarch64=('416a17d282a9fd05ab9637a238b51d5ca508114d9773c37d1c11cad595440ed1')
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
