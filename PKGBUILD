# Maintainer: Peter Justin <peter.justin@outlook.com>
pkgname=d2rloader-git
_pkgname=d2rloader
pkgver=v1.1.0.r6.g0860c63
pkgrel=1
pkgdesc="Cross-platform Diablo 2 Resurrected Loader written in Python/Qt "
arch=('any')
url="https://github.com/sh4nks/d2rloader"
license=('MIT')
depends=(
  'git'
  'pyside6'
  'python-psutil'
  'python-pydantic'
  'python-unidecode'
  'python-loguru'
  'lutris'
)

provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")

makedepends=('python-hatch')

source=(
  "${_pkgname}::git+https://github.com/sh4nks/d2rloader.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
}

build() {
  cd "$_pkgname"
  hatch build
}

check() {
  cd "$_pkgname"

  echo $(pwd)
  desktop-file-validate resources/*.desktop
  #appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
  appstreamcli validate --no-net resources/*.appdata.xml ||:
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm755 "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm644 "resources/icons/d2rloader.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/d2rloader.svg"

  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 'resources/d2rloader.desktop' "$pkgdir/usr/share/applications/d2rloader.desktop"

  install -dm755 "$pkgdir/usr/bin"
  install -Dm755 "resources/bin/d2rloader" "$pkgdir/usr/bin/d2rloader"
}
