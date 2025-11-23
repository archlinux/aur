# Maintainer: Luca Steccanella <steccas at pm dot me>
pkgname=voxd-git
pkgver=r254.9c067c6
pkgrel=1
pkgdesc="Voice-typing/dictation app for Linux using local speech-to-text processing (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/jakovius/voxd"
license=('GPL-3.0-or-later')
depends=(
    'python>=3.9'
    'python-sounddevice'
    'python-pyqt6'
    'python-platformdirs'
    'python-yaml'
    'python-pyperclip'
    'python-psutil'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'python-pyqtgraph'
    'ffmpeg'
    'portaudio'
    'xclip'
    'xsel'
    'wl-clipboard'
    'xdotool'
    'ydotool'
    'xcb-util-cursor'
    'xcb-util-wm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatchling'
    'git'
    'cmake'
    'gcc'
    'make'
)
optdepends=(
    'whisper.cpp: Local speech recognition backend'
    'llama.cpp: Local AI post-processing'
)
provides=('voxd')
conflicts=('voxd' 'voxd-bin')
source=(
    "voxd::git+https://github.com/jakovius/voxd.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/voxd"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/voxd"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/voxd"
    
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install desktop launchers if they exist
    if [ -f "launcher_setup.sh" ]; then
        install -Dm755 launcher_setup.sh "$pkgdir/usr/share/$pkgname/launcher_setup.sh"
    fi
    
    # Install setup script for reference
    if [ -f "setup.sh" ]; then
        install -Dm755 setup.sh "$pkgdir/usr/share/$pkgname/setup.sh"
    fi
    
    # Install assets
    if [ -d "src/voxd/assets" ]; then
        install -dm755 "$pkgdir/usr/share/voxd/assets"
        cp -r src/voxd/assets/* "$pkgdir/usr/share/voxd/assets/"
    fi
    
    # Install default configs
    if [ -d "src/voxd/defaults" ]; then
        install -dm755 "$pkgdir/usr/share/voxd/defaults"
        cp -r src/voxd/defaults/* "$pkgdir/usr/share/voxd/defaults/"
    fi
    
    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/voxd/README.md"
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/voxd/LICENSE"
    fi
}
