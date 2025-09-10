# Maintainer: Jendrik <jendrik@madewithtea.com>
pkgname=wl-voice
pkgver=1.0.0
pkgrel=1
pkgdesc="A voice recording and transcription tool for Hyprland using Whisper STT"
arch=('x86_64')
url="https://github.com/jpzk/wl-voice"
license=('MIT')
depends=('python' 'portaudio' 'wl-clipboard')
makedepends=('python-pip' 'python-virtualenv' 'git')
source=("git+https://github.com/jpzk/wl-voice.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    
    # Create virtual environment
    python -m venv venv
    source venv/bin/activate
    
    # Install dependencies
    pip install -r requirements.txt
    pip install pyinstaller
}

build() {
    cd "$srcdir/$pkgname"
    
    source venv/bin/activate
    
    # Build executables with PyInstaller
    pyinstaller --onefile wl-voiced.py
    pyinstaller --onefile wl-voice.py
}

package() {
    cd "$srcdir/$pkgname"
    
    # Install binaries
    install -Dm755 dist/wl-voiced "$pkgdir/usr/bin/wl-voiced"
    install -Dm755 dist/wl-voice "$pkgdir/usr/bin/wl-voice"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
}
