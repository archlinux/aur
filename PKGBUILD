# Contributor: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=PyMCTranslate
_pkgname=python-${_name,,}
pkgname=$_pkgname-git
pkgver=1.2.22.r10.g3edad53b
pkgrel=2
pkgdesc='A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format - git version'
arch=('any')
url="https://github.com/gentlegiantJGC/$_name"
license=('LicenseRef-Amulet-Team-1.0.0')
depends=('python' 'python-amulet-nbt' 'python-numpy')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-versioneer' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_name"

  # use current versioneer
  sed -Ei 's/(versioneer)-518/\1/' pyproject.toml
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"

  python -m unittest discover -s tests
}

package() {
  cd "$_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # https://wiki.archlinux.org/title/Python_package_guidelines#Using_site-packages
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  local _license_path="$_site_packages/$_name-$(python -c 'import PyMCTranslate; print(PyMCTranslate._version.get_versions()["version"])').dist-info/LICENSE"
  [ -f "$pkgdir/$_license_path" ] || { echo "License file not found"; exit 1; }
  ln -s "$_license_path" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
