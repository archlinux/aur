# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=5.4.4
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python>=3.5' 'python-pillow>=4.0.0' 'python-psutil>=5.0.0' 'python-pyqt5>=5.6.0' 'python-raven>=6.0.0' 'python-slugify>=1.2.1')
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('30581cf4b364ebdf8f1e0ad654b7b059')
sha256sums=('d1fda01c135c47de1e2ea9af4c3a2f9de426459662270798c6810768646a59b9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Patch desktop file
  sed -i 's#kindlecomicconverter/comic2ebook#pixmaps/kcc#' other/linux/kindlecomicconverter.desktop
}

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
  install -Dm644 other/linux/kindlecomicconverter.desktop "$pkgdir/usr/share/applications/kindlecomicconverter.desktop"
  install -Dm644 icons/comic2ebook.png "$pkgdir/usr/share/pixmaps/kcc.png"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/docs/${pkgname}/README.md"
}
