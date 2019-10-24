# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=5.5.2
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python>=3.5' 'python-pillow>=5.2.0' 'python-psutil>=5.0.0' 'python-pyqt5>=5.6.0' 'python-raven>=6.0.0' 'python-slugify>=1.2.1')
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'p7zip: for zip/CBZ, rar/CBZ, 7z/CB7 support'
)
source=(kindlecomicconverter.desktop
        https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('f25b30fbc1bc1db491173215fe411789'
         '483f06333bbae8e0f4c28252487b9d97')
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            '7b45fcdf0149bea36e8c738e76031790c8c235c777047001279698a526be892b')

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
