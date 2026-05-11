# Maintainer: Strykar <strykar@hotmail.com>

pkgname=go-livepeer-git
_pkgname=go-livepeer
pkgver=0.8.10.r4.g9e68815
pkgrel=1
pkgdesc='Decentralized live video broadcasting protocol (git, patched for CUDA 13 scale_cuda)'
arch=('x86_64')
url='https://github.com/livepeer/go-livepeer'
license=('MIT')
install=${_pkgname}.install
backup=('etc/go-livepeer/livepeer.conf')
conflicts=('go-livepeer' 'go-livepeer-bin')
provides=("go-livepeer=${pkgver}")
depends=('bzip2' 'libdrm' 'libva' 'libvdpau' 'sqlite')
makedepends=('git' 'go' 'cuda' 'nasm' 'pkgconf' 'gcc' 'make')
optdepends=('nvidia-utils: hardware encoding/decoding via NVENC/NVDEC')
options=('!lto')
source=("${_pkgname}::git+https://github.com/livepeer/${_pkgname}.git"
        'lpms::git+https://github.com/livepeer/lpms.git'
        'lpms-cuda13-scale-cuda.patch'
        'livepeer.conf'
        'livepeer.service'
        'livepeer.tmpfiles')
sha256sums=('SKIP'
            'SKIP'
            '47e1be99684223da79ba7b51d3083b1b354253b34b65a3a3248b91df90517495'
            '82a7bc93294938bd4621f7515c29ffe01c5e9fbc795dff59b82a5ad0ded42cca'
            '5324a0a347e9b619e5f005c3c20b00d033c15c1ef87da7cbac1d0c7b316bf461'
            '25dc028d3c9255be8b5b03bcff65666de2f81d0fceee858e20fcd8d928f5774c')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Wiki-idiomatic: tag.r<commits-since-tag>.g<sha>. Strip 'v' prefix from
  # tags like v0.8.10; fall back to r<count>.<sha> if there are no tags.
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  # Pin lpms to the commit recorded in go.mod so the patch context lines up.
  local lpms_pseudo lpms_commit
  lpms_pseudo="$(awk '$1=="github.com/livepeer/lpms"{print $2}' "${srcdir}/${_pkgname}/go.mod")"
  # pseudo-version format: vX.Y.Z-yyyymmddhhmmss-abcdef123456
  lpms_commit="${lpms_pseudo##*-}"
  echo "==> Checking out lpms at ${lpms_commit}"
  cd "${srcdir}/lpms"
  git checkout --quiet "${lpms_commit}"

  echo '==> Applying CUDA 13 scale_cuda patch to lpms'
  patch -p1 -i "${srcdir}/lpms-cuda13-scale-cuda.patch"

  # Point go-livepeer at our patched lpms tree.
  cd "${srcdir}/${_pkgname}"
  if ! grep -q '^replace github.com/livepeer/lpms' go.mod; then
    printf '\nreplace github.com/livepeer/lpms => %s/lpms\n' "${srcdir}" >> go.mod
  fi
}

build() {
  export CUDA_PATH=/opt/cuda
  export PATH=/opt/cuda/bin:${PATH}
  export FFROOT="${srcdir}/ffmpeg-build"

  echo '==> Building Livepeer-patched FFmpeg statically'
  cd "${srcdir}/lpms"
  # install_ffmpeg.sh would otherwise build its own nasm 2.14.02, which
  # fails to compile under modern GCC. Stub the marker dir and pre-seed a
  # symlink to system nasm so the rest of the script falls through to it.
  mkdir -p "${FFROOT}/nasm-2.14.02" "${FFROOT}/compiled/bin"
  ln -sf /usr/bin/nasm "${FFROOT}/compiled/bin/nasm"
  NPROC="$(nproc)" bash ./install_ffmpeg.sh "${FFROOT}"

  echo '==> Building go-livepeer'
  cd "${srcdir}/${_pkgname}"
  export PKG_CONFIG_PATH="${FFROOT}/compiled/lib/pkgconfig"
  export CGO_CFLAGS="-I${FFROOT}/compiled/include -I${CUDA_PATH}/include"
  export CGO_LDFLAGS="-L${FFROOT}/compiled/lib -L${CUDA_PATH}/lib64"
  export BUILD_TAGS='mainnet experimental'
  export GO_BUILD_DIR="${srcdir}/"
  # -trimpath strips $srcdir from binaries; -buildvcs=false skips VCS embedding (version is set via -ldflags).
  export GOFLAGS="$(go env GOFLAGS) -trimpath -buildvcs=false"
  make livepeer livepeer_cli livepeer_bench
}

package() {
  install -Dm755 "${srcdir}/livepeer"       "${pkgdir}/usr/bin/livepeer"
  install -Dm755 "${srcdir}/livepeer_cli"   "${pkgdir}/usr/bin/livepeer_cli"
  install -Dm755 "${srcdir}/livepeer_bench" "${pkgdir}/usr/bin/livepeer_bench"

  install -Dm644 "${srcdir}/livepeer.conf"     "${pkgdir}/etc/${_pkgname}/livepeer.conf"
  install -Dm644 "${srcdir}/livepeer.service"  "${pkgdir}/usr/lib/systemd/system/livepeer.service"
  install -Dm644 "${srcdir}/livepeer.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/livepeer.conf"

  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
