# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=7.9.0
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-darkdetect
  python-markdown
  python-numpy
  python-pillow
  python-pyqt6
  python-scikit-image
  python-wand
  sh
)
makedepends=(
  python-build
  python-installer
  python-pip
  python-wheel
)
optdepends=(
  'python-desktop-notifier: enhanced system notifications'
  'python-snakeviz: for performance profiling'
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('2fc0f0f054d3c0922508a9f6266e29d9b965daabad7a99012ba848cfcfce87aea2315a93c6d2b9cc47dee59b836aeae0ff967b74a87e4c3a3001bd6c244d8060')
b2sums=('e8ae6f6f08cea09f979448bcb153449320ac27fd8f4897e269b94572c8a5650a75364b51123f47d9066ebaf2a73c1bfc71a95e5ac64f420f1ef4283399125dc4')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=$pkgname|Exec=/usr/bin/$pkgname|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

package() {
  cd "$srcdir"/Improve-ImgSLI-$pkgver
  install -vDm 755 build/AUR-template/launcher.sh          "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 build/AUR-template/$pkgname.desktop  -t "$pkgdir"/usr/share/applications/
  install -vDm 644 src/resources/icons/icon.png            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 LICENSE.txt                             "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  cd "$srcdir"/Improve-ImgSLI-$pkgver/src
  find . -type f -exec install -vDm 644 "{}"               "$pkgdir/usr/lib/$pkgname/{}" \;

  #Fix permisiions and clean temp files
  find "$pkgdir"/usr/lib/$pkgname -name "*.bak" -delete
  chmod +x "$pkgdir"/usr/lib/$pkgname/shared_toolkit/scripts/common_launcher_funcs.sh
}
