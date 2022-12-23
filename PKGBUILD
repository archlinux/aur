# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
pkgname=kcc-beta
_pkgver=5.5.3-beta-darodi.17
pkgver=5.5.3+beta+darodi.17
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
        kcc-slugify.patch
        https://github.com/darodi/kcc/archive/refs/tags/v${_pkgver}.tar.gz)
md5sums=('f25b30fbc1bc1db491173215fe411789'
         '6c42b8ca8db09b62208a0819b11cff28'
         'f77e175d635cb0431df9aa0a30be602c')
sha256sums=('3502c38d756f5a812ac06f63fe25e062d8720f620ffd7d25641e6accef9fdd9f'
            '3043a7652f4b177340df350fbe63d59c82f91eeb8697964bbd960ae38aa290d3'
            '38896e853f6ed418e6ab2f6e6b35644e66314f87d391ef16e5270f703e365088')

prepare() {
  cd "$srcdir/kcc-${_pkgver}"
  patch -p1 < "$srcdir"/kcc-slugify.patch
}

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
