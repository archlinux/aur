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
  
  # Install cloudscraper and its dependencies that aren't in official Arch repos
  # Install with dependencies, then remove files that conflict with system packages
  _python_version=$(python -c "import sys; print('{}.{}'.format(sys.version_info.major, sys.version_info.minor))")
  _site_packages="$pkgdir/usr/lib/python${_python_version}/site-packages"
  
  # Install cloudscraper with dependencies
  pip install --root="$pkgdir" \
    --no-warn-script-location \
    --ignore-installed \
    cloudscraper>=1.2.71
  
  # Remove packages that are provided by system packages to avoid conflicts
  # These will be available at runtime from system packages
  # Note: Keep requests_toolbelt, pyparsing, and certifi as they're not system packages
  rm -rf "$_site_packages/requests" "$_site_packages/requests-"*.dist-info \
         "$_site_packages/urllib3" "$_site_packages/urllib3-"*.dist-info \
         "$_site_packages/idna" "$_site_packages/idna-"*.dist-info \
         "$_site_packages/charset_normalizer" "$_site_packages/charset_normalizer-"*.dist-info \
         "$_site_packages/typing_extensions" "$_site_packages/typing_extensions-"*.dist-info \
         "$_site_packages/soupsieve" "$_site_packages/soupsieve-"*.dist-info \
         "$_site_packages/beautifulsoup4" "$_site_packages/beautifulsoup4-"*.dist-info \
         "$_site_packages/bs4" "$_site_packages/argcomplete" "$_site_packages/argcomplete-"*.dist-info 2>/dev/null || true
  
  # Remove conflicting binaries
  rm -f "$pkgdir/usr/bin/normalizer" 2>/dev/null || true
  
  # Install the package itself using setup.py (without installing dependencies)
  # setuptools will handle the entry point correctly
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  
  # Remove egg-info requires.txt to prevent automatic dependency detection
  rm -f "$pkgdir/usr/lib/python${_python_version}/site-packages/eksisozluk_scraper"*.egg-info/requires.txt 2>/dev/null || true
  
  # Install fish completion
  install -Dm644 completions/eksisozluk-scraper.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/eksisozluk-scraper.fish"
  
  # Install bash completion (use the pre-written file as fallback)
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -m644 debian/eksisozluk-scraper.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/eksisozluk-scraper" 2>/dev/null || true
  
  # Generate bash completion using argcomplete (overwrites the file if successful)
  # This requires the script to be installed first, so we do it after package installation
  # Use system argcomplete, not the one in pkgdir
  if [ -f "$pkgdir/usr/bin/eksisozluk-scraper" ]; then
    PYTHONPATH="$pkgdir/usr/lib/python${_python_version}/site-packages" \
    PATH="$pkgdir/usr/bin:$PATH" \
      python -m argcomplete.register-python-argcomplete eksisozluk-scraper \
      > "$pkgdir/usr/share/bash-completion/completions/eksisozluk-scraper" 2>/dev/null || true
  fi
  
  # Generate zsh completion using argcomplete
  install -d "$pkgdir/usr/share/zsh/site-functions"
  if [ -f "$pkgdir/usr/bin/eksisozluk-scraper" ]; then
    PYTHONPATH="$pkgdir/usr/lib/python${_python_version}/site-packages" \
    PATH="$pkgdir/usr/bin:$PATH" \
      python -m argcomplete.register-python-argcomplete --shell=zsh eksisozluk-scraper \
      > "$pkgdir/usr/share/zsh/site-functions/_eksisozluk-scraper" 2>/dev/null || true
  fi
}

# vim:set ts=2 sw=2 et:

