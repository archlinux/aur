# Maintainer: Lumaku <lumaku@mailbox.org>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
pkgname=espnet-cuda-git
pkgver=r.8799caf
pkgrel=1
pkgdesc='End-to-End Speech Processing Toolkit (venv version)'
arch=('x86_64')
url='https://github.com/espnet/espnet'
license=('Apache License 2.0')
depends=('python>=3.6.1' 'python-virtualenv' 'python-pytorch-cuda>=1.0.0' 'sentencepiece-git' 'libsndfile' 'cuda>=8.0' 'cuda<11' 'cudnn>=6' 'kaldi')
optdepends=('nccl>=2.0: for multi-GPU setup')
makedepends=('git')
provides=('espnet')
conflicts=("${pkgname}")
source=(
    "espnet::git+${url}"
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
    
    source ${srcdir}/espnet-cuda-git.sh
    cd "espnet/tools"
    make clean
    # Exclude not necessary parts from the package (build breaks with them)
    # excluded: warp-transducer.done chainer_ctc.done
    make KALDI=$KALDI_PATH kaldi.done venv warp-ctc.done cupy.done
}

check() {
    # check fails if not all dependencies were executed in make
    cd "${pkgname}/tools"
    . venv/bin/activate; python check_install.py || true
}

package() {
    # copy bash env variables
    install -Dm755 "${srcdir}/espnet-cuda-git.sh" "${pkgdir}/etc/profile.d/espnet-cuda-git.sh"
    # copy over espnet git tree
    mkdir -p "${pkgdir}/opt/espnet"
    cp -r "${srcdir}/espnet" "${pkgdir}/opt/"
    chmod -R 755 "${pkgdir}/opt/espnet"
    # do we need the git tree?
    rm -r "${pkgdir}/opt/espnet/.git"
}
