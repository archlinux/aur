# Maintainer: anlorsp <anlor[at]anlor[dot]top>
pkgname=nvtray-git
pkgver=0.r15.72d3b15
pkgrel=1
pkgdesc="Linux tray application for ejecting NVIDIA GPU from PCI bus"
arch=('x86_64' 'aarch64')
url="https://github.com/chenxiex/nvtray"
license=('GPL3')
depends=(
  'python'
  'python-pyudev'
  'python-gobject'
  'libappindicator'
  'polkit'
  'python-notify2'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'gettext'
)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  for po_file in src/nvtray/locales/*/LC_MESSAGES/nvtray.po; do
    msgfmt "$po_file" -o "${po_file%.po}.mo"
  done

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="${pkgdir}" --prefix=/usr dist/*.whl
}
