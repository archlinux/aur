# Maintainer: Eren Seymen <>
pkgname=eksisozluk-scraper
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal tabanlı Ekşi Sözlük scraper'ı. Çıktısı AI-friendly formatlarda: JSON (varsayılan), CSV ve Markdown."
arch=('any')
url="https://github.com/erenseymen/eksisozluk-scraper"
license=('GPL3')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-argcomplete'
  'python-requests'
  'python-urllib3'
  'python-charset-normalizer'
  'python-idna'
  'python-typing_extensions'
  'python-soupsieve'
)
makedepends=('python-setuptools' 'python-pip')
optdepends=('bash-completion: bash completion support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erenseymen/eksisozluk-scraper/archive/v${pkgver}.tar.gz")
sha256sums=('47a6bf12e6553ef9adbd3ced7207f199acaf715a978a527bb268b798a37814b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install cloudscraper via pip (not available in official Arch repos)
  # Use --root to install to package directory, --no-deps to avoid conflicts
  # with system packages. System packages will be used at runtime.
  pip install --root="$pkgdir" \
    --no-warn-script-location \
    --no-deps \
    --ignore-installed \
    cloudscraper>=1.2.71
  
  # Install the package itself using setup.py (without installing dependencies)
  # setuptools will handle the entry point correctly
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
  # Remove egg-info requires.txt to prevent automatic dependency detection
  _python_version=$(python -c "import sys; print('{}.{}'.format(sys.version_info.major, sys.version_info.minor))")
  rm -f "$pkgdir/usr/lib/python${_python_version}/site-packages/eksisozluk_scraper"*.egg-info/requires.txt 2>/dev/null || true
  
  # Install fish completion
  install -Dm644 completions/eksisozluk-scraper.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/eksisozluk-scraper.fish"
  
  # Generate bash completion using argcomplete
  install -d "$pkgdir/usr/share/bash-completion/completions"
  PATH="$pkgdir/usr/bin:$PATH" \
    python -m argcomplete.register-python-argcomplete eksisozluk-scraper \
    > "$pkgdir/usr/share/bash-completion/completions/eksisozluk-scraper" 2>/dev/null || true
}

# vim:set ts=2 sw=2 et:

