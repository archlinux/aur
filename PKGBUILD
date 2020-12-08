# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=fbu
pkgver=0.7.7
pkgrel=1
pkgdesc="Firmware and BIOS Utilities (FBU)"
arch=('any')
url="https://github.com/intel/iotg-fbu"
license=('BSD')
depends=(
  'python'
  'python-setuptools'
  'python-click'
  'python-cryptography'
)
optdepends=(
  'openssl: for handling signatures'
)
provides=("$pkgname")
options=(!emptydirs)
source=(
    https://github.com/intel/iotg-$pkgname/archive/v$pkgver.tar.gz
    setup.py
)
sha512sums=('092f0ec098467ff90bf94824775efd0d3401a6cb9a830c13f9ccfe0dba4a6e128c4c9fbb5b518f839aaa304d5dc9af5a86bceb0c292304ff36f5ab994d16a585'
            'e111cfc8f94b9772ebdb2cfcee6b955fbc506ec1f10fc29f164b82eba2af440686ead43aa79a19a86d866405bf2e74351b613533d24475c4b69049a7286f35b4')

package() {
  cd "$srcdir/iotg-${pkgname}-$pkgver"
  mv ../setup.py .
  mv siiptool/scripts/* siiptool/
  sed -i "s#common#siiptool.common#" siiptool/*.py
  sed -i "s#common#siiptool.common#" siiptool/common/*.py
  touch siiptool/thirdparty/__init__.py
  sed -i "#sys.path.insert#d" siiptool/*.py
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
