# Maintainer: Luca Steccanella <steccas at pm dot me>
pkgname=voxd
pkgver=1.7.0
pkgrel=1
pkgdesc="Voice-typing/dictation app for Linux using local speech-to-text processing"
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
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jakovius/voxd/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('a3a9c253f64bcf91794b217b32d96c0909d29f2830a0d53ddb0731ef7c21ecba')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
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
        install -dm755 "$pkgdir/usr/share/$pkgname/assets"
        cp -r src/voxd/assets/* "$pkgdir/usr/share/$pkgname/assets/"
    fi
    
    # Install default configs
    if [ -d "src/voxd/defaults" ]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/defaults"
        cp -r src/voxd/defaults/* "$pkgdir/usr/share/$pkgname/defaults/"
    fi
    
    # Install README and LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
