# Maintainer: Peter Justin <peter.justin@outlook.com>
pkgname=d2rloader
pkgver=1.3.6
pkgrel=2
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
  'lutris'
  'wmctrl'
)
optdepends=(
  'gamemode: use gamemode to run D2R instances'
)
provides=("d2rloader")
conflicts=("d2rloader")

makedepends=('python-hatch' 'python-installer')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sh4nks/d2rloader/archive/v${pkgver}.tar.gz")
sha256sums=('307b9989030163ab765f259821d6cf25418759f9ac307ca2419ab2a84387c16f')

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
