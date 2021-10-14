pkgbase='python-gfpgan'
pkgname=('python-gfpgan' 'gfpgan-model')
pkgver=0.2.1
pkgrel=2
pkgdesc="GFPGAN aims at developing Practical Algorithms for Real-world Face Restoration. "
arch=('x86_64')
url="https://github.com/TencentARC/GFPGAN"
license=('Apache 2.0')
depends=('python-pytorch' 'python-numpy' 'python-opencv' 'python-torchvision' 'python-scipy'
'python-tqdm' 'python-basicsr' 'python-facexlib' 'python-lmdb' 'python-pyaml' 'tensorboard' 'yapf')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/66/5f/2460cd8e5c9943e02897ab5747235d8bfe21ffa3c96be701092566168fca/gfpgan-0.2.1.tar.gz"
'https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0/GFPGANCleanv1-NoCE-C2.pth')
sha256sums=('58c007adf0c25cb90f4be34a4b02dc1dd8639b0f3adfbfa13a5ad9307c23ae7b'
            '29e25ee90c170f4231163f4c83df6b59c968b73f3ce00cb884015ae005db083c')

package_python-gfpgan() {
    optdepends=('gfpgan-model: pre-trained model and inference script'
    'python-realesrgan: enhance the background (non-face) regions')
    cd gfpgan-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_gfpgan-model() {
    pkgdesc="Pre-trained model and interference script for python-gfpgan."
    depends=('python-gfpgan')
    mkdir -p ${pkgdir}/usr/share/gfpgan-model
    cp *.pth ${pkgdir}/usr/share/gfpgan-model/
    mkdir -p ${pkgdir}/usr/bin
    cp gfpgan-${pkgver}/inference_gfpgan.py ${pkgdir}/usr/bin/gfpgan
    sed -i "1i#!/usr/bin/python" ${pkgdir}/usr/bin/gfpgan
    sed -i "s|experiments/pretrained_models|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/gfpgan
    sed -i "s|https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1|/usr/share/realesrgan-model|" ${pkgdir}/usr/bin/gfpgan
    chmod 755 ${pkgdir}/usr/bin/gfpgan  
}

