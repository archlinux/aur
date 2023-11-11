# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
pkgname=kcc-beta
_pkgver=5.7.0b1
pkgver=5.7.0+beta+1
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/darodi/kcc"
license=('ISC')
depends=('python' 'python-pillow' 'python-psutil' 'python-pyqt5' 'python-raven' 'python-slugify' 'python-mozjpeg-lossless-optimization')
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'p7zip: for zip/CBZ, rar/CBZ, 7z/CB7 support'
)
makedepends=('python-setuptools')
provides=(kcc)
conflicts=(kcc)
source=(kindlecomicconverter.desktop
        https://github.com/darodi/kcc/archive/refs/tags/v${_pkgver}.tar.gz)
md5sums=('f25b30fbc1bc1db491173215fe411789'
         'cdc33719778b4ad42ba5e764a21373d3')
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            '6c2879e26d8eb1ae463fac80e270ca823e4dfa7a6c8ffe3993c3c00eec797766')

build() {
  cd "$srcdir/kcc-${_pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/kcc-${_pkgver}/"

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
