# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keep-me-awake
_app_id=de.swsnr.keepmeawake
pkgver=2.1.1
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
sha256sums=('ed652bc6a1073e4fe5d0bc59e560f38210fa73bd948d1b411e2943010fd202c5')

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
