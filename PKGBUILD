# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=waymore
pkgver=8.9
pkgrel=1
pkgdesc="Find way more from the Wayback Machine, Common Crawl, Alien Vault OTX, URLScan, VirusTotal, GhostArchive & Intelligence X!"
arch=('any')
url="https://github.com/xnl-h4ck3r/waymore"
license=('MIT')
depends=('python' 'python-requests' 'python-yaml' 'python-termcolor' 'python-psutil' 'python-tldextract')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xnl-h4ck3r/waymore/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cd36d7a1f8df76c598f4ca239bb3eb06840005fbf3f71169d58f079de1696fb0')

latestver() {
    curl -fsSL "https://api.github.com/repos/xnl-h4ck3r/waymore/releases/latest" |
        jq -r '.tag_name // empty' | sed 's/^v//'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # setup.py copies config.yml into $HOME/.config/waymore as a side effect;
    # redirect HOME so the builder's real config is never touched.
    export HOME="$srcdir/.home"
    mkdir -p "$HOME"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config.yml "$pkgdir/usr/share/doc/$pkgname/config.yml.example"
}
