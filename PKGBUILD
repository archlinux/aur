# Maintainer: ibrahimsql <ibrahimsql@proton.me>
# Contributor: ibrahimsql <ibrahimsql@proton.me>

pkgname=discoursemap
pkgver=1.2.2
pkgrel=1
pkgdesc="Discourse forum security scanner for security professionals and forum administrators"
arch=('any')
url="https://github.com/ibrahmsql/discoursemap"
license=('MIT')
groups=()
backup=('etc/discoursemap/config.yaml')
depends=('python>=3.8' 
         'python-pip'
         'python-yaml'
         'python-requests'
         'python-beautifulsoup4'
         'python-lxml'
         'python-colorama'
         'python-tqdm'
         'python-jinja'
         'python-urllib3'
         'python-certifi'
         'python-chardet'
         'python-idna'
         'python-pysocks'
         'python-cryptography'
         'python-pyopenssl'
         'python-setuptools'
         'python-wheel')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('ruby-nokogiri: HTML/XML parsing for Ruby exploits'
            'ruby-json: JSON processing for Ruby exploits'
            'ruby-openssl: SSL/TLS support for Ruby exploits')
source=("https://files.pythonhosted.org/packages/source/d/discoursemap/discoursemap-${pkgver}.tar.gz")
sha256sums=('8df189ac1eed024fffd2ec73b6ec987b0e31446be642b33c7626bfc835701ffb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install configuration files
    if [ -f "config.yaml" ]; then
        install -Dm644 config.yaml "$pkgdir/etc/$pkgname/config.yaml"
    fi
    
    # Install data files
    if [ -d "data" ]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/data"
        cp -r data/* "$pkgdir/usr/share/$pkgname/data/"
    fi
    
    # Install Ruby exploits
    if [ -d "ruby_exploits" ]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/ruby_exploits"
        cp -r ruby_exploits/* "$pkgdir/usr/share/$pkgname/ruby_exploits/"
    fi
    
    # Install discourse exploits
    if [ -d "discoursemap/discourse_exploits" ]; then
        install -dm755 "$pkgdir/usr/share/$pkgname/discourse_exploits"
        cp -r discoursemap/discourse_exploits/* "$pkgdir/usr/share/$pkgname/discourse_exploits/"
    fi

}
