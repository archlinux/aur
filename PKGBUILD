# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=Amulet-NBT
_lowername=${_name,,}
_pyname=${_lowername/-/_}
pkgname=python-$_lowername
pkgver=2.1.3
_commit=06f49526d9a4425205941471b5d614f687c42756
pkgrel=1
pkgdesc='A Python and Cython library for reading and writing binary NBT and stringified NBT'
arch=('x86_64')
url="https://github.com/Amulet-Team/$_name"
license=('LicenseRef-Amulet-Team-1.0.0')
depends=('python' 'python-mutf8' 'python-numpy')
makedepends=('cython' 'git' 'python-build' 'python-installer' 'python-setuptools' 'python-versioneer' 'python-wheel')
# tests directory isn't in pypi sdist
# github tarball has unstable hash due to https://github.com/Amulet-Team/Amulet-NBT/blob/61cb6fe0c614b95ee75868ff85677284e2b3cb74/amulet_nbt/_version.py#L27
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd "$_name"

  # expand placeholders
  git archive --format tar HEAD amulet_nbt/_version.py | tar -x

  # use current versioneer
  sed -Ei 's/(versioneer)-518/\1/' pyproject.toml
}

build() {
  cd "$_name"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_name"

  # based on https://wiki.archlinux.org/title/Python_package_guidelines#Check
  # build directory needs to be before script directory
  CARCH="$CARCH" python -c 'import os, sys; sys.path.insert(0, f"{os.getcwd()}/build/lib.linux-{os.environ['\''CARCH'\'']}-cpython-" + "".join(map(str, sys.version_info[:2]))); from unittest import __main__' discover -s tests
}

package() {
  cd "$_name"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # https://wiki.archlinux.org/title/Python_package_guidelines#Using_site-packages
  local _site_packages="$(python -c 'import site; print(site.getsitepackages()[0])')"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  local _license_path="$_site_packages/$_pyname-$pkgver.dist-info/LICENSE"
  [ -f "$pkgdir/$_license_path" ] || { echo "License file not found"; exit 1; }
  ln -s "$_license_path" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
