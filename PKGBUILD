# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=keep-me-awake
_app_id=de.swsnr.keepmeawake
pkgver=2.1.4
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
sha256sums=('03cce57ede07170978120cf6ef6cd36b363adf89c6bdf972d13d50ac635e08e3')

build() {
  cd "$pkgname"

  # Skip dependency check as it can't find blueprint-compiler
  # even though we have it
	python -m build --wheel --skip-dependency-check --no-isolation
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
