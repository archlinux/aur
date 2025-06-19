# Maintainer: atopheim <atopheim@protonmail.com>
pkgname=hotspeech
pkgver=1.0.0
pkgrel=2
pkgdesc="Voice recording and transcription tool with hotkey support and web interface"
arch=('any')
url="https://github.com/atopheim/hotspeech"
license=('MIT')
depends=(
    'python'
    'python-fastapi'
    'uvicorn'
    'python-jinja'
    'python-python-multipart'
    'python-openai'
    'python-toml'
    'python-pydantic'
    'ffmpeg'
    'libpulse'
    'libnotify'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'xclip: clipboard support on X11'
    'wl-clipboard: clipboard support on Wayland'
)
install=hotspeech.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/atopheim/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6d66ba4a51308e8f0a375eb44ee362ef3a0e03a66fc7ab0cc27822ea9e5643b6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install configuration template
    install -Dm644 hotspeech/config.toml "$pkgdir/usr/share/hotspeech/config.toml.example"
    
    # Install desktop file
    install -Dm644 hotspeech.desktop "$pkgdir/usr/share/applications/hotspeech.desktop"
    
    # Install systemd user service
    install -Dm644 hotspeech.service "$pkgdir/usr/lib/systemd/user/hotspeech.service"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
