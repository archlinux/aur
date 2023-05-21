# Maintainer: francisco1892 <admin@gnlug.org>
# Contributer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio-rocm
_pkgname=audio
pkgver=2.0.2
_sox_ver=14.4.2
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch (ROCm Support)"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=('python' 'python-pytorch-rocm' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libFLAC.so' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('python-kaldi-io')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'gcc11' 'boost')
conflicts=('python-torchaudio-git' 'python-torchaudio')
source=("git+$url#tag=v${pkgver}"
        "git+https://github.com/kaldi-asr/kaldi.git"
        "git+https://github.com/kpu/kenlm.git"
        "flashlight-text::git+https://github.com/flashlight/text.git"
        # Files downloaded by ExternalProject_Add
        "https://downloads.sourceforge.net/project/sox/sox/$_sox_ver/sox-$_sox_ver.tar.bz2"
        "use-system-libs.diff"
        "LoadHIP.cmake")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd "$srcdir/${_pkgname}"

  mkdir -p third_party/archives
  rm -f third_party/archives/sox-$_sox_ver.tar.bz2
  ln -s "$srcdir"/sox-$_sox_ver.tar.bz2 third_party/archives/

  patch -Np1 -i ../use-system-libs.diff

  for dep in bzip2 lzma zlib; do
    echo "add_library($dep INTERFACE)" > third_party/$dep/CMakeLists.txt
  done

  git submodule init
  git config submodule.third_party/kaldi/submodule.url "$srcdir"/kaldi
  git config submodule.third_party/kenlm/kenlm.url "$srcdir"/kenlm
  git config submodule.third_party/flashlight-text/submodule.url "$srcdir"/flashlight-text
  git -c protocol.file.allow=always submodule update third_party/kaldi/submodule
  git -c protocol.file.allow=always submodule update third_party/kenlm/kenlm
  git -c protocol.file.allow=always submodule update third_party/flashlight-text/submodule
  cp -v ../../LoadHIP.cmake cmake/LoadHIP.cmake
}

build() {
  cd "$srcdir/${_pkgname}"

  # Allow this to build with ROCm, which is not compatible with GCC 12 yet
  export CC=/usr/bin/gcc-11
  export CXX=/usr/bin/g++-11
  BUILD_SOX=1 USE_ROCM=1 ROCclr_DIR=/opt/rocm/ python3 setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  BUILD_SOX=1 USE_ROCM=1 ROCclr_DIR=/opt/rocm/ python3 setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

