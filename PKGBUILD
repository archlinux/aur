_basepgkname=llamafile
pkgname="${_basepgkname}-git"
pkgver=0.10.6.r880.334e664
pkgrel=1
pkgdesc="Distribute and run LLMs with a single file."
arch=('x86_64')
url="https://github.com/mozilla-ai/llamafile"
license=('Apache-2.0')
makedepends=('unzip' 'fakeroot')
optdepends=(
	'hip-runtime-amd: Used for static compiling with rocm'
  'hipblas: Used for static compiling with rocm'
  'rocminfo: Used for verifying existance of rocm'
	'cuda: Used for static/dynaimc compiling with rocm Nvidia'
	)
source=(    "${pkgname}::git+https://github.com/mozilla-ai/llamafile"
       )

sha256sums=(
            'SKIP'
           )

provides=(
            'llamafile'
            'llamafile-bench'
            'llamafile-imatrix'
            'llamafile-convert'
            'llamafile-perplexity'
            'llamafile-quantize'
            'llamafile-tokenize'
            'llava-quantize'
            'llamafile-upgrade-engine'
            'zipalign'
            'whisperfile'
            'diffusionfile'
            'transcribefile'
            'agentfile'
        )
conflicts=('llamafile' 'llamafile-bin' 'android-sdk-build-tools' 'zipalign')
options=(!strip)

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s.%s" "$(git describe --tags | cut -d'-' -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  export CFLAGS=""
  export CXXFLAGS=""
  export LDFLAGS=""
  export CPPFLAGS=""
  make setup
  # since 0.10.6 `setup` only initializes deps; build all binaries for the same
  # MODE that package() installs (x86_64). Keep -j low: large C++ TUs OOM at -j$(nproc).
  make MODE=x86_64 -j2
}

package() {
  cd "${srcdir}/${pkgname}"
  export CFLAGS=""
  export CXXFLAGS=""
  export LDFLAGS=""
  export CPPFLAGS=""
  make install MODE=x86_64 PREFIX="${pkgdir}/usr"
}
