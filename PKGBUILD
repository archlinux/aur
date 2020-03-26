# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=python-tensorflow-compression-git
pkgver=1.3+15+gf09afc8
pkgrel=1
pkgdesc="Data compression in TensorFlow"
url="https://tensorflow.org/"
license=('APACHE')
arch=('any')
depends=('python-tensorflow' 'python-scipy' 'python-tensorflow-probability')
source=('git+https://github.com/tensorflow/compression' 'arch_compression.patch')
sha256sums=('SKIP' '6cd78cc30df532ced025c70e11946b89f80e1f38d1a14331dab96e04de90ba90')
_name=compression

pkgver() {
  cd ${srcdir}/${_name}
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() { 
    cd ${_name}
    patch --forward --strip=1 --input="${srcdir}/${source[1]}"
}

build() {
  cd ${srcdir}/${_name}
  bazel --output_user_root "${srcdir}/build" run -c opt :build_pip_pkg
}

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${srcdir}/whl/*.whl
}



# vim:set ts=2 sw=2 et:

