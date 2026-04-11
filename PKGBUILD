# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=folder-color-nautilus
_pkgname=${pkgname%-nautilus}
pkgver=0.4.2
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
_commit=45480ec319c3ba5032f0a5e89d2af728d9dd464f
source=("git+https://github.com/costales/folder-color.git#commit=${_commit}")
sha256sums=('244a8b2ab1581c9d7f557b9d419940dd623102481b2a20a10e2f8ea676ca6bcf')

prepare() {
  cd "${_pkgname}"
  git clean -dfx
}

build() {
  cd "${_pkgname}"
  pushd install-scripts
  ./nautilus.sh
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
