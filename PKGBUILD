# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=folder-color-nemo
_pkgname=${pkgname%-nemo}
pkgver=0.4.1
pkgrel=1
pkgdesc="Change your folder color in Nemo"
arch=('any')
url="https://github.com/costales/folder-color"
license=('GPL-3.0-or-later')
depends=('nemo-python')
makedepends=('git' 'dpkg' 'python-build' 'python-distutils-extra' 'python-installer'
             'python-setuptools' 'python-wheel')
conflicts=("$_pkgname-bzr" 'folder-color-common')
replaces=('folder-color-common')
_commit=67428606aa802e624b5b783f9f06f8bd724ae56c  # 0.4.1
source=("git+https://github.com/costales/folder-color.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  dpkg-parsechangelog --show-field Version
}

build() {
  cd "$_pkgname"

  pushd install-scripts
  ./nemo.sh GTK3
  popd

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  mv "${pkgdir}${site_packages}/usr/share/nemo-python" "$pkgdir/usr/share/"
  rm -rf "${pkgdir}${site_packages}/usr/"
}
