# Maintainer: Sebastian Westberg <sebastian@westberg.io>
pkgname=termr
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal-based radio player with TUI"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/Hibbins/termr"
license=('MIT')
depends=('python>=3.10' 'vlc' 'python-textual' 'python-requests' 'python-rich' 'python-installer')
makedepends=('python-setuptools' 'python-wheel' 'python-build')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Hibbins/termr/archive/v$pkgver.tar.gz")
sha256sums=('ef052dac6d38f58fed794a44129761dc6c89f882c8e842e6a4bee9a0e7c08714')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Find and move termr script to correct location
    echo "Looking for termr script in package directory..."
    find "$pkgdir" -name "termr" -type f -executable
    
    # Move script from any location to /usr/bin/termr
    for script_path in "$pkgdir"/usr/local/bin/termr "$pkgdir"/bin/termr "$pkgdir"/sbin/termr "$pkgdir"/usr/sbin/termr; do
        if [ -f "$script_path" ]; then
            echo "Moving $script_path to /usr/bin/termr"
            install -Dm755 "$script_path" "$pkgdir/usr/bin/termr"
            rm "$script_path"
            break
        fi
    done
    
    # Ensure the script exists in /usr/bin
    if [ ! -f "$pkgdir/usr/bin/termr" ]; then
        echo "Warning: termr script not found in expected locations"
        exit 1
    fi
    
    # Create man page
    install -Dm644 "$srcdir/$pkgname-$pkgver/termr.1" "$pkgdir/usr/share/man/man1/termr.1"
}
