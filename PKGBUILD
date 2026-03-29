# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback
pkgver=0.8.3
pkgrel=1
pkgdesc="Local meeting recorder with transcription and speaker diarization for Obsidian"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=(
    'python'
    'ffmpeg'
    'pulse-native-provider'
)
optdepends=(
    'cuda: GPU-accelerated transcription and diarization'
)
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yastcher/tapeback/archive/v$pkgver.tar.gz")
sha256sums=('1b2f249de82026637d7a1f1cddf9d8df2470a9f3d759d3e568ca1a44a1a20279')

build() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages "$srcdir/venv"
    "$srcdir/venv/bin/pip" install --no-cache-dir .
}

package() {
    # Install venv to /opt
    install -d "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/venv"/* "$pkgdir/opt/$pkgname/"

    # Create wrapper script
    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/tapeback" << 'WRAPPER'
#!/bin/sh
exec /opt/tapeback/bin/tapeback "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/tapeback"

    # License
    cd "$pkgname-$pkgver"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
