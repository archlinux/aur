# Maintainer: 13905069 <2270638422@qq.com>
# Contributor: DocZeus <harshit@kshoonya.com>
#
# AUR package for NV Broadcast — unofficial NVIDIA Broadcast for Linux.
# https://github.com/Hkshoonya/nvidia-broadcast-linux

pkgname=nvbroadcast-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Unofficial NVIDIA Broadcast for Linux — AI-powered virtual camera with background removal, blur, replacement, video enhancement, and noise cancellation. GPU accelerated. Open source.'
arch=('x86_64')
url='https://github.com/Hkshoonya/nvidia-broadcast-linux'
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'libadwaita'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'v4l-utils'
  'v4l2loopback-dkms'
  'pipewire'
  'libpulse'
  'psmisc'
  'python>=3.11'
  'python-click'
  'python-gobject'
  'python-mediapipe-bin'
  'python-numpy'
  'python-onnx'
  'python-onnxruntime-opt-cuda'
  'python-pillow'
  'python-protobuf'
  'python-psutil'
  'python-scipy'
  'python-opencv'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
conflicts=('python-pyrnnoise')
optdepends=(
  'libayatana-appindicator: system tray icon'
  'python-pip: in-app installer for optional GPU/meeting runtimes (CuPy, TensorRT, faster-whisper)'
)
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "pyrnnoise-0.4.3-py3-none-manylinux1_x86_64.whl::https://files.pythonhosted.org/packages/04/51/993a25a8b5220e23e0a31ff98747b8fce4685336e0fc4e8e156feab5c4f1/pyrnnoise-0.4.3-py3-none-manylinux1_x86_64.whl"
)
sha256sums=(
  '8b8168366349aea5242e49e17bae8ae26547bcbca79fcf000d4b2e45b13349b6'
  '1b094777e73797c5dd647782902c691ebb9a3c456c878e742597f5b55535a3db'
)
install=nvbroadcast.install

build() {
  cd "$srcdir"/nvidia-broadcast-linux-*/
  export PYTHONNOUSERSITE=1
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/nvidia-broadcast-linux-*/
  export PYTHONNOUSERSITE=1

  # Install pyrnnoise wheel (not in repositories or AUR)
  python -m installer --destdir="$pkgdir" "$srcdir"/pyrnnoise-*.whl

  # Install nvbroadcast wheel
  # Handles: Python modules, /usr/bin/{nvbroadcast,nvbroadcast-vcam},
  #          desktop entry, metainfo, SVG icon, background images
  python -m installer --destdir="$pkgdir" dist/*.whl

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # systemd user service for headless virtual-camera mode
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/systemd/user/nvbroadcast-vcam.service" << 'SVC'
[Unit]
Description=NVIDIA Broadcast Virtual Camera Service
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/nvbroadcast-vcam
Restart=on-failure
RestartSec=3

[Install]
WantedBy=graphical-session.target
SVC

  # v4l2loopback config — auto-loaded by kernel; user can override in /etc/modprobe.d/
  # card_label matches upstream VIRTUAL_CAM_LABEL ("NVbroadcast") since v1.2.0
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modprobe.d/nvbroadcast.conf" \
    <<< 'options v4l2loopback devices=1 video_nr=10 card_label="NVbroadcast" exclusive_caps=1 max_buffers=4'
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modules-load.d/nvbroadcast.conf" \
    <<< 'v4l2loopback'

  # README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
