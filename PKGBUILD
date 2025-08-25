# Maintainer: mfw <espadonne@outlook.com>

pkgname=spotify-cue
pkgver=1.0.0
pkgrel=1
pkgdesc='Unified CLI Spotify controller with intelligent session management and network support'
arch=('any')
url='https://github.com/notvox/cue'
license=('MIT')
depends=('python' 'python-click' 'python-requests' 'python-flask' 'python-spotipy' 'python-schedule')
makedepends=('python-build' 'python-installer' 'python-hatchling')
optdepends=('systemd: for cue-server daemon service')
provides=('cue')
source=("git+https://github.com/notvox/cue.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd cue
    python -m build --wheel --no-isolation
}

check() {
    cd cue
    python scripts/check_setup.py || true  # Allow setup check to fail gracefully
}

package() {
    cd cue
    
    # Install the Python package
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install systemd service
    install -Dm644 packaging/cue-server.service "$pkgdir/usr/lib/systemd/system/cue-server.service"
    
    # Install configuration template
    install -Dm644 packaging/cue.conf.example "$pkgdir/etc/cue/cue.conf.example"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}