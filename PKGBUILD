# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=folder-color-nautilus
_pkgname=${pkgname%-nautilus}
pkgver=0.4.1
pkgrel=2
pkgdesc="Change your folder color in Nautilus"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL-3.0-or-later')
depends=('python-nautilus')
makedepends=(
  'git'
  'python-build'
  'python-distutils-extra'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
conflicts=('folder-color-bzr' 'folder-color-common')
_commit=67428606aa802e624b5b783f9f06f8bd724ae56c  # 0.4.1
source=("git+https://github.com/costales/folder-color.git#commit=${_commit}")
sha256sums=('f1d36bbef81a356f9d84324b39d5201256204a23754d79ceeb441798c755bd03')

build() {
  cd "${_pkgname}"

  pushd install-scripts
  ./nautilus.sh GTK4
  popd

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/icons"
  cp -r icons/* "$pkgdir/usr/share/icons/"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}/usr/share/nautilus-python" "$pkgdir/usr/share/"
  rm -rf "${pkgdir}${site_packages}/usr/"
}
