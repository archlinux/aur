# Maintainer: Peter Justin <peter.justin@outlook.com>
pkgname=d2rloader-git
_pkgname=d2rloader
pkgver=v1.2.0.r1.g95a2a8c
pkgrel=3
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
  if [ -f "dist/*.whl" ]; then rm dist/*.whl; fi
}

build() {
  cd "$_pkgname"
  hatch build
}

check() {
  cd "$_pkgname"

  desktop-file-validate resources/*.desktop
  #appstream-util validate-relax --nonet share/metainfo/*.appdata.xml
  appstreamcli validate --no-net resources/*.appdata.xml ||:
}

package() {
  cd "$_pkgname"
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
