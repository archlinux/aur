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
  
  # Install runtime dependencies via pip first
  # These packages are not available in official Arch repos
  pip install --root="$pkgdir" --no-warn-script-location \
    cloudscraper>=1.2.71 \
    beautifulsoup4>=4.12.0 \
    argcomplete>=3.0.0
  
  # Install the package itself
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
  # Install fish completion
  install -Dm644 completions/eksisozluk-scraper.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/eksisozluk-scraper.fish"
  
  # Generate bash completion using argcomplete
  # The executable is installed to $pkgdir/usr/bin, add it to PATH
  install -d "$pkgdir/usr/share/bash-completion/completions"
  PATH="$pkgdir/usr/bin:$PATH" \
    python -m argcomplete.register-python-argcomplete eksisozluk-scraper \
    > "$pkgdir/usr/share/bash-completion/completions/eksisozluk-scraper" 2>/dev/null || true
}

# vim:set ts=2 sw=2 et:

