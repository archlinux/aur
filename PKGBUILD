# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-torchaudio
_pkgname=audio
pkgver=2.0.1
_sox_ver=14.4.2
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('x86_64' 'i686')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=('python' 'python-pytorch' 'bzip2' 'xz' 'opencore-amr' 'lame' 'libogg' 'libFLAC.so' 'libvorbis' 'opus' 'opusfile' 'zlib')
optdepends=('python-kaldi-io')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja' 'boost')
conflicts=('python-torchaudio-git')
source=("git+$url#tag=v${pkgver}"
        "git+https://github.com/kaldi-asr/kaldi.git"
        "git+https://github.com/kpu/kenlm.git"
        "flashlight-text::git+https://github.com/flashlight/text.git"
        # Files downloaded by ExternalProject_Add
        "https://downloads.sourceforge.net/project/sox/sox/$_sox_ver/sox-$_sox_ver.tar.bz2"
        "use-system-libs.diff")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '81a6956d4330e75b5827316e44ae381e6f1e8928003c6aa45896da9041ea149c'
            '1dcf13e8893d780ed730121fd607e9ccedfa47e380fd7e594f21b77aa7cd1720')

prepare() {
  cd "$srcdir/${_pkgname}"

  mkdir -p third_party/archives
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
}

build() {
  cd "$srcdir/${_pkgname}"

  # Allow this to build with CUDA, which is not compatible with GCC 12 yet
  export CUDACXX=/opt/cuda/bin/nvcc
  export CUDAHOSTCXX=$CXX
  # Follow architectures used by pytorch
  # https://github.com/archlinux/svntogit-community/blob/packages/python-pytorch/trunk/PKGBUILD
  export TORCH_CUDA_ARCH_LIST="5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0+PTX"

  CUDA_HOME=/opt/cuda/ BUILD_SOX=1 python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}"
  BUILD_SOX=1 python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

