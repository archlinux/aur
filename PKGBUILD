# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=kcc
pkgver=5.3
_pkgver=5.3.0
pkgrel=1
pkgdesc="Kindle Comic Converter converts comic files or folders to ePub or Panel View MOBI"
arch=(any)
url="https://github.com/ciromattia/kcc"
license=('ISC')
depends=('python>=3.5' 'python-pillow>=3.2.0' 'python-psutil>=4.1.0' 'python-pyqt5>=5.6.0' 'python-raven>=5.13.0' 'python-slugify>=1.2.0')
makedepends=('zip')
optdepends=(
  'kindlegen>=2.9: for .mobi generation'
  'unrar: for CBR/RAR support'
  'p7zip: for 7z/CB7 support'
)
source=(https://github.com/ciromattia/$pkgname/archive/$pkgver.tar.gz)
md5sums=('565acf61295a04410f3d7edd57bfdc11')
sha256sums=('2b119956d9a7ed0ea17990d2752d3dfc4c5c6140880fd79d45fa8bf0ecd01b24')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build_binary --pyz

  # Patch desktop file
  sed -i 's#kindlecomicconverter/comic2ebook#pixmaps/kcc#' other/linux/kindlecomicconverter.desktop

  # Madness...
  mkdir -p dist/"${pkgver}"
  cd dist/"${pkgver}"
  tar xf ../KindleComicConverter_linux_"${_pkgver}".tar.gz
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"

  # Desktop file
  install -Dm644 other/linux/kindlecomicconverter.desktop "$pkgdir/usr/share/applications/kindlecomicconverter.desktop"

  # "Built" files
  cd "dist/${pkgver}"

  for f in kcc kcc-c2e kcc-c2p; do
    install -Dm755 "$f" "$pkgdir/usr/bin/$f"
  done
  install -Dm644 kcc.png "$pkgdir/usr/share/pixmaps/kcc.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/docs/${pkgname}/README.md"
}
