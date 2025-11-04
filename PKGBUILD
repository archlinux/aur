# Maintainer: Eren Seymen <>
pkgname=eksisozluk-scraper
pkgver=1.1.0
pkgrel=1
pkgdesc="Terminal tabanlı Ekşi Sözlük scraper'ı. Çıktısı AI-friendly formatlarda: JSON (varsayılan), CSV ve Markdown."
arch=('any')
url="https://github.com/erenseymen/eksisozluk-scraper"
license=('GPL3')
depends=('python' 'python-setuptools')
makedepends=('python-pip')
optdepends=('bash-completion: bash completion support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/erenseymen/eksisozluk-scraper/archive/v${pkgver}.tar.gz")
sha256sums=('47a6bf12e6553ef9adbd3ced7207f199acaf715a978a527bb268b798a37814b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Determine Python version and site-packages directory
  _python_version=$(python -c "import sys; print('{}.{}'.format(sys.version_info.major, sys.version_info.minor))")
  _site_packages="$pkgdir/usr/lib/python${_python_version}/site-packages"
  
  # Create site-packages directory if it doesn't exist
  install -d "$_site_packages"
  
  # Install runtime dependencies via pip
  # These packages are not available in official Arch repos
  # Use --target to install directly to the site-packages directory
  pip install --target="$_site_packages" --no-warn-script-location \
    cloudscraper>=1.2.71 \
    beautifulsoup4>=4.12.0 \
    argcomplete>=3.0.0
  
  # Install the package itself
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
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

