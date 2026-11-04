# Maintainer: Ron Brand <ronb1964@gmail.com>
pkgname=tuxtalk
pkgver=0.21.0
pkgrel=1
pkgdesc="Voice dictation for Linux: hold a key, talk, and your words are typed for you"
arch=('any')
url="https://tuxtalk.app/"
license=('MIT')
# Everything comes from Arch's repositories or the AUR, so pacman and the
# AUR helper update it with the rest of the system and nothing is
# downloaded from PyPI.
# python-onnxruntime is provided by python-onnxruntime-cpu and by the CUDA
# and ROCm builds; Parakeet runs on the processor, so the cpu one is enough.
# python-faster-whisper pulls python-ctranslate2, which the AUR builds without
# CUDA, so TuxTalk's graphics-card choices here are Vulkan and the processor.
# Fix Typing sets up the hotkey helper through pkexec, which polkit provides.
depends=('python' 'python-gobject' 'python-cairo' 'python-dbus' 'python-evdev' 'gtk3'
         'libayatana-appindicator' 'hicolor-icon-theme' 'polkit' 'wl-clipboard'
         'python-numpy' 'python-toml'
         'python-faster-whisper' 'python-ctranslate2' 'python-onnx-asr'
         'python-onnxruntime' 'python-sounddevice' 'python-text2num'
         'python-huggingface-hub' 'python-av' 'python-tqdm')
makedepends=('python-build' 'python-installer' 'python-poetry-core')
optdepends=(
    'pipewire-pulse: turn other sound down and set the mic volume, on PipeWire (pactl, paplay)'
    'pulseaudio: turn other sound down and set the mic volume, on PulseAudio (pactl, paplay)'
    'vulkan-icd-loader: run speech models on the graphics card (Vulkan)'
)
# The AppImage package and the older TalkType ones install the same command.
conflicts=('tuxtalk-appimage' 'talktype-appimage' 'talktype')
# Removes the hotkey helper TuxTalk set up when the package goes, and says
# to restart TuxTalk after an upgrade.
install=tuxtalk.install
source=("tuxtalk-${pkgver}.tar.gz::https://github.com/ronb1964/TuxTalk/archive/refs/tags/v${pkgver}.tar.gz")
# Set from the tagged archive once the release's tag exists (makepkg -g);
# the tag doesn't exist when pkgver is bumped.
sha256sums=('870ad9e21e2d8188e845b226bc7219e657f1d24dea5db203da4dea395275dade')

build() {
    cd "TuxTalk-${pkgver}"
    python -m build --wheel --no-isolation
}

# There is no check(): the test suite needs a display, a session bus and
# development tools the build machine doesn't have. The VM run before each
# release and the repository's CI are the check.

package() {
    cd "TuxTalk-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # The menu entry the AppImage ships, with the command it runs here. The
    # file keeps its name: TuxTalk's windows carry it, so the desktop matches
    # them to this entry and its icon.
    install -d "$pkgdir/usr/share/applications"
    sed 's/^Exec=AppRun/Exec=tuxtalk/' io.github.ronb1964.TuxTalk.desktop \
        > "$pkgdir/usr/share/applications/io.github.ronb1964.TuxTalk.desktop"
    chmod 644 "$pkgdir/usr/share/applications/io.github.ronb1964.TuxTalk.desktop"

    install -Dm644 icons/OFFICIAL_ICON_DO_NOT_CHANGE.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.ronb1964.TuxTalk.svg"
    install -Dm644 io.github.ronb1964.TuxTalk.png \
        "$pkgdir/usr/share/pixmaps/io.github.ronb1964.TuxTalk.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
