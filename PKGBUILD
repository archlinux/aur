# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-nautilus
_pkgname=${pkgname%-nautilus}
pkgver=0.3.2
pkgrel=1
pkgdesc="Change your folder color in Nautilus"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('python-nautilus')
makedepends=('git' 'dpkg' 'python-build' 'python-distutils-extra' 'python-installer'
             'python-setuptools' 'python-wheel')
conflicts=("$_pkgname-bzr" 'folder-color-common')
replaces=('folder-color-common')
_commit=b52534562cc4a69eb56982bc9c14e0efc61fd0ee  # 0.3.2
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  dpkg-parsechangelog --show-field Version
}

build() {
  cd "$srcdir/$_pkgname"

  pushd install-scripts
  ./nautilus.sh GTK4
  popd

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "$pkgdir/usr/share/icons"
  cp -r icons/* "$pkgdir/usr/share/icons/"

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}/usr/share/nautilus-python" "$pkgdir/usr/share/"
  rm -rf "${pkgdir}${site_packages}/usr/"
}
