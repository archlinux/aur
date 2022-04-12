pkgbase='python-gfpgan'
pkgname=('python-gfpgan' 'gfpgan-model')
pkgver=1.3.2
pkgrel=1
pkgdesc="GFPGAN aims at developing Practical Algorithms for Real-world Face Restoration. "
arch=('x86_64')
url="https://github.com/TencentARC/GFPGAN"
license=('Apache 2.0')
depends=('python-pytorch' 'python-numpy' 'python-opencv' 'python-torchvision' 'python-scipy'
'python-tqdm' 'python-basicsr' 'python-facexlib' 'python-lmdb' 'python-pyaml' 'tensorboard' 'yapf')
makedepends=('python-setuptools')

source=("https://github.com/TencentARC/GFPGAN/archive/refs/tags/v$pkgver.tar.gz"
'https://github.com/TencentARC/GFPGAN/releases/download/v0.2.0/GFPGANCleanv1-NoCE-C2.pth'
'https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.3.pth')
sha256sums=('9c8b380fa4391c11d9393cf5314f7bf843cbf694ee4ee499e5105e9293c0f59d'
            '29e25ee90c170f4231163f4c83df6b59c968b73f3ce00cb884015ae005db083c'
            'c953a88f2727c85c3d9ae72e2bd4846bbaf59fe6972ad94130e23e7017524a70')

package_python-gfpgan() {
    optdepends=('gfpgan-model: pre-trained model and inference script'
    'python-realesrgan: enhance the background (non-face) regions')
    cd GFPGAN-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_gfpgan-model() {
    pkgdesc="Pre-trained model and interference script for python-gfpgan."
    depends=('python-gfpgan')
    mkdir -p ${pkgdir}/usr/share/gfpgan-model
    cp *.pth ${pkgdir}/usr/share/gfpgan-model/
    mkdir -p ${pkgdir}/usr/bin
    cp GFPGAN-${pkgver}/inference_gfpgan.py ${pkgdir}/usr/bin/gfpgan
    sed -i "1i#!/usr/bin/python" ${pkgdir}/usr/bin/gfpgan
    sed -i "s|experiments/pretrained_models|/usr/share/gfpgan-model|" ${pkgdir}/usr/bin/gfpgan
    sed -i "s|https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.1|/usr/share/realesrgan-model|" ${pkgdir}/usr/bin/gfpgan
    chmod 755 ${pkgdir}/usr/bin/gfpgan  
}

