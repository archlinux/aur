# Maintainer: Lyra Vhess <auxilliary.email@protonmail.com>
pkgname=vsrvrt-git
_pkgname=vs-rvrt
pkgver=1.0.0.r0.g57a5c5f
pkgrel=6
pkgdesc="Vapoursynth plugin for RVRT (Recurrent Video Restoration Transformer) video restoration"
arch=('x86_64')
url="https://github.com/Lyra-Vhess/vs-rvrt"
license=('CC-BY-NC-4.0')
depends=(
    'python'
    'python-einops'
    'python-torchvision'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'vapoursynth'
    'python-packaging'
)
optdepends=(
    'cuda: For GPU acceleration'
    'ffmpeg: For video encoding/decoding'
)
makedepends=('git' 'wget' 'python-setuptools' 'python-wheel')
provides=('vsrvrt')
conflicts=('vsrvrt')
source=("git+https://github.com/Lyra-Vhess/vs-rvrt.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cd vsrvrt/models
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/001_RVRT_videosr_bi_REDS_30frames.pth"
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/002_RVRT_videosr_bi_Vimeo_14frames.pth"
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/003_RVRT_videosr_bd_Vimeo_14frames.pth"
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/004_RVRT_videodeblurring_DVD_16frames.pth"
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/005_RVRT_videodeblurring_GoPro_16frames.pth"
    wget -q --show-progress "https://github.com/JingyunLiang/RVRT/releases/download/v0.0/006_RVRT_videodenoising_DAVIS_16frames.pth"
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
