# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hatch-vcs
pkgver=0.2.0
pkgrel=1
pkgdesc="Hatch plugin for versioning with your preferred VCS"
url="https://github.com/ofek/hatch-vcs"
license=('MIT')
arch=('any')
depends=('python38-hatchling' 'python38-setuptools-scm')
makedepends=('python38-build' 'python38-installer')
checkdepends=('python38-pytest' 'git')
source=("https://github.com/ofek/hatch-vcs/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        $pkgname-setuptools-scm-7.patch::https://github.com/ofek/hatch-vcs/pull/9.patch)
sha512sums=('1c3627240ef5b659b9d87a69c84dd71cac4c83758f5be676e808377400383e996209cf6eabb1222f5330c0a97f0d261ced1eb9dc40e1d5c2bb2fc708659360eb'
            'd4d01c7ce2027f6fa698ab918f4ba6e399472622361fdfa818f10c196dd5cf6bf11ff8e4439f3dd866e7b3d5f2b2b00aea9f8405b3a93f1ac6c647375fe8de8c')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

prepare() {
  cd hatch-vcs-$pkgver
  patch -p1 -i ../$pkgname-setuptools-scm-7.patch
}

build() {
  cd hatch-vcs-$pkgver
  python3.8 -m build -nw
}

check() {
  cd hatch-vcs-$pkgver
  python3.8 -m installer --destdir=tmp_install dist/*.whl
  SETUPTOOLS_SCM_PRETEND_VERSION= PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages" pytest
}

package() {
  cd hatch-vcs-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
