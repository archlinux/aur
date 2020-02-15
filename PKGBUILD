# Maintainer: Kibouo <csonka.mihaly@hotmail.com>
pkgname=espnet-cuda-git
pkgver=r6324.5ff213d78
pkgrel=1
pkgdesc='End-to-End Speech Processing Toolkit.'
arch=('x86_64')
url='https://github.com/espnet/espnet'
license=('Apache License 2.0')
depends=('python>=3.6.1' 'python-virtualenv' 'python-pytorch-cuda>=1.0.0' 'sentencepiece-git' 'libsndfile' 'cuda>=8.0' 'cuda<11' 'cudnn>=6' 'kaldi')
optdepends=('nccl>=2.0: for multi-GPU setup')
makedepends=('git')
provides=('espnet')
conflicts=("${pkgname}")
source=(
    "${pkgname}::git+${url}"
    espnet-cuda-git.sh)
md5sums=(
    'SKIP'
    32dad7fc986f0250d22a2e7a2e5d28ce)
pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    KALDI_PATH=/opt/kaldi
    PYTHON_PATH=/usr/bin/python
    
    cd "${pkgname}"

    cd tools
    make KALDI=$KALDI_PATH PYTHON=$PYTHON_PATH

    make check_install
}

package() {
    cd "${pkgname}"

    install -Dm755 "${srcdir}/espnet-cuda-git.sh" "${pkgdir}/etc/profile.d/espnet-cuda-git.sh"

    # install -D -m755 ~/.cargo/bin/ra_lsp_server "${pkgdir}/usr/bin/ra_lsp_server"
}
