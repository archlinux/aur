# Maintainer: JiPaix <https://github.com/JiPaix>
pkgname=webcam-blur
pkgver=0.2.0
pkgrel=1
pkgdesc="Background blur for any webcam, as virtual cameras usable in every app (tray toggle, GPU accelerated)"
arch=('any')
url="https://github.com/JiPaix/webcam-blur"
license=('GPL-3.0-or-later')
depends=('python' 'python-numpy' 'python-onnx' 'python-onnxruntime' 'python-opencv' 'python-pyqt6' 'python-pyudev')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-onnxruntime-rocm: AMD GPU acceleration (MIGraphX)'
            'python-onnxruntime-cuda: NVIDIA GPU acceleration'
            'v4l2loopback-dkms: if your kernel does not ship the v4l2loopback module')
install=webcam-blur.install
_models="https://github.com/PeterL1n/RobustVideoMatting/releases/download/v1.0.0"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$_models/rvm_mobilenetv3_fp32.onnx"
        "$_models/rvm_resnet50_fp32.onnx")
sha256sums=('2f783a14c030651696b9a13742051c79fe8a2d43884a7a33f192b07d46984a1a'
            '88d4531297118f595bf2fd60f6f566aec2e559393802d1f436c380f0cbbd2828'
            '25db300fcb6ee27f941a1b52c97856e8d1f13c7f35817f81a612f89af0e8a85c')

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
    "$srcdir/rvm_mobilenetv3_fp32.onnx" "$srcdir/rvm_resnet50_fp32.onnx"
}
