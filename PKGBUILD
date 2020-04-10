# Maintainer: trougnouf (Benoit Brummer) <trougnouf@gmail.com>

pkgname=tensorboard-plugin-wit
pkgver=1.6.0
pkgrel=2
pkgdesc="What-If Tool TensorBoard plugin"
url="https://github.com/PAIR-code/what-if-tool"
license=('APACHE')
arch=('any')
depends=('python-tensorflow' 'tensorboard' 'python-werkzeug')
makedepends=('bazel')
_commit='2cee8a42598cb2342a04577d583ce1985a794edd'
source=("git+${url}#commit=${_commit}" 'destdir.patch')
sha256sums=('SKIP'
            'ae32103e068471eec0ce533feaaed94511f4f2a0274e55d798bfc08d97742af7')
_name=what-if-tool

prepare() { 
  cd ${_name}
  patch --forward --strip=1 --input="${srcdir}/${source[1]}"
}

build() {
  cd ${srcdir}/${_name}
  bazel --output_user_root "${srcdir}/build" run tensorboard_plugin_wit/pip_package:build_pip_package
}

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ${srcdir}/${_name}/wit-pip/release/dist/tensorboard_plugin_wit-${pkgver}-py3-none-any.whl
}

