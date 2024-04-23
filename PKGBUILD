# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=6.0.0
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=(
  'python>=3.11'
  'pyside6>=6.5.1'
  'python-distro'
  'python-mozjpeg-lossless-optimization>=1.1.2'
  'python-natsort>=8.4.0'
  'python-pillow>=9.0.0'
  'python-psutil>=5.9.5'
  'python-raven>=6.0.0'
  'python-requests>=2.31.0'
  'python-slugify'
)
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'p7zip: for zip/CBZ, rar/CBZ, 7z/CB7 support'
)
makedepends=('python-setuptools')
source=(kindlecomicconverter.desktop
        https://github.com/ciromattia/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            'a84e52bcd568a497a70dc0230309ca8e41b7c3a85095ecb3600d77d5f795629e')
b2sums=('c6f59ebe0f5ec03b83c258226459b0f044726776b35a37535daeed497743bb12d35de180a7ffdb9a7215ba3bfb69dfaa29eb570955b19af011743ffa72229fe9'
        '01ae1a4e306d82a6045fed90d1204e769a37483e27b191274a883455044bdaf2c81b47b7fb956a405977846176bbaf10942a1d84d5a6a5f4964ac927a42118a1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  # Install by hand. I don't want to use Docker to use fpm to build a Debian package…
  python setup.py install --root="$pkgdir/"

  # For some reason there's an error with PyQt5 not being detected by setuptools. So… hack.
  find "$pkgdir" -name requires.txt -delete

  # Install other required files
  install -Dm644 "$srcdir/kindlecomicconverter.desktop" "$pkgdir/usr/share/applications/kindlecomicconverter.desktop"
  install -Dm644 icons/comic2ebook.png "$pkgdir/usr/share/pixmaps/kcc.png"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/docs/${pkgname}/README.md"
}
