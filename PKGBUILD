# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
pkgname=kcc-beta
pkgver=6.2.0b2
pkgrel=3
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/darodi/kcc"
license=('ISC')
depends=(
  'python'
  'pyside6'
  'python-pillow'
  'python-psutil'
  'python-requests'
  'python-slugify'
  'python-raven'
  'python-mozjpeg-lossless-optimization'
  'python-natsort'
  'python-distro'
  'python-setuptools'
  'python-packaging'
)
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'p7zip: for zip/CBZ, rar/CBZ, 7z/CB7 support'
)
makedepends=('python-setuptools')
provides=(kcc)
conflicts=(kcc)
source=(kindlecomicconverter.desktop
        https://github.com/darodi/kcc/archive/refs/tags/v${pkgver}.tar.gz)
md5sums=('f25b30fbc1bc1db491173215fe411789'
         'c38b66c6d8c2199ee0f20cfe18e26712')
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            '75146da16b0d850305fcc60097b7a071c95a4a0cceb0fcb1e36414b5dc7ea549')

build() {
  cd "$srcdir/kcc-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/kcc-${pkgver}/"

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

