# Maintainer: JiPaix <https://github.com/JiPaix>
pkgname=webcam-blur
pkgver=0.3.0
pkgrel=1
pkgdesc="Background blur for any webcam, as virtual cameras usable in every app (tray toggle, GPU accelerated)"
arch=('any')
url="https://github.com/JiPaix/webcam-blur"
license=('GPL-3.0-or-later')
depends=('python' 'python-numpy' 'python-onnxruntime' 'python-opencv' 'python-pyqt6' 'python-pyudev')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('ncnn: GPU acceleration with Vulkan (AMD, NVIDIA, Intel)'
            'vulkan-driver: GPU acceleration (vulkan-radeon, vulkan-intel, nvidia-utils; usually installed)'
            'v4l2loopback-dkms: if your kernel does not ship the v4l2loopback module')
install=webcam-blur.install
_models="https://github.com/PeterL1n/RobustVideoMatting/releases/download/v1.0.0"
_ncnn="$url/releases/download/ncnn-models-1"  # the same models converted for ncnn (GPU)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$_models/rvm_mobilenetv3_fp32.onnx"
        "$_models/rvm_resnet50_fp32.onnx"
        "$_ncnn/rvm_mobilenetv3.ncnn.param"
        "$_ncnn/rvm_mobilenetv3.ncnn.bin"
        "$_ncnn/rvm_resnet50.ncnn.param"
        "$_ncnn/rvm_resnet50.ncnn.bin")
sha256sums=('47f99a1a656789c4347808def29b327ce2ddbc00222cf5abb0f3be7485529499'
            '88d4531297118f595bf2fd60f6f566aec2e559393802d1f436c380f0cbbd2828'
            '25db300fcb6ee27f941a1b52c97856e8d1f13c7f35817f81a612f89af0e8a85c'
            '7064b3781bc7652d01e10fc5684349fb4c0df700a4841b032835fbd15275d8d5'
            'f34dda8b84610850672c2c4c226c74022d9487ae85ac8806ca56952d3b00344f'
            '99710e4929b5684ba09003adf7169960b48b7ee7ac5e2811888a55e8d7eed328'
            '0a0f93e0171a996f162999d4bc8360d597b638fc106ac3348e142d4cd989ec21')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 data/60-webcam-blur.rules "$pkgdir/usr/lib/udev/rules.d/60-webcam-blur.rules"
  install -Dm644 data/modprobe.conf "$pkgdir/usr/lib/modprobe.d/webcam-blur.conf"
  install -Dm644 data/modules-load.conf "$pkgdir/usr/lib/modules-load.d/webcam-blur.conf"
  install -Dm644 data/webcam-blur.desktop "$pkgdir/usr/share/applications/webcam-blur.desktop"
  install -Dm644 -t "$pkgdir/usr/share/webcam-blur/models" \
    "$srcdir"/rvm_{mobilenetv3_fp32,resnet50_fp32}.onnx "$srcdir"/rvm_{mobilenetv3,resnet50}.ncnn.{param,bin}
}
