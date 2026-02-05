# Maintainer: Piotrek2713 <piotrek.karasinski13@gmail.com>
# Contributor: Kilo Code <ai@kilo.dev>

pkgname=ca-racing
_app_version="1.0.0-demo"
# Sanitize version for Arch (replace - with _)
pkgver="${_app_version//-/_}"
pkgrel=1
pkgdesc="Top-down 2D racing game written in Python"
arch=('any')
url="https://github.com/piotrek1372/ca-racing"
license=('MIT')

depends=('python-pygame' 'python-numpy' 'python-pillow' 'python-pytmx')
makedepends=('python' 'python-pip' 'python-setuptools')

# Source code from GitHub release
_urlver="${pkgver/_/-}"
source=("$pkgname-$_urlver.tar.gz::https://github.com/piotrek1372/$pkgname/archive/refs/tags/v$_urlver.tar.gz"
        "ca-racing.desktop"
        "ca-racing.sh")
sha256sums=('2ce684afe246d350d8bd9d9878f288d9375b5b18bb80611404505cc6d47ec3f9'
            '1daadbed224442b479eb435bb7927a3c16353acbf25eff04d7348202b07cf3f3'
            'ded2d55a2da0ccd2a3273130d3ed41c2e6d6e5b6f0e9c0d7f8cbbbf5365316d5')

build() {
    cd "$srcdir/CA-Racing-$_urlver"
    # No build steps needed for a Python source package
    echo "Skipping build process..."
}

package() {
    # Install the application source code
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/CA-Racing-$_urlver/"* "$pkgdir/opt/$pkgname/"

    # Install Python dependencies
    pip install -r "$pkgdir/opt/$pkgname/requirements.txt" --target "$pkgdir/opt/$pkgname/vendor" --no-user

    # Install the wrapper script
    install -Dm755 "$srcdir/ca-racing.sh" "$pkgdir/usr/bin/$pkgname"

    # Install icon and desktop file
    install -Dm644 "$srcdir/CA-Racing-$_urlver/assets/images/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$srcdir/ca-racing.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
