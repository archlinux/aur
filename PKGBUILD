# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=folder-color-nemo
_pkgname=${pkgname%-nemo}
pkgver=0.2.7
pkgrel=1
pkgdesc="Change your folder color in Nemo"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL3')
depends=('nemo-python')
makedepends=('git' 'dpkg' 'python-build' 'python-distutils-extra' 'python-installer'
             'python-setuptools' 'python-wheel')
conflicts=("$_pkgname-bzr" 'folder-color-common')
replaces=('folder-color-common')
_commit=f75be7281db5d77ee0231dccc440f69838628805  # 0.2.7
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  dpkg-parsechangelog --show-field Version
}

prepare() {
  cd "$srcdir/$_pkgname/install_scripts"
  ./nemo.sh
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}/usr/share/nemo-python" "$pkgdir/usr/share/"
  rm -rf "${pkgdir}${site_packages}/usr/"
}
