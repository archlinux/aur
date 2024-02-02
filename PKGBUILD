# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=5.7.0
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
md5sums=('f25b30fbc1bc1db491173215fe411789'
         '65a05eee431fe29c731997bc4f86c868')
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            'ad88b6b73f7e404ae5e834325fc611c9f9683bcfba4ecf97b4e9858399d2b313')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
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
  install -Dm644 "$srcdir/kindlecomicconverter.desktop" "$pkgdir/usr/share/applications/kindlecomicconverter.desktop"
  install -Dm644 icons/comic2ebook.png "$pkgdir/usr/share/pixmaps/kcc.png"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/docs/${pkgname}/README.md"
}
