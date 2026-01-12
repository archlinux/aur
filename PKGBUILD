# Maintainer: Peter Justin <peter.justin@outlook.com>
pkgname=d2rloader
pkgver=1.4.0
pkgrel=1
pkgdesc="Cross-platform Diablo 2 Resurrected Loader written in Python/Qt "
arch=('any')
url="https://github.com/sh4nks/d2rloader"
license=('MIT')
depends=(
  'pyside6'
  'python-psutil'
  'python-pydantic'
  'python-unidecode'
  'python-loguru'
  'python-pluggy'
  'umu-launcher'
  'wmctrl'
)
optdepends=(
  'gamemode: use gamemode to run D2R instances'
)
provides=("d2rloader")
conflicts=("d2rloader")

makedepends=('python-hatch' 'python-installer')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sh4nks/d2rloader/archive/v${pkgver}.tar.gz")
sha256sums=('3efe57bf7644dfd8697545fca7e50d8b0ec902a3710af8d5c70b0f60c9f03ef5')

prepare() {
  cd "$pkgname-$pkgver"
  wheels=$(ls dist/*.whl 2> /dev/null | wc -l)
  if [ "$wheels" != "0" ]; then
    rm dist/*.whl;
  fi
}

build() {
  cd "$pkgname-$pkgver"
  hatch build
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # link app icons to system folder
  for res in 256x256 128x128 64x64 48x48 32x32 16x16; do
    install -dm755 "${pkgdir}"/usr/share/icons/hicolor/${res}/apps
    install -Dm644 "./resources/icons/${res}/d2rloader.png" "${pkgdir}"/usr/share/icons/hicolor/${res}/apps/d2rloader.png
  done

  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 './resources/d2rloader.desktop' "$pkgdir/usr/share/applications/d2rloader.desktop"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "./resources/bin/d2rloader" "$pkgdir/usr/bin/d2rloader"
}
