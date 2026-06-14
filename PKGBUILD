# Maintainer: YOUR NAME <YOUR_EMAIL>
# Contributor: DocZeus <harshit@kshoonya.com>
#
# AUR package for NV Broadcast — unofficial NVIDIA Broadcast for Linux.
# https://github.com/Hkshoonya/nvidia-broadcast-linux
#
# pyrnnoise is bundled as a pre-built wheel because it is not available
# in the Arch repositories or AUR.  When upgrading this package, run
#   updpkgsums
# to refresh the checksum of the pyrnnoise wheel if the upstream version
# changes.

pkgname=nvbroadcast-bin
pkgver=1.1.9
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
  'python-gobject'
  'python-numpy'
  'python-pillow'
  'python-opencv'
  'python-psutil'
  'python-scipy'
  'python-onnx'
  'python-onnxruntime-opt-cuda'
  'python-mediapipe-bin'
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
  'python-pip: in-app installer for GPU-accelerated modes (CuPy, TensorRT)'
)
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "pyrnnoise-0.4.3-py3-none-manylinux1_x86_64.whl::https://files.pythonhosted.org/packages/04/51/993a25a8b5220e23e0a31ff98747b8fce4685336e0fc4e8e156feab5c4f1/pyrnnoise-0.4.3-py3-none-manylinux1_x86_64.whl"
)
sha256sums=(
  'bdfa82534c2c8f0bd01f50992797019b047c3a3c6903e0b431118afbf4f37470'
  '1b094777e73797c5dd647782902c691ebb9a3c456c878e742597f5b55535a3db'
)
install=nvbroadcast.install

build() {
  cd "$srcdir"/nvidia-broadcast-linux-*/
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/nvidia-broadcast-linux-*/

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
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modprobe.d/nvbroadcast.conf" \
    <<< 'options v4l2loopback devices=1 video_nr=10 card_label="NVIDIA Broadcast" exclusive_caps=1 max_buffers=4'
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/lib/modules-load.d/nvbroadcast.conf" \
    <<< 'v4l2loopback'

  # README
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
