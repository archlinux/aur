# Maintainer: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pytype
pkgver=2024.03.19
pkgrel=1
pkgdesc='A static type analyzer for Python code'
arch=('x86_64' 'aarch64')
url='https://google.github.io/pytype/'
license=('MIT' 'Apache-2.0')
depends=(
  'python'
  'python-attrs'
  'python-importlab'
  'python-immutabledict'
  'python-jinja'
  'python-libcst'
  'python-networkx'
  'python-pycnite'
  'python-msgspec'
  'ninja'
  'python-pydot'
  'python-tabulate'
  'python-toml'
  'python-typing_extensions'
  'python-typed-ast' # only for <3.8
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
  'pybind11'
)
_commit='9b2497032e8b6760284832c685149106eee89bc6'
source=(
  "$pkgname::git+https://github.com/google/pytype#commit=$_commit"
  'github.com-python-typeshed::git+https://github.com/python/typeshed'
  'remove-version-constraints.patch'
  'use-system-ninja.patch'
)
b2sums=('SKIP'
  'SKIP'
  'ba1a652756d994f50159e60f8a8358d1c4d36707a2c8cf5dbd5f99fd3a99a37011bd3ce765da894404f4f0f2d292dfad0855da5959c945a57e99e556801cb83b'
  'd6caa9330aa1beea03279b631d47dd5e221c8e2b05d80b184404a443d5cae4dadf2ce1183fcdbc8cbda2b09efa9ce47b07a4e750a8e6581207c331fc0cad2691')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # remove version constraints from setup.cfg
  patch -p1 -i "$srcdir/remove-version-constraints.patch"

  # use system ninja
  patch -p1 -i "$srcdir/use-system-ninja.patch"

  # setup git submodules
  # only typeshed - rely on system pybind11
  git submodule init typeshed
  git config submodule.typeshed.url "$srcdir/github.com-python-typeshed"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
