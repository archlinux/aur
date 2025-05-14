# Maintainer: SelfRef <arch@selfref.dev>

_basename=exscript
pkgname="python-${_basename}"
pkgver=2.6.30
pkgrel=4
pkgdesc="A Python module making Telnet and SSH easy"
arch=('any')
url="https://github.com/knipknap/exscript"
license=('MIT')
depends=(
	'python'
	'python-configparser'
	'python-pycryptodomex'
	'python-paramiko'
)
makedepends=('git' 'python-setuptools')
source=("${_basename}"::"git+https://github.com/knipknap/exscript.git#commit=9d5b035f3de4237dc6ecb7437b3ebd0c162bb6ec")
md5sums=('SKIP')

prepare() {
	cd ${_basename}
	# A hack untill https://github.com/knipknap/exscript/pull/243 is merged
	find . -type f -name "*.py" -exec sed -i '/from future import standard_library/d;/standard_library\.install_aliases()/d' {} +
	sed -i '/^future$/d' requirements.txt
	sed -i "s/'future', //" setup.py
	sed -i '/^    future$/d' tox.ini
}

build() {
	cd ${_basename}
	sed -i "s/DEVELOPMENT/$pkgver/" ./Exscript/version.py
	python setup.py build
}

package() {
	cd ${_basename}
	python setup.py install --root="$pkgdir" --optimize=1
}