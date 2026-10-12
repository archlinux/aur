# Maintainer: 13905069 <2270638422@qq.com>
# Contributor: DocZeus <harshit@kshoonya.com>
#
# AUR package for NV Broadcast — unofficial NVIDIA Broadcast for Linux.
# https://github.com/Hkshoonya/nvidia-broadcast-linux

pkgname=nvbroadcast-bin
pkgver=1.5.3
pkgrel=1
pyrnnoise_ver=0.4.5
audiolab_ver=0.5.2
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
  'python-av'
  'python-click'
  'python-gobject'
  'python-humanize'
  'python-jinja'
  'python-mediapipe-bin'
  'python-matplotlib'
  'python-numpy'
  'python-onnx'
  'python-onnxruntime-opt-cuda'
  'python-packaging'
  'python-pillow'
  'python-protobuf'
  'python-psutil'
  'python-scipy'
  'python-soundfile'
  'python-soxr'
  'python-opencv'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
# Both wheels are vendored into site-packages; guard against a repo/AUR package
# appearing under the same name and colliding with the copies we install.
conflicts=('python-pyrnnoise' 'python-audiolab')
optdepends=(
  'libayatana-appindicator: system tray icon'
  'python-pip: in-app installer for optional GPU/meeting runtimes (CuPy, TensorRT, faster-whisper)'
)
source=(
  "$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
  "pyrnnoise-$pyrnnoise_ver-py3-none-manylinux1_x86_64.whl::https://files.pythonhosted.org/packages/f1/8b/6498de7ef0a4670bbeae951bec9cfd2386e57ef386f53eec28e75be39790/pyrnnoise-$pyrnnoise_ver-py3-none-manylinux1_x86_64.whl"
  "audiolab-$audiolab_ver-py3-none-any.whl::https://files.pythonhosted.org/packages/94/81/5bff5f43003dc2b72497c85c391cb87e1a9ff0b55c359bdf774fe8779c36/audiolab-$audiolab_ver-py3-none-any.whl"
)
sha256sums=(
  'd6df846534a81779cbca37f1068f2b3120fb4e1d828d5129ce4d5a84a18ea391'
  'c095114532f9fa21f621084c879d72c93aaa0c9dbe38b662a63577bada2c214e'
  '657cbabc358d6ff04b69f13d52ffa53288acf4cbcbc792c1cc8b112b670749da'
)
install=nvbroadcast.install

build() {
  cd "$srcdir/nvidia-broadcast-linux-$pkgver"
  export PYTHONNOUSERSITE=1
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/nvidia-broadcast-linux-$pkgver"
  export PYTHONNOUSERSITE=1

  # Vendored: audiolab is in neither the repos nor the AUR. This pair is the one
  # that works with the repo's python-av — audiolab >=0.5.2 falls back when PyAV
  # 17 dropped av.option, while 0.5.1 fails to import.
  python -m installer --destdir="$pkgdir" \
    "$srcdir"/audiolab-$audiolab_ver-py3-none-any.whl \
    "$srcdir"/pyrnnoise-$pyrnnoise_ver-py3-none-manylinux1_x86_64.whl

  # Install nvbroadcast wheel
  # Handles: Python modules, /usr/bin/{nvbroadcast,nvbroadcast-vcam},
  #          desktop entry, metainfo, SVG icon, background images
  python -m installer --destdir="$pkgdir" dist/*.whl

  # python-onnxruntime-opt-cuda's CUDA provider declares no NEEDED on libcudnn,
  # so ORT only finds cuDNN when it is already in the global symbol namespace;
  # otherwise every ONNX model silently loads on CPU. Preload it in a wrapper
  # around both entry points, which also covers the .desktop Exec and the unit.
  install -d "$pkgdir/usr/lib/nvbroadcast"
  for _ep in nvbroadcast nvbroadcast-vcam; do
    mv "$pkgdir/usr/bin/$_ep" "$pkgdir/usr/lib/nvbroadcast/$_ep.real"
    printf '#!/bin/sh\nif [ -e /usr/lib/libcudnn.so.9 ]; then\n  export LD_PRELOAD="${LD_PRELOAD:+$LD_PRELOAD:}/usr/lib/libcudnn.so.9"\nfi\nexec /usr/lib/nvbroadcast/%s.real "$@"\n' "$_ep" > "$pkgdir/usr/bin/$_ep"
    chmod 755 "$pkgdir/usr/bin/$_ep"
  done

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
