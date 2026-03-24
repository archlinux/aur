# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keep-me-awake
_app_id=de.swsnr.keepmeawake
pkgver=2.1.0
pkgrel=1
pkgdesc="Inhibit screensaver and suspend in GNOME"
arch=('any')
url="https://codeberg.org/swsnr/keep-me-awake"
license=('EUPL-1.2')
depends=(
  'gtk4'
  'libadwaita'
  'libportal'
  'libportal-gtk4'
  'python-gobject'
  'python-packaging'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
source=("git+https://codeberg.org/swsnr/keep-me-awake.git#tag=v$pkgver")
sha256sums=('bc727bd93897c64a75fbbde32f4001223ad30783f68693210da455b07495e6ba')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  appstreamcli validate --no-net "${_app_id}.metainfo.xml"
  desktop-file-validate "${_app_id}.desktop"
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
