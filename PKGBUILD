# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jason Stryker <public at jasonstryker dot com>
pkgname=protontricks-git
pkgver=1.14.1.r6.g28cfc0c
pkgrel=1
pkgdesc="A simple wrapper that does winetricks things for Proton enabled games."
arch=('any')
url="https://github.com/Matoking/protontricks"
license=('GPL-3.0-only')
depends=(
  'python-pillow'
  'python-vdf'
  'winetricks'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'python-pytest'
)
optdepends=(
  'yad: for GUI'
  'zenity: fallback for GUI'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Matoking/protontricks.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${pkgname%-git}" clean -dfx
}

build() {
  cd "${pkgname%-git}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname%-git}"
  python -m venv --clear --without-pip --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest

  desktop-file-validate "src/${pkgname%-git}/data/share/applications"/*.desktop
  appstreamcli validate --no-net "data/com.github.Matoking.${pkgname%-git}.metainfo.xml"
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Remove protontricks-desktop-install, since we already install
  # desktop files properly
  rm -v "$pkgdir/usr/bin/${pkgname%-git}-desktop-install"
}
