# Maintainer: Adrian Lopez <aur@adrianlzt.com>

pkgname=vocalinux-git
_pkgname=vocalinux
pkgver=nightly.2026.03.18.r0.g99699f1
pkgrel=1
pkgdesc="Voice dictation for Linux with offline speech recognition"
arch=('x86_64' 'aarch64')
url="https://github.com/jatinkrmalik/vocalinux"
license=('MIT')
depends=(
  'python>=3.8'
  'python-gobject'
  'gtk3'
  'libappindicator-gtk3'
  'ibus'
  'gobject-introspection'
  'python-cairo'
  'python-pynput'
  'python-pywhispercpp-cpu'
  'portaudio'
  'python-virtualenv'
  'pkg-config'
  'wget'
  'curl'
  'unzip'
  'vulkan-tools'
  'vulkan-headers'
  'glslang'
  'xclip'
  'wl-clipboard'
  'wtype'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'python-setuptools'
  'python-wheel'
  'python-build'
  'python-installer'
)
optdepends=(
  'python-pywhispercpp-cuda: NVIDIA GPU acceleration (replace cpu variant)'
  'python-pywhispercpp-rocm: AMD GPU acceleration (replace cpu variant)'
  'openai-whisper: OpenAI Whisper speech recognition'
  'python-vosk: Vosk speech recognition'
  'xdotool: X11 text injection'
  'ydotool: Alternative text injection for Wayland'
)
provides=('vocalinux')
conflicts=('vocalinux')
source=("$_pkgname::git+https://github.com/jatinkrmalik/vocalinux.git"
  "vocalinux.service")
sha256sums=('SKIP'
            '39879abfc03b057e202d014695c52339f02627a3fc6f508958673c4964b0b0a8')
install="$pkgname.install"

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 vocalinux.desktop "$pkgdir/usr/share/applications/vocalinux.desktop"

  for icon in vocalinux.svg vocalinux-microphone.svg vocalinux-microphone-off.svg vocalinux-microphone-process.svg; do
    if [ -f "resources/icons/scalable/$icon" ]; then
      install -Dm644 "resources/icons/scalable/$icon" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$icon"
    fi
  done

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "$srcdir/vocalinux.service" "$pkgdir/usr/lib/systemd/user/vocalinux.service"

  install -d "$pkgdir/usr/share/vocalinux/models"
}
