pkgbase='python-gfpgan'
pkgname=('python-gfpgan' 'gfpgan-model')
pkgver=1.3.8
pkgrel=1
pkgdesc="GFPGAN aims at developing Practical Algorithms for Real-world Face Restoration. "
arch=('x86_64')
url="https://github.com/TencentARC/GFPGAN"
license=('Apache 2.0')
depends=('python-pytorch' 'python-numpy' 'python-opencv' 'python-torchvision' 'python-scipy'
'python-tqdm' 'python-basicsr' 'python-facexlib' 'python-lmdb' 'python-pyaml' 'tensorboard' 'yapf')
makedepends=('python-setuptools')

source=("https://github.com/TencentARC/GFPGAN/archive/refs/tags/v$pkgver.tar.gz"
'https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth'
'https://github.com/TencentARC/GFPGAN/releases/download/v1.3.4/RestoreFormer.pth')
sha256sums=('a3b04c61554341800ef04b1daa11a92c8afef5de150348974df8e1989ec29130'
            'e2cd4703ab14f4d01fd1383a8a8b266f9a5833dacee8e6a79d3bf21a1b6be5ad'
            '07404d446d62ca3d5ed38b1de09a947a1e77d46dbccec961a74d713a8f24ace0')

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

