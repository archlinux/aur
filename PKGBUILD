# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Rafael Cavalcanti <rccavalcanti at gmail dot com>
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: x-demon
pkgname=nicotine-plus-git
_app_id=org.nicotine_plus.Nicotine
pkgver=3.3.10.r370.g8b1e752
pkgrel=1
pkgdesc="A graphical client for the SoulSeek peer-to-peer system"
arch=('any')
url="https://nicotine-plus.org"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'libadwaita: for Adwaita theme on GNOME'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'python-pytest'
)
provides=("${pkgname%-git}" 'nicotine+' 'nicotine')
conflicts=("${pkgname%-git}" 'nicotine+' 'nicotine')
source=('git+https://github.com/Nicotine-Plus/nicotine-plus.git')
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

  # Tests requiring an Internet connection are disabled
  pytest --deselect=test/unit/test_version.py

  desktop-file-validate "data/${_app_id}.desktop"
  appstreamcli validate --no-net "data/${_app_id}.appdata.xml"
}

package() {
  cd "${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
