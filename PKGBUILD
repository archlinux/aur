# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-spookyhash-git
pkgver=r50.0278a00
pkgrel=2
pkgdesc="A Python wrapper for SpookyHash version 2."
arch=('x86_64')
url="https://github.com/buhanec/spookyhash"
license=('BSD')
provides=('python-spookyhash')
conflicts=('python-spookyhash')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-psutil')
depends=('python')
source=("git+https://github.com/buhanec/spookyhash.git"
        "fix-numpy-default-int.patch")
md5sums=('SKIP'
    '39f81e3f9930dd3fbfe0c574ff61ac69')

prepare() {
  cd spookyhash
  patch -Np1 -i "${srcdir}/fix-numpy-default-int.patch"
}

pkgver() {
  cd spookyhash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd spookyhash
  python setup.py build_ext --inplace
  PYTHONPATH="$PWD" pytest -v
}


package() {
  cd spookyhash
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
