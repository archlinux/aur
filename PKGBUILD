# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=5.8.24
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(x86_64)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-darkdetect
  python-pillow
  python-pyqt6
  sh
)
makedepends=(
  python-build
  python-installer
  python-pip
  python-wheel
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('c71e6f41d9a7758adcdcbe975dacc7988554f19b51f347f6dccb91f1759e242b11903ecdfcfaa424f991cd419cdfe3df7f20253671f35be033759c1b6526f597')
b2sums=('65051e8cb833c03a7b178a0d304fbafd7980ab9442c7bff25c9b1729e4e6bd2d3297e20c947924a0894518f581019c77825c973c80b858e187faa87c5d7e9635')

prepare() {
  #Making launching app more secure
  sed -i "s|^Exec=$pkgname|Exec=/usr/bin/$pkgname|" "$srcdir"/Improve-ImgSLI-$pkgver/build/AUR-template/$pkgname.desktop
}

build() {
  pip install --target="$srcdir/Improve-ImgSLI-$pkgver/src/vendor-libs" PyQt6-Frameless-Window PyQt6-Fluent-Widgets
}

package() {
  cd "$srcdir"/Improve-ImgSLI-$pkgver/src
  install -vDm 755 ../build/AUR-template/launcher.sh         "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 Improve_ImgSLI.py                      -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 clickable_label.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_comparison_app.py                -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 translations.py                        -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 settings_dialog.py                     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 assets/circle_mask.png                 -t "$pkgdir"/usr/lib/$pkgname/assets/
  install -vDm 644 font/SourceSans3-Regular.ttf           -t "$pkgdir"/usr/lib/$pkgname/font/
  install -vDm 644 ../build/AUR-template/$pkgname.desktop -t "$pkgdir"/usr/share/applications/
  install -vDm 644 icons/icon.png                            "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -vDm 644 ../LICENSE.txt                            "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -vdm 755 "$pkgdir"/usr/lib/$pkgname/vendor-libs
  cp      -r       vendor-libs/*                             "$pkgdir"/usr/lib/$pkgname/vendor-libs/

  cd "$srcdir"/Improve-ImgSLI-$pkgver/src/services
  install -vDm 644 event_handler.py                       -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 image_processing_worker.py             -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 logging_service.py                     -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 main_controller.py                     -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 settings_manager.py                    -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 state_manager.py                       -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 ui_logic.py                            -t "$pkgdir"/usr/lib/$pkgname/services/
  install -vDm 644 utils.py                               -t "$pkgdir"/usr/lib/$pkgname/services/

  cd "$srcdir"/Improve-ImgSLI-$pkgver/src/processing_services
  install -vDm 644 image_drawing.py                       -t "$pkgdir"/usr/lib/$pkgname/processing_services/
  install -vDm 644 image_io.py                            -t "$pkgdir"/usr/lib/$pkgname/processing_services/
  install -vDm 644 image_resize.py                        -t "$pkgdir"/usr/lib/$pkgname/processing_services/
}
