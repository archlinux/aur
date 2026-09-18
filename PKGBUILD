# Maintainer: KorigamiK <korigamik@gmail.com>
_pkgname=shrimply
pkgname="${_pkgname}-git"
pkgver=r422.f6fc8ee9
pkgrel=1
pkgdesc="A simple, fast GPU-accelerated video editor"
arch=('x86_64')
url="https://github.com/soirihiroka/shrimply"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'ffmpeg'
  'freetype2'
  'gtk4'
  'gtksourceview5'
  'hicolor-icon-theme'
  'libadwaita'
  'libglvnd'
  'opencv'
  'openssl'
  'pipewire'
  'poppler-glib'
  'python'
  'rubberband'
  'uv'
)
optdepends=(
  'nvidia-utils: hardware acceleration for NVIDIA GPUs and CUDA'
  'cuda: runtime CUDA toolkit and development utilities'
  'optix: NVIDIA OptiX development headers for raytracing denoiser'
  'shader-slang: system Slang shading language compiler'
)
makedepends=(
  'clang'
  'cmake'
  'cuda'
  'gcc15'
  'git'
  'gobject-introspection'
  'make'
  'ninja'
  'pkgconf'
  'rustup'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')

source=(
  "${_pkgname}::git+https://github.com/soirihiroka/shrimply.git#branch=main"
  "shrimply-manim-system-path.patch"
)

sha256sums=(
  'SKIP'
  '3d648690fb909f6252b0392d1d5fcbf698d312f1691a4c255707c90131652a9f'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # Initialize git submodules for external libraries (optix-dev, vtracer, manim)
  git submodule update --init --recursive

  # Apply path patch for installed Manim worker and user cache virtual environment
  patch -Np1 -i "${srcdir}/shrimply-manim-system-path.patch"

  # Ensure the pinned Rust toolchain is available
  if ! rustup run nightly-2026-04-03 rustc --version &>/dev/null; then
    msg2 "Installing required Rust toolchain nightly-2026-04-03..."
    rustup toolchain install nightly-2026-04-03 --profile minimal
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${CARGO_HOME:-${srcdir}/cargo-home}"
  export CUDA_HOME="${CUDA_HOME:-/opt/cuda}"
  export CUDA_TOOLKIT_PATH="${CUDA_TOOLKIT_PATH:-/opt/cuda}"
  export CUDA_HOST_CXX="${CUDA_HOST_CXX:-g++-15}"
  export CUDA_ALLOW_UNSUPPORTED_COMPILER=1
  export CUDA_IMAGE_FORMAT=ptx
  export CUDA_PTX_TARGET=compute_50
  export PATH="${CUDA_HOME}/bin:${PATH}"
  export LIBRARY_PATH="${CUDA_HOME}/lib64/stubs:${LIBRARY_PATH}"
  export LIBCLANG_PATH="${LIBCLANG_PATH:-/usr/lib}"

  # Use system OptiX headers if optix / optix-dev-headers is installed
  if [ -f /usr/include/optix.h ]; then
    export OPTIX_ROOT=/usr
  else
    export OPTIX_ROOT="${srcdir}/${_pkgname}/external/optix-dev"
  fi

  # Use system Slang if shader-slang is installed
  if [ -f /usr/include/shader-slang/slang.h ] && [ -f /usr/lib/libslang.so ]; then
    export SLANG_INCLUDE_DIR=/usr/include/shader-slang
    export SLANG_LIBRARY_DIR=/usr/lib
  elif [ -f /usr/include/slang.h ] && [ -f /usr/lib/libslang.so ]; then
    export SLANG_INCLUDE_DIR=/usr/include
    export SLANG_LIBRARY_DIR=/usr/lib
  fi

  make release \
    CUDA_HOME="${CUDA_HOME}" \
    CUDA_TOOLKIT_PATH="${CUDA_TOOLKIT_PATH}" \
    CUDA_HOST_CXX="${CUDA_HOST_CXX}" \
    CUDA_ALLOW_UNSUPPORTED_COMPILER="${CUDA_ALLOW_UNSUPPORTED_COMPILER}" \
    CUDA_IMAGE_FORMAT="${CUDA_IMAGE_FORMAT}" \
    CUDA_PTX_TARGET="${CUDA_PTX_TARGET}" \
    OPTIX_ROOT="${OPTIX_ROOT}"
}

package() {
  cd "${srcdir}/${_pkgname}"

  export CARGO_HOME="${CARGO_HOME:-${srcdir}/cargo-home}"
  export CUDA_HOME="${CUDA_HOME:-/opt/cuda}"
  export CUDA_TOOLKIT_PATH="${CUDA_TOOLKIT_PATH:-/opt/cuda}"
  export CUDA_HOST_CXX="${CUDA_HOST_CXX:-g++-15}"
  export CUDA_ALLOW_UNSUPPORTED_COMPILER=1
  export CUDA_IMAGE_FORMAT=ptx
  export CUDA_PTX_TARGET=compute_50
  export PATH="${CUDA_HOME}/bin:${PATH}"
  export LIBRARY_PATH="${CUDA_HOME}/lib64/stubs:${LIBRARY_PATH}"
  export LIBCLANG_PATH="${LIBCLANG_PATH:-/usr/lib}"

  if [ -f /usr/include/optix.h ]; then
    export OPTIX_ROOT=/usr
  else
    export OPTIX_ROOT="${srcdir}/${_pkgname}/external/optix-dev"
  fi

  if [ -f /usr/include/shader-slang/slang.h ] && [ -f /usr/lib/libslang.so ]; then
    export SLANG_INCLUDE_DIR=/usr/include/shader-slang
    export SLANG_LIBRARY_DIR=/usr/lib
  elif [ -f /usr/include/slang.h ] && [ -f /usr/lib/libslang.so ]; then
    export SLANG_INCLUDE_DIR=/usr/include
    export SLANG_LIBRARY_DIR=/usr/lib
  fi

  make install \
    PREFIX=/usr \
    DESTDIR="${pkgdir}" \
    CUDA_HOME="${CUDA_HOME}" \
    CUDA_TOOLKIT_PATH="${CUDA_TOOLKIT_PATH}" \
    CUDA_HOST_CXX="${CUDA_HOST_CXX}" \
    CUDA_ALLOW_UNSUPPORTED_COMPILER="${CUDA_ALLOW_UNSUPPORTED_COMPILER}" \
    CUDA_IMAGE_FORMAT="${CUDA_IMAGE_FORMAT}" \
    CUDA_PTX_TARGET="${CUDA_PTX_TARGET}" \
    OPTIX_ROOT="${OPTIX_ROOT}"

  # Install Manim python worker runtime files
  install -dm755 "${pkgdir}/usr/share/shrimply/crates/media/visual/manim/manim-bridge"
  install -dm755 "${pkgdir}/usr/share/shrimply/external"
  cp -r "crates/media/visual/manim/manim-bridge/python" "${pkgdir}/usr/share/shrimply/crates/media/visual/manim/manim-bridge/"
  cp -r "external/manim" "${pkgdir}/usr/share/shrimply/external/"

  # Install project license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
