# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback
pkgver=0.9.6
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
sha256sums=('381e5b4690a0a87abcb8eb237c9765f4c8df6975e40fe7201180ac4cae89144f')

build() {
    cd "$pkgname-$pkgver"
    python -m venv --system-site-packages "$srcdir/venv"
    "$srcdir/venv/bin/pip" install --no-cache-dir .
}

package() {
    # Install venv to /opt
    install -d "$pkgdir/opt/$pkgname"
    cp -a "$srcdir/venv"/* "$pkgdir/opt/$pkgname/"

    # Fix shebangs: replace build-time venv path with install-time path
    find "$pkgdir/opt/$pkgname/bin" -type f -exec \
        sed -i "1s|#!.*$srcdir/venv/bin/python[^ ]*|#!/opt/$pkgname/bin/python|" {} \;

    # Fix venv home path
    sed -i "s|$srcdir/venv|/opt/$pkgname|g" "$pkgdir/opt/$pkgname/pyvenv.cfg"

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
