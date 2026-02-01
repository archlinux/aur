# Maintainer: Storm Dragon <storm_dragon@stormux.org>
pkgname=access-irc
pkgver=1.7.0
pkgrel=1
pkgdesc="Accessible IRC client with GTK3 and screen reader support"
arch=('any')
url="https://github.com/destructatron/access-irc"
license=('MIT')
depends=('python' 'python-gobject' 'python-miniirc' 'python-pluggy' 'gtk3' 'at-spi2-core'
         'gst-plugins-base' 'gst-plugins-good' 'python-gtkspellcheck')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-numpy: for sound generation'
            'python-scipy: for sound generation')
source=("$pkgname-$pkgver.tar.gz::https://github.com/destructatron/access-irc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa02cc159b883d96a63ed2813360c527422f433af22fca9b4f4b62a27221c72b')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Find the site-packages data directory
    local sitePackages
    sitePackages="$pkgdir/$(python -c 'import site; print(site.getsitepackages()[0])')"
    local dataDir="$sitePackages/access_irc/data"

    # Move data files to /usr/share/access-irc (the app checks here first)
    install -dm755 "$pkgdir/usr/share/$pkgname/sounds"
    install -Dm644 "$dataDir/sounds/"*.wav "$pkgdir/usr/share/$pkgname/sounds/"
    install -Dm644 "$dataDir/config.json.example" "$pkgdir/usr/share/$pkgname/config.json.example"

    # Remove duplicates from site-packages
    rm -rf "$dataDir"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
