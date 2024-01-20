# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=folder-color-caja
_pkgname=${pkgname%-caja}
pkgver=0.3.2
pkgrel=1
pkgdesc="Change your folder color in Caja"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL-3.0-or-later')
depends=('python-caja')
makedepends=('git' 'dpkg' 'python-build' 'python-distutils-extra' 'python-installer'
             'python-setuptools' 'python-wheel')
conflicts=("$_pkgname-bzr" 'folder-color-common')
replaces=('folder-color-common')
_commit=b52534562cc4a69eb56982bc9c14e0efc61fd0ee  # 0.3.2
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  dpkg-parsechangelog --show-field Version
}

build() {
  cd "$_pkgname"

  pushd install-scripts
  ./caja.sh GTK3
  popd

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}/usr/share/caja-python" "$pkgdir/usr/share/"
  rm -rf "${pkgdir}${site_packages}/usr/"
}
